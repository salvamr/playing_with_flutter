import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  State createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(),
      );
}
