import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  GlobalKey qrkey=GlobalKey();
  var qrtext="";
  QRViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("QR code scanner"))
        ,
        body:Column(
          children: <Widget>[
            Expanded(
              flex:5,
              child:QRView(key:qrkey,onQRViewCreated:_onQRViewCreate),

            ),

            Expanded(
                child: Text("Scan result :$qrtext")),
          ],
        )
    );
  }

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreate(QRViewController controller){
    this.controller=controller;
    controller.scannedDataStream.listen((ScanDate) {
      setState(() {
        qrtext=ScanDate;
      });
    });
  }
}