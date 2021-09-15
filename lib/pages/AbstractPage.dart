import 'package:flutter/material.dart';

abstract class AbstractPage {
  Route build(Map<String, String> arguments);
}