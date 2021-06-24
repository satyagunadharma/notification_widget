import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Latihan Notification Widget'),
      ),
      body: Center(
        child: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Text('Show Toast'),
                onPressed: () {
                  showToast();
                },
              ),
              MaterialButton(
                child: Text('Show Snackbar'),
                onPressed: () {
                  showSnackbar();
                },
              ),
              MaterialButton(
                child: Text('Show Alert'),
                onPressed: () {
                  showAlert(context);
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  showToast() {
    setState(() {
      Fluttertoast.showToast(
          msg: 'Message Toast',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    });
  }

  void showSnackbar() {
    setState(() {
      final snackbar = SnackBar(
          content: Text('Message Snackbar'),
          duration: Duration(seconds: 5),
          action: SnackBarAction(label: 'Undo', onPressed: () {}));
      _scaffoldkey.currentState.showSnackBar(snackbar);
    });
  }

  void showAlert(BuildContext context) {
    setState(() {
      Widget buttonCancel = MaterialButton(
        child: Text('Cancel'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      Widget buttonOK = MaterialButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      AlertDialog alert = AlertDialog(
        title: Text('Alert Title', style: TextStyle(color: Colors.red)),
        content: Text('Alert Content Placed Here'),
        actions: [
          buttonCancel,
          buttonOK,
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    });
  }
}
