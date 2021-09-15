import 'package:flutter/material.dart';
import 'package:website/routing/my_route_information.dart';


class MyRouteInformationParser extends RouteInformationParser<MyRouteInformation> {
  @override
  Future<MyRouteInformation> parseRouteInformation(RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '');
    var myRouteInformation = allRoutes.where(
            (element) => uri.path.startsWith(element.path)
    ).
  }
}