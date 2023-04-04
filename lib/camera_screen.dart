import 'dart:io';
import 'p3.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatefulWidget {
  ImagePreview(this.file, {super.key});
  XFile file;
  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);  //variable qui stocke l'image à utiliser pour la traiter
    return Scaffold(
      appBar: AppBar(title: Text("Image Preview")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(picture),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Go to next page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyThirdPage(title:'p3')), //rajouter la page que vous voulez
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('This is the next page'),
      ),
    );
  }
}
 */

