import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPhoto extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _uploadPhotoPage();
  }
}

class _uploadPhotoPage extends State<UploadPhoto> {
  File sampleImage;
  String _myValue;
  final formKey = new GlobalKey<FormState>();
  //Methods
  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;
    });
  }
  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: new AppBar(
        title: new Text("Upload image"),
        centerTitle: true,

      ),
      body: new Center(
        child: sampleImage == null ? Text('Select an image') : enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'add Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget enableUpload() {
    return new Container(
      key: formKey,
      child: new Form(
          child: ListView(
        children: <Widget>[
          Image.file(
            sampleImage,
            height: 330.0,
            width: 660.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          TextFormField(
            decoration: new InputDecoration(labelText: 'Description'),
            validator: (value) {
              return value.isEmpty ? 'Description is required' : null;
            },
            onSaved: (value) {
              return _myValue = value;
            },
          ),
          SizedBox(height: 15.0,),
          RaisedButton(
            elevation: 10.0,
            child: Text("Add new Post"),
            textColor: Colors.white,
            color: Colors.black87,
            onPressed: validateAndSave,
          )
        ],
      )),
    );
  }
}
