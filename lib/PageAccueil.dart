import 'package:flutter/material.dart';
import 'Salle.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key, required this.title});


  final String title;

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF423131),
        title: Text('Accueil'),
    ),
    body: Stack(children: [Container(decoration: BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/TourEiffel.jpg'),
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
            SizedBox(
              width: 70,
              height: 70,
            ),
            Text('Bienvenue !',
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
            ),textAlign: TextAlign.center, // ajout du textAlign
      ),
          SizedBox(
            width: 70,
            height: 70,
          ),
          Row(
           children: [
              Container(
                   width: 150,
              height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF866464),
                  borderRadius: BorderRadius.circular(20.0), // rayon de 20 pour chaque coin
                ),
                margin: EdgeInsets.only(left:30),
              child: Center(
                child:TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                    MaterialPageRoute(builder: (context) => Salle()));
                  },

                  child: Text(
                'Eiffel 1',
                  style: TextStyle(
                  fontSize: 20,
                      color: Colors.white,
                 ),
    ),
    ),
    ),), SizedBox(width: 35),
    Container(
    width: 150,
    height: 150,
      decoration: BoxDecoration(
        color: Color(0xFF795C5D),
        borderRadius: BorderRadius.circular(20.0), // rayon de 20 pour chaque coin
      ),
    child: Center(
      child:TextButton(
        onPressed: () {
          Navigator.push(
              context,
          MaterialPageRoute(builder: (context) => Salle()));
        },
    child: Text(
    'Eiffel 2',
    style: TextStyle(
    fontSize: 20,
    color: Colors.white,
    ),
    ),
    ),
    ),),
              ],
    ),
      SizedBox(height: 50,),
      Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xFF574242),
              borderRadius: BorderRadius.circular(20.0), // rayon de 20 pour chaque coin
            ),
            margin: EdgeInsets.only(left:30),
            child: Center(
              child:TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                  MaterialPageRoute(builder: (context) => Salle()));
                },
              child: Text(
                'Eiffel 3',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
            ),
          ),
          SizedBox(width: 35),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xFF423131),
              borderRadius: BorderRadius.circular(20.0), // rayon de 20 pour chaque coin
            ),
            child: Center(
              child:TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                  MaterialPageRoute(builder: (context) => Salle()));
                },
              child: Text(
                'Eiffel 4',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ],
      ),]),

    )]));


    }}