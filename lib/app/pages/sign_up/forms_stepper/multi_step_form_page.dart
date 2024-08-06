/*import 'package:flutter/material.dart';
import 'form_step_1.dart';
import 'form_step_2.dart';

class MultiStepFormPage extends StatefulWidget {
  @override
  _MultiStepFormPageState createState() => _MultiStepFormPageState();
}

class _MultiStepFormPageState extends State<MultiStepFormPage> {
  final PageController _pageController = PageController();
  final Map<String, dynamic> _formData = {
    'noms': '',
    'dateNaissance': null,
    'typePiece': 'CNI',
    'motDePasse': '',
    'confirmerMotDePasse': '',
  };

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _onFormSaved(Map<String, dynamic> data) {
    setState(() {
      _formData.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo
            Image.asset(
              'assets/images/logo.png', // Chemin vers votre logo
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Inscrivez-vous !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Gérez parfaitement vos finances - Finalisez votre\ninscription en ajoutant les fichiers ci-dessous !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FormStep1(
                    onNext: _nextPage,
                    onFormSaved: _onFormSaved,
                  ),
                  FormStep2(
                    formData: _formData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'form_step_1.dart';
import 'form_step_2.dart';

class MultiStepFormPage extends StatefulWidget {
  @override
  _MultiStepFormPageState createState() => _MultiStepFormPageState();
}

class _MultiStepFormPageState extends State<MultiStepFormPage> {
  int _currentStep = 0;
  Map<String, dynamic> _formData = {
    'noms': '',
    'dateNaissance': null,
    'typePiece': '',
    'idPiece': '',
    'motDePasse': '',
    'confirmerMotDePasse': '',
    'isMinor': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscriptions'),
      ),
      body: Container(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep == 0) {
              // Valider l'étape 1
              _nextStep();
            } else if (_currentStep == 1) {
              // Soumission finale
              _submitForm();
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          steps: [
            Step(
              title: Text('Étape 1'),
              content: FormStep1(
                onNext: () {
                  setState(() {
                    _currentStep = 1;
                  });
                },
                onFormSaved: (data) {
                  setState(() {
                    _formData.addAll(data);
                    final age = DateTime.now().year - _formData['dateNaissance'].year;
                    _formData['isMinor'] = age < 18;
                  });
                },
              ),
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: Text('Étape 2'),
              content: FormStep2(
                isMinor: _formData['isMinor'] ?? false,
                onSubmit: () {
                  _submitForm();
                },
                onFormSaved: (data) {
                  setState(() {
                    _formData.addAll(data);
                  });
                },
              ),
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            ),
          ],
        ),
      ),
    );
  }

  void _nextStep() {
    setState(() {
      _currentStep += 1;
    });
  }

  Future<void> _submitForm() async {
    try {
      await FirebaseFirestore.instance.collection('users').add(_formData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Inscription réussie!')),
      );
      // Rediriger ou effectuer une action après l'inscription
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'inscription: $e')),
      );
    }
  }
}
