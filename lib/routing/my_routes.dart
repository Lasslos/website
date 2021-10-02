import 'package:flutter/cupertino.dart';
import 'package:vrouter/vrouter.dart';
import 'package:website/page_layout.dart';
import 'package:website/pages/all_posts/all_posts.dart';
import 'package:website/pages/last_page/last_page.dart';
import 'package:website/pages/login/login.dart';
import 'package:website/pages/not_found/not_found.dart';
import 'package:website/pages/overview/overview.dart';

final List<VRouteElement> myRoutes = [
  VNester(
    path: '/',
    widgetBuilder: (Widget child) => PageLayout(child: child),
    nestedRoutes: [
      VRouteRedirector(path: '', redirectTo: '/overview'),
      VWidget(path: 'overview', widget: const OverviewPage()),
      VWidget(path: 'last_post', widget: const LastPost()),
      VWidget(path: 'all_posts', widget: const AllPostsPage()),
    ],
  ),
  VWidget(path: '/login', widget: const LoginPage()),
  VWidget(path: '*', widget: const NotFoundPage())
];
