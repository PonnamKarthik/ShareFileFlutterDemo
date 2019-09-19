import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String filePath = "";
  File file;

  _pickFile() async {
    file = await FilePicker.getFile(type: FileType.ANY);
    setState(() {
      
      if(file != null) filePath = file.path;
    }); 
  }

  

  _shareFile() {
    Share.file("Share Image", "file", file.readAsBytesSync(), lookupMimeType(filePath));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Sharing Demo"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Pick a File"),
            onPressed: () {
              _pickFile();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(filePath),
          ),
          RaisedButton(
            child: Text("Share File"),
            onPressed: () {
              _shareFile();
            },
          ),
          
        ],
      ),
    );
  }
}