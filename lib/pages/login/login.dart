import 'package:flutter/material.dart';
import 'package:website/pages/AbstractPage.dart';

class LoginPage extends AbstractPage {
  @override
  Route build(Map<String, String> arguments) {
    return MaterialPageRoute(builder: (context) {
      return SelectableText('LoginPage');
    });
  }
}
