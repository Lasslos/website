import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCanadaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
          label: 'Canada',
          primaryColor: Theme.of(context).accentColor.value,
        )
    );
    return Text('Something idk');
  }
}

fun()  {

}