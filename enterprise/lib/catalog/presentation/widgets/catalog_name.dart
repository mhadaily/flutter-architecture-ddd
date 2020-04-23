import 'package:flutter/material.dart';

class CatalogName extends StatelessWidget {
  const CatalogName({this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.amber,
        ),
      ),
    );
  }
}
