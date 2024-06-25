import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCOOLWAR',
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Continuer en tant que ?')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EtudiantForm()),
                );
              },
              icon: const Icon(Icons.person),
              label: const Text('Etudiant',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                iconColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnseignantForm()),
                );
              },
              icon: const Icon(Icons.person),
              label: const Text('Enseignant',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                iconColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
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

    // Créer un Map pour stocker les informations du formulaire
    Map<String, dynamic> formData = {
      'Nom': _nom,
      'Filière': _filiere,
      'Niveau': _niveau,
      'Email': _email,
      'Matricule': _matricule,
      'Sexe': _sexe,
      'Mot de passe': _motDePasse,
    };

    // Afficher les informations du formulaire à l'écran
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informations du formulaire'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (MapEntry entry in formData.entries)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('${entry.key} : ${entry.value}'),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Naviguer vers la nouvelle page de menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enregistrement Étudiant'),
      ),
      body:
       SingleChildScrollView(
         child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Champs du formulaire...
                const Center(
                  child: Icon(
                    Icons.person_add,
                    size: 60,
                    color: Color.fromARGB(255, 203, 136, 206),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2.0
                      )
                    )
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2.0
                      )
                    )
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2.0
                      )
                    )
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2.0
                      )
                    )
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2.0
                      )
                    )
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2.0
                      )
                    )
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
                  style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                iconColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
                  
                  child: const Text('Enregistrer',
                    style: TextStyle(
                    color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
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
      body: SingleChildScrollView(
        child: Padding(
          
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                    child: Icon(
                      Icons.supervisor_account_outlined,
                      size: 60,
                      color: Color.fromARGB(255, 203, 136, 206),
                    ),
                  ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2.0
                        )
                      )
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
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2.0
                        )
                      )
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
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2.0
                        )
                      )
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
                  child: const Text('Enregistrer',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  iconColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),
              ],
            ),
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

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/image1.jpg'), // Assurez-vous que votre logo est dans le dossier assets
      ),
    );
  }
}