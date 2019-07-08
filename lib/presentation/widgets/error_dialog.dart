import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  ErrorDialog({this.error, this.onPressed}) : super();

  @required
  final Exception error;

  @required
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text("Error"),
        content: Text(error.toString()),
        actions: <Widget>[
          FlatButton(
            child: Text("Ok"),
            onPressed: this.onPressed,
          )
        ],
      );
}
