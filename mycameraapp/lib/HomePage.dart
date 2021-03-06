import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Camera App'),
      ),
      body: Center(
        // if(_image == null){
        //   Text('No Image');
        // } else{
        //   Image.file(_image);
        // }
        child: _image == null ? Text('No Image') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionsDialogBox,
        child: Icon(Icons.add_a_photo),
        tooltip: 'Open Camea',
      ),
    );
  }

  //optionsDialogBox method
  Future <void> _optionsDialogBox(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.blue,
          shape: StadiumBorder(),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    'Take a picture',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                    )
                  ),
                  onTap: openCamera,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                GestureDetector(
                  child: Text(
                    'Select image from gallery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                    )
                  ),
                  onTap: openGallery,
                ),
              ],
            )
          ),
        );
      }
    );
  }

  //camera method
  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    
    setState(() {
      _image = image;  
    });
  }

  //gallery method
  Future openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    
    setState(() {
      _image = picture;
    });
  }
}