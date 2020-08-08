import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'FunctionDetail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:party_man/Utils/DatabaseHelper.dart';
import 'package:party_man/models/FunctionM.dart';
import 'dart:developer' as dev;
import 'package:party_man/Screens/MainDrawer.dart';
import 'package:party_man/Screens/Scan.dart';
import 'FuntionListView.dart';

class FunctionList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FunctionListState();
  }
}

class FunctionListState extends State<FunctionList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<FunctionM> functionList;
  int count = 0;
  int sta;
  @override
  Widget build(BuildContext context) {
    if (functionList == null) {
      functionList = List<FunctionM>();
      updateFunctionList();
    }
    else
      updateFunctionList();//this is done because the list is not getting refreshed

    return Scaffold(

      appBar: AppBar(
        title: Text('Party Details .....'),
      ),
      body: getFunctionDetailsView(),
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Scan();
          }));
          debugPrint('FAB clicked');

        },
        tooltip: 'Scan QR code',
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  ListView getFunctionDetailsView() {
    TextStyle titlestyle = Theme.of(context).textTheme.subtitle1;//checks the theme in the parent widgets
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getColor(this.functionList[position].status),
              child: Icon(Icons.keyboard_arrow_right,
                  size:25.0,
                  color:Colors.white),
            ),
            title: Text(
              (this.functionList[position].partyDate!=null?this.functionList[position].partyDate:''),
              style: titlestyle,
            ),
            subtitle: Text(
              this.functionList[position].partyDesc,
              style: titlestyle,
            ),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.blue,
              ),
              onTap: () {
                _delete(context, functionList[position]);
              },
            ),
            onTap: () {
              debugPrint("List Tile tabbed");
              //navigateToDetail(this.functionList[position], 'Edit Note');//here comes details of party
              navigateToFunctionReg(this.functionList[position], 'Edit Note');//here comes change
            },
          ),
        );
      },
    );
  }

  Color getColor(int status_id){
    if(status_id==1)
      return Colors.yellow;
    else if(status_id==2)
      return Colors.green;
    else if(status_id==3)
      return Colors.red;
  }
  void _delete(BuildContext context, FunctionM functionM) async {
    int result = await databaseHelper.deleteFunction(functionM.partyid);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted succcesfully');
      updateFunctionList();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);//we are finding the scafold in the widget tree
  }



  void navigateToDetail(functionList, String title) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FunctionListView(functionList, title);
    }));

    if (result = true) {
      updateFunctionList();
    }
  }
  void navigateToFunctionReg(functionList, String title) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FunctionDetail(functionList, title);
    }));

    if (result = true) {
      updateFunctionList();
    }
  }



  void updateFunctionList() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<FunctionM>> functionListFuture = databaseHelper.getFunctionList();
      functionListFuture.then((functionList) {
        setState(() {
          this.functionList = functionList;
          this.count = functionList.length;
        });

      });
    });
  }
}