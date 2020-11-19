import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NumberShapes());
}

class NumberShapes extends StatefulWidget {
  @override
  _NumberShapesState createState() => _NumberShapesState();
}

class _NumberShapesState extends State<NumberShapes> {
  final TextEditingController _numberEntered = TextEditingController();
  String message = '';

  void numberShapes() {
    print(_numberEntered.text);
    final int numberInt = int.parse(_numberEntered.text);
    int square = 0;
    int triangular = 0;
    if (_numberEntered != null) {
      for (int i = 1; i <= numberInt; i++) {
        if (pow(i, 2) == numberInt) {
          square++;
          break;
        }
      }
      print('square is : $square');
      for (int i = 1; i <= numberInt; i++) {
        if (pow(i, 3) == numberInt) {
          triangular++;
          break;
        }
      }
      print('triangular is : $triangular');

      if (square == 1 && triangular == 1)
        setState(() {
          message = 'Number $numberInt is SQUARE and TRIANGULAR.';
        });
      else if (triangular == 1)
        setState(() {
          message = 'Number $numberInt is TRIANGULAR.';
        });
      else if (square == 1)
        setState(() {
          message = 'Number $numberInt is SQUARE.';
        });
      else if (square == 0 && triangular == 0)
        setState(() {
          message = 'Number $numberInt is neither TRIANGULAR or SQUARE.';
        });
      _numberEntered.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Shapes'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Align(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Please input a number to see if it is square or triungular.',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                cursorColor: Colors.red,
                cursorWidth: 3.0,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: _numberEntered,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.check,
          ),
          backgroundColor: Colors.grey,
          onPressed: () {
            numberShapes();
            Fluttertoast.showToast(
                msg: '$message',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 20.0);
          },
        ),
      ),
    );
  }
}
