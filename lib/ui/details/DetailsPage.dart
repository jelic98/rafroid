import 'package:flutter/material.dart';
import 'package:rafroid/ui/details/DetailsBar.dart';
import 'package:rafroid/ui/details/DetailsBody.dart';

class DetailsPage extends StatelessWidget {

  final String _id;

  DetailsPage(this._id);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new DetailsBar(),
          new DetailsBody(),
        ],
      ),
    );
  }
}