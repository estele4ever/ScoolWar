import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulaires d\'enregistrement',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EtudiantForm()),
                );
              },
              child: Text('Etudiant'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnseignantForm()),
                );
              },
              child: Text('Enseignant'),
            ),
          ],
        ),
      ),
    );
  }
}
class EtudiantForm extends StatefulWidget {
  @override
  _EtudiantFormState createState() => _EtudiantFormState();
}

class _EtudiantFormState extends State<EtudiantForm> {
  final _formKey = GlobalKey<FormState>();
  String _nom = '';
  String _filiere = '';
  String _niveau = '';
  String _email = '';
  String _matricule = '';
  String _sexe = '';
  String _motDePasse = '';

  void _submitEtudiantForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Ici, vous pouvez ajouter la logique pour envoyer les données du formulaire
      print('Nom : $_nom');
      print('Filière : $_filiere');
      print('Niveau : $_niveau');
      print('Email : $_email');
      print('Matricule : $_matricule');
      print('Sexe : $_sexe');
      print('Mot de passe : $_motDePasse');

      // Naviguer vers la nouvelle page de menu
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enregistrement Étudiant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Champs du formulaire...
              
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nom = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Filière',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer votre filière';
                  }
                  return null;
                },
                onSaved: (value) {
                  _filiere = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Niveau',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer votre niveau';
                  }
                  return null;
                },
                onSaved: (value) {
                  _niveau = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer votre email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Matricule',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer votre matricule';
                  }
                  return null;
                },
                onSaved: (value) {
                  _matricule = value!;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Sexe',
                ),
                items: ['Masculin', 'Féminin'].map((sexe) {
                  return DropdownMenuItem<String>(
                    value: sexe,
                    child: Text(sexe),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Veuillez sélectionner votre sexe';
                  }
                  return null;
                },
                onChanged: (value) {
                  _sexe = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                ),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer un mot de passe';
                  }
                  return null;
                },
                onSaved: (value) {
                  _motDePasse = value!;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitEtudiantForm,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Étudiant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Logique pour suivre un cours
              },
              child: const Text('Suivre un cours'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Logique pour suivre une évaluation
              },
              child: const Text('Suivre une évaluation'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Logique pour suivre un travail dirigé
              },
              child: const Text('Suivre un travail dirigé'),
            ),
          ],
        ),
      ),
    );
  }
}

class EnseignantForm extends StatefulWidget {
  @override
  _EnseignantFormState createState() => _EnseignantFormState();
}



class _EnseignantFormState extends State<EnseignantForm> {
  final _formKey = GlobalKey<FormState>();
  String _nom = '';
  String _uniteDenseignement = '';
  String _codeEnseignant = '';

  void _submitEnseignantForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Redirige l'utilisateur vers la page de menu
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EnseignantMenu(
            nom: _nom,
            uniteDenseignement: _uniteDenseignement,
            codeEnseignant: _codeEnseignant,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enregistrement Enseignant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer le nom de l\'enseignant';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nom = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Unité d\'enseignement',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer l\'unité d\'enseignement';
                  }
                  return null;
                },
                onSaved: (value) {
                  _uniteDenseignement = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Code de l\'enseignant',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer le code de l\'enseignant';
                  }
                  return null;
                },
                onSaved: (value) {
                  _codeEnseignant = value!;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitEnseignantForm,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EnseignantMenu extends StatelessWidget {
  final String nom;
  final String uniteDenseignement;
  final String codeEnseignant;

  const EnseignantMenu({
    required this.nom,
    required this.uniteDenseignement,
    required this.codeEnseignant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Enseignant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Logique pour créer un cours
              },
              child: const Text('Créer un cours'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Logique pour créer une évaluation
              },
              child: const Text('Créer une évaluation'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Logique pour créer un travail dirigé
              },
              child: const Text('Créer un travail dirigé'),
            ),
          ],
        ),
      ),
    );
  }
}