import 'package:flutter/material.dart';
import 'package:website/pages/AbstractPage.dart';

class OverviewPage extends AbstractPage {

  @override
  Route build(Map<String, String> arguments) {
    return MaterialPageRoute(builder: (context) {
      return SelectableText('OverviewPage');
    });
  }
}
