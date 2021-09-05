import 'package:flutter/material.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/widgets/app_bar.dart';
import 'package:website/widgets/large_page.dart';
import 'package:website/widgets/small_page.dart';
import 'package:website/widgets/side_menu.dart';

class PageLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
    key: scaffoldKey,
    appBar: buildAppBar(context, scaffoldKey),
    drawer: Drawer(
      child: SideMenu(),
    ),
    drawerEnableOpenDragGesture: false,
    body: ResponsiveWidget(
      largeSizedWidget: LargePage(),
      smallSizedWidget: SmallPage(),
    ),
  );
}