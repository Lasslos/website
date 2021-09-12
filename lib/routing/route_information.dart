import 'package:flutter/material.dart';

class RouterInformation {

}

class MyRouteInformationParser extends RouteInformationParser<RouterInformation> {
  @override
  Future<RouterInformation> parseRouteInformation(RouteInformation routeInformation) {
    // TODO: implement parseRouteInformation
    throw UnimplementedError();
  }


}

class MyRouteInformationProvider extends RouteInformationProvider with ChangeNotifier {
  @override
  // TODO: implement value
  RouteInformation? get value => throw UnimplementedError();

}