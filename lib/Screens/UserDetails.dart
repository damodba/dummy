import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class UserDetails extends StatefulWidget {

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  var _formKey = GlobalKey<FormState>();

  TextEditingController emailcontroller=TextEditingController();
  TextEditingController namecontroller=TextEditingController();
  TextEditingController addresscontroller=TextEditingController();
  TextEditingController pincodecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle_H6 = Theme
        .of(context)
        .textTheme
        .headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Details'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child:Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextFormField(
                      //keyboardType: TextInputType.number,
                      style: textStyle_H6,
                      controller:namecontroller,
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'Please enter Your Name';
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: textStyle_H6,
                        errorStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextFormField(
                      //keyboardType: TextInputType.number,
                      style: textStyle_H6,
                      controller:emailcontroller,
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'Please enter Your Email';
                        else if(!isEmail(value))
                          return "Input a valid Email";
                      },
                      decoration: InputDecoration(
                        labelText: 'Email Id',
                        labelStyle: textStyle_H6,
                        errorStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextFormField(
                      //keyboardType: TextInputType.number,
                      style: textStyle_H6,
                      controller:addresscontroller,
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'Please enter Your Address';
                      },
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: textStyle_H6,
                        errorStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle_H6,
                      controller:pincodecontroller,
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'Please enter Your Pin Code';
                      },
                      decoration: InputDecoration(
                        labelText: 'Pin Code',
                        labelStyle: textStyle_H6,
                        errorStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              "Save",
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () => setState(() {
                              debugPrint("save button clicked");
                              if (_formKey.currentState.validate()) {
                                debugPrint("validation successfull");
                              }
                            }),
                          ),
                        ),
                        Container(
                          width: 5.0,
                        ) ,
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              "Close",
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () => setState(() {
                              debugPrint("Close button clicked");
                              moveToLastScreen();
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
}