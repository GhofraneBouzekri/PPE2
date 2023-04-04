import 'package:flutter/material.dart';
import 'package:ppe2/p1.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
}

class Salle extends StatefulWidget {
  @override
  _SalleState createState() => _SalleState();
}

class _SalleState extends State<Salle> {
  String _reponse = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF423131),
        title: Text('Salle'),
      ),
      body: Stack(children: [Container(decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/fondsalle.jpg'),
      fit: BoxFit.cover,
    ),
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.black.withOpacity(0.8),
    Colors.transparent],

    ),
    ),
    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Veuillez saisir la salle dans laquel vous vous trouvez svp',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 55),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ex: SC322',
              ),
              onChanged: (value) {
                setState(() {
                  _reponse = value;
                });
              },
            ),
            SizedBox(height: 35),
            ElevatedButton(
              onPressed: (){Navigator.push(
            context,
    MaterialPageRoute(builder: (context) => CameraApp()));},
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF795C5D),
              ),
              child: Text('Valider'),

            ),
          ],
        ),
      ),
    ]));
  }
}
