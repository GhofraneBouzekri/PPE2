import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ppe2/PageAccueil.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      debugShowCheckedModeBanner: false,
      home: LoginPage(auth: _auth),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.auth}) : super(key: key);

  final FirebaseAuth auth;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    WidgetsFlutterBinding.ensureInitialized();

    try {
      final UserCredential userCredential = await widget.auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageAccueil(title: 'p1')),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [Container(decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fonddecran.png'),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.8),
                  Colors.transparent],

            ),
          ),child: Column(
          children:[
            SizedBox.square(
              dimension: 150.0,
            ),
            SizedBox(
                child  : Text("Bienvenue chez Smart Heater\n\n Veuillez vous connecter",
                  style: TextStyle(
                    color: Color(0xFF3A2B2B),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,

                )),
            SizedBox(
              height: 50,
              width: 500.0,
            ),SizedBox(
                width: 320,
          child: TextFormField(
            controller: _emailController,
            textAlign : TextAlign.center,
              decoration: InputDecoration(
                fillColor: Color(0xFF795C5D), // couleur de fond grise
                filled: true,
                hintText: 'Email',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,// Définir le poids de la police en gras
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            )),
            SizedBox.square(
              dimension: 20.0,
            ),
            SizedBox(
                width: 320,
                child: TextFormField(
                  controller: _passwordController,
                  textAlign : TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Color(0xFF795C5D), // couleur de fond grise
                    filled: true,
                    hintText: 'Mot de passe',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,// Définir le poids de la police en gras
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),obscureText: true,
                )),
            SizedBox.square(
              dimension: 50.0,
            ),
            ElevatedButton(
              onPressed: _signInWithEmailAndPassword,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF795C5D),
              ),
              child: Text('Se connecter'),

            ),
          ],),
      ),],));
  }
}
