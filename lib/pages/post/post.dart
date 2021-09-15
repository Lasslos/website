import 'package:flutter/material.dart';

import '../AbstractPage.dart';

class PostPage extends AbstractPage {
  @override
  Route build(Map<String, String> arguments) {
    return MaterialPageRoute(builder: (context) {
      return SelectableText('PostPage');
    });
  }
}
