import 'package:flutter/material.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/widgets/top_navigation_bar.dart';
import 'package:website/widgets/large_page.dart';
import 'package:website/widgets/small_page.dart';
import 'package:website/widgets/side_menu.dart';

class PageLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final Widget child;

  PageLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        appBar: buildAppBar(context, scaffoldKey),
        drawer: const Drawer(
          child: SingleChildScrollView(
            child: SideMenu(),
          ),
        ),
        drawerEnableOpenDragGesture: false,
        body: ResponsiveWidget(
          largeSizedWidget: LargePage(child: child),
          smallSizedWidget: SmallPage(child: child),
        ),
      );
}
