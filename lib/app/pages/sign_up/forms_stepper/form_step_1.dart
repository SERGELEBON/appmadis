import 'package:flutter/material.dart';

class FormStep1 extends StatefulWidget {
  final VoidCallback onNext;
  final Function(Map<String, dynamic>) onFormSaved;

  FormStep1({required this.onNext, required this.onFormSaved});

  @override
  _FormStep1State createState() => _FormStep1State();
}

class _FormStep1State extends State<FormStep1> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _localFormData = {
    'noms': '',
    'dateNaissance': null,
    'typePiece': '',
    'idPiece': '',
    'motDePasse': '',
    'confirmerMotDePasse': '',
  };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Noms'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer vos noms';
              }
              return null;
            },
            onSaved: (value) {
              _localFormData['noms'] = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Date de naissance'),
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                setState(() {
                  _localFormData['dateNaissance'] = date;
                });
              }
            },
            validator: (value) {
              if (_localFormData['dateNaissance'] == null) {
                return 'Veuillez entrer votre date de naissance';
              }
              return null;
            },
            readOnly: true,
            controller: TextEditingController(
              text: _localFormData['dateNaissance'] == null
                  ? ''
                  : _localFormData['dateNaissance'].toString().substring(0, 10),
            ),
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Type de pièce'),
            items: ['CNI', 'PERMIS', 'PASSPORT'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _localFormData['typePiece'] = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez sélectionner un type de pièce';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'ID de la pièce'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer l\'ID de votre pièce';
              }
              return null;
            },
            onSaved: (value) {
              _localFormData['idPiece'] = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Mot de passe'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un mot de passe';
              }
              return null;
            },
            onSaved: (value) {
              _localFormData['motDePasse'] = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Confirmer le mot de passe'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez confirmer votre mot de passe';
              }
              if (value != _localFormData['motDePasse']) {
                return 'Les mots de passe ne correspondent pas';
              }
              return null;
            },
            onSaved: (value) {
              _localFormData['confirmerMotDePasse'] = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onFormSaved(_localFormData);
                widget.onNext();
              }
            },
            child: Text('Suivant'),
          ),
        ],
      ),
    );
  }
}
