/*import 'package:flutter/material.dart';
import 'package:mobile_wallet/data/datasources/user_datasource.dart';
import '../../../library/common_widgets/app_logo.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/date_picker_field.dart';
import '../../widgets/dropdown_field.dart';
import 'upload_files_page.dart';

class SignUpFormPage extends StatefulWidget {
  @override
  _SignUpFormPageState createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  DateTime? _dob;
  String _idType = '';
  String _idNumber = '';
  String _password = '';
  String _confirmPassword = '';

  final UserDataSource _userDataSource = UserDataSource();

  //get isMinor => ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppLogo(),
              const SizedBox(height: 20),
              const Text(
                'Inscrivez-vous !',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Gérez parfaitement vos finances - Inscrivez-vous maintenant à notre plateforme Madis finance !',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFF1A1F31),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Nom et prénoms',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ce champ est obligatoire';
                          }
                          final words = value.trim().split(' ');
                          if (words.length < 2 || words.length > 5) {
                            return 'Le nom et prénom doivent comporter entre 2 et 5 mots';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value ?? '';
                        }, enabled: true,
                      ),
                      const SizedBox(height: 20),
                      DatePickerField(
                        label: 'Date de naissance',
                        icon: Icons.calendar_today,
                        onSaved: (value) {
                          _dob = value as DateTime?;
                        },
                      ),
                      const SizedBox(height: 20),
                      DropdownField(
                        label: 'Choix de la pièce',
                        icon: Icons.description,
                        items: ['CNI', 'Passeport', 'Permis de conduire'],
                        onSaved: (value) {
                          _idType = value ?? '';
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: 'ID de votre pièce',
                        icon: Icons.credit_card,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ce champ est obligatoire';
                          }
                          return null;
                        },
                        enabled: true,
                        onSaved: (value) {
                          _idNumber = value ?? '';
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: 'Mot de passe',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ce champ est obligatoire';
                          }
                          if (value.length < 6) {
                            return 'Le mot de passe doit comporter au moins 6 caractères';
                          }
                          return null;
                        },
                        enabled: true,
                        onSaved: (value) {
                          _password = value ?? '';
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: 'Confirmation du mot de passe',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ce champ est obligatoire';
                          }
                          if (value != _password) {
                            return 'Les mots de passe ne correspondent pas';
                          }
                          return null;
                        },
                        enabled: true,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();

                            // Enregistrer les données dans Firebase
                            await _userDataSource.saveUserData(
                              name: _name,
                              dob: _dob!,
                              idType: _idType,
                              idNumber: _idNumber,
                              password: _password,
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadFilesPage(),
                              ),
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text(
                            'Suivant',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */

/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/services/firestore/firestore_service.dart';
import '../../../core/services/firestore/user_model.dart';
//import '../../../data/datasources/user_datasource.dart';


class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  _SignUpFormPageState createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String _selectedIdType = 'Passeport';
  final List<String> _idTypes = ['Passeport', 'CNI', 'Permis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141724),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', height: 100),
              SizedBox(height: 20),
              Text(
                'Inscrivez-vous !',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: _nameController,
                labelText: 'Saisissez vos nom et prénoms',
                icon: Icons.person,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _yearController,
                      labelText: 'Année',
                      icon: Icons.calendar_today,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      controller: _monthController,
                      labelText: 'Mois',
                      icon: Icons.calendar_today,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      controller: _dayController,
                      labelText: 'Jour',
                      icon: Icons.calendar_today,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedIdType,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF1A1F31),
                  labelText: 'Sélectionnez votre type de pièce',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                ),
                dropdownColor: Color(0xFF1A1F31),
                items: _idTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedIdType = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: _idNumberController,
                labelText: 'Entrez l\'identifiant de votre carte',
                icon: Icons.credit_card,
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: _passwordController,
                labelText: 'Créez votre mot de passe',
                icon: Icons.lock,
                obscureText: true,
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: _confirmPasswordController,
                labelText: 'Confirmez votre mot de passe',
                icon: Icons.lock,
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: () async {
                  final String name = _nameController.text.trim();
                  final String year = _yearController.text.trim();
                  final String month = _monthController.text.trim();
                  final String day = _dayController.text.trim();
                  final String idNumber = _idNumberController.text.trim();
                  final String password = _passwordController.text.trim();
                  final String confirmPassword = _confirmPasswordController.text.trim();
                  final DateTime dob = DateTime(int.parse(year), int.parse(month), int.parse(day));

                  if (password != confirmPassword) {
                    // Show error message
                    return;
                  }

                  final newUser = User(
                    name: name,
                    dob: dob,
                    idType: _selectedIdType,
                    idNumber: idNumber,
                    password: password,
                  );

                  await Provider.of<FirestoreService>(context, listen: false).addUser(newUser);

                  Navigator.pushNamed(context, '/sign_up/upload_files');
                },
                child: Text('Suivant'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white54),
        filled: true,
        fillColor: Color(0xFF1A1F31),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white54),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
 */

/*import 'package:flutter/material.dart';



class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  _SignUpFormPageState createState() => _SignUpFormPageState();
}


class _SignUpFormPageState extends State<SignUpFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  String? _selectedYear;
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedIdType;

  // ...

  void _submitForm() async {
    final name = _nameController.text.trim();
    final idNumber = _idNumberController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // Validation des champs de date de naissance
    if (_selectedDay == null || _selectedMonth == null || _selectedYear == null) {
      _showErrorDialog('Veuillez sélectionner une date de naissance valide.');
      return;
    }

    int day, month, year;
    try {
      day = int.parse(_selectedDay!);
      month = int.parse(_selectedMonth!);
      year = int.parse(_selectedYear!);
    } catch (e) {
      _showErrorDialog('Veuillez entrer une date de naissance valide.');
      return;
    }

    final dateNaissance = DateTime(year, month, day);

    // Vérification des autres champs
    if (name.isEmpty || idNumber.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showErrorDialog('Tous les champs sont obligatoires.');
      return;
    }

    if (password != confirmPassword) {
      _showErrorDialog('Les mots de passe ne correspondent pas.');
      return;
    }


    Navigator.pushNamed(context, '/sign_up/upload_files');
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Erreur'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF000000),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset('assets/images/madis_finance.png', height: 100),
          SizedBox(height: 20),
          Text(
            'Inscrivez-vous !',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 20),
                const SizedBox(height: 10),
                const Text(
                  'Gérez parfaitement vos finances - Inscrivez-vous maintenant à notre plateforme Madis finance !',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
           Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 400.0, // Form width constraint to center it
            ),
            decoration: BoxDecoration(
              color: Color(0xFF1A1F31),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Nom et Prénoms
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                    labelText: 'Nom et prénoms',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xFF1A1F31),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                // Date de naissance
                Row(
                  children: [Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedYear,
                      items: List.generate(100, (index) {
                        final year = DateTime.now().year - index;
                        return DropdownMenuItem(
                          value: year.toString(),
                          child: Text(year.toString(), style: TextStyle(color: Colors.white)),
                        );
                      }),
                      decoration: InputDecoration(
                        labelText: 'Année',
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Color(0xFF1A1F31),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedYear = value;
                        });
                      },
                      dropdownColor: Color(0xFF1A1F31),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                    SizedBox(width: 8.0),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedMonth,
                        items: List.generate(12, (index) {
                          return DropdownMenuItem(
                            value: (index + 1).toString(),
                            child: Text((index + 1).toString(), style: TextStyle(color: Colors.white)),
                          );
                        }),
                        decoration: InputDecoration(
                          labelText: 'Mois',
                          labelStyle: TextStyle(color: Colors.white),
                          fillColor: Color(0xFF1A1F31),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedMonth = value;
                          });
                        },
                        dropdownColor: Color(0xFF1A1F31),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedDay,
                        items: List.generate(31, (index) {
                          return DropdownMenuItem(
                            value: (index + 1).toString(),
                            child: Text((index + 1).toString(), style: TextStyle(color: Colors.white)),
                          );
                        }),
                        decoration: InputDecoration(
                          labelText: 'Jour',
                          labelStyle: TextStyle(color: Colors.white),
                          fillColor: Color(0xFF1A1F31),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedDay = value;
                          });
                        },
                        dropdownColor: Color(0xFF1A1F31),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                // Choix de la pièce
                DropdownButtonFormField<String>(
                  value: _selectedIdType,
                  items: [
                    DropdownMenuItem(
                      value: 'Passeport',
                      child: Text('Passeport', style: TextStyle(color: Colors.white)),
                    ),
                    DropdownMenuItem(
                      value: 'CNI',
                      child: Text('CNI', style: TextStyle(color: Colors.white)),
                    ),
                    DropdownMenuItem(
                      value: 'Permis',
                      child: Text('Permis', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Choix de la pièce',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xFF1A1F31),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedIdType = value;
                    });
                  },
                  dropdownColor: Color(0xFF1A1F31),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                // ID de la pièce
                TextField(
                  controller: _idNumberController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.credit_card, color: Colors.white),
                    labelText: 'ID de votre pièce',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xFF1A1F31),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                // Mot de passe
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    labelText: 'Mot de passe',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xFF1A1F31),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                // Confirmation du mot de passe
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    labelText: 'Confirmation du mot de passe',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xFF1A1F31),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                // Bouton Suivant
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Color(0xFFD32F2F), // Couleur du texte du bouton
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text('Suivant', style: TextStyle(fontSize: 16.0)),
                  ),
                ),
              ],
            ),
          ),
         ],
      ),
    )
      )
    );
  }
}
 */

