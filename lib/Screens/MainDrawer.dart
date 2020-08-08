import 'package:flutter/material.dart';
import 'package:party_man/models/FunctionM.dart';
import 'package:party_man/Screens/FunctionDetail.dart';
import 'package:party_man/Screens/UserDetails.dart';

class MainDrawer extends StatefulWidget {

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:<Widget>[
          Container(
              width: double.infinity,
              height:150.0,
              color: Theme.of(context).primaryColor,
              child:Center(
                child: Text("Username",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0
                  ),),
              )
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.account_circle),
                title:Text("Account Details",
                  style: TextStyle(
                      fontSize: 15.0
                  ),),
                onTap:(){
                  navigate();
                }
            ),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.add),
                title:Text("Add New Party",
                  style: TextStyle(
                      fontSize: 15.0
                  ),),
                onTap:(){
                  navigateToFunctionReg(FunctionM('', '', 1, 'Addnote'), 'Add Party');
                }
            ),
          )
        ],
      ),
    );



  }

  void navigateToFunctionReg(functionList, String title) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FunctionDetail(functionList, title);
    }));

  }

  void navigate() async{
    await Navigator.push(context,MaterialPageRoute(builder:(context){
      return UserDetails();
    })
    );
  }
}