import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'camera_screen.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
}
class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if(!mounted){
        return;
      }
      setState(() {});
    }).catchError((Object e){
      if(e is CameraException){
        switch(e.code){
          case 'CameraAccesDenied':
            print("Acces refuse");
            break;
          default:
            print(e.description);
            break;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          child:CameraPreview(_controller),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: MaterialButton(
                  onPressed: () async{
                    if(!_controller.value.isInitialized){
                      return null;
                    }
                    if(_controller.value.isTakingPicture){
                      return null;
                    }
                    try{
                      await _controller.setFlashMode(FlashMode.auto);
                      XFile file = await _controller.takePicture();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImagePreview(file)));
                    } on CameraException catch(e){
                      debugPrint("Error : $e");
                      return null;
                    }
                  },
                  color: Colors.white,
                  child: Text("Prendre une photo"),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}