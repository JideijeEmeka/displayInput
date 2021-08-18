import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class DisplayUser extends StatefulWidget {
  @override
  _DisplayUserState createState() => _DisplayUserState();
}

class _DisplayUserState extends State<DisplayUser> {
  String _userName = '';
  String _userDescription = '';
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _userDescriptionController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _userNameController.addListener(() {
      setState(() {
        _userName = _userNameController.text;
      });
    });

    _userDescriptionController.addListener(() {
      setState(() {
        _userDescription = _userDescriptionController.text;
      });
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.all(60),
              child: Image.asset(
                'assets/images/zuri-logo.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Zuri Internship Stage 2 Task 2",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //TEXT
              Text(
                "Name: " + _userName,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Description: " + _userDescription,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Input Your Details Below",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                  ),
                ],
              ),
              SizedBox(height: 30),
              //TEXTFORM
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _userNameController,
                  maxLength: 25,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                      hintText: "Name",
                      labelText: "Your Name"),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _userDescriptionController,
                    maxLength: 50,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                        hintText: "Description",
                        labelText: "Your Decscription"),
                  )),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    "About Zuri",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.arrow_forward),
                  GestureDetector(
                    onTap: () async {
                      await launch("https://internship.zuri.team/");
                    },
                    child: Text("Zuri Team Internship Web",
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
