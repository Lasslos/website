import 'package:flutter/material.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/widgets/app_bar.dart';
import 'package:website/widgets/large_page.dart';
import 'package:website/widgets/small_page.dart';
import 'package:website/widgets/side_menu.dart';

class PageLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final Widget child;
  PageLayout(this.child);

  @override
  Widget build(BuildContext context) => Scaffold(
    key: scaffoldKey,
    appBar: buildAppBar(scaffoldKey),
    drawer: Drawer(
      child: ListView(
        children: [
          SideMenu()
        ],
      ),
    ),
    drawerEnableOpenDragGesture: false,
    body: ListView(
      children: [
        ResponsiveWidget(
          largeSizedWidget: LargePage(child),
          smallSizedWidget: SmallPage(child),
        ),
      ]
    ),
  );
}