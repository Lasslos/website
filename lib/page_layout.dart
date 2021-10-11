import 'package:flutter/material.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/widgets/large_layout.dart';
import 'package:website/widgets/small_layout.dart';
import 'package:website/widgets/side_menu.dart';
import 'package:website/widgets/top_navigation_bar.dart';

class PageLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final Widget child;

  PageLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    key: scaffoldKey,
    drawer: const Drawer(
      child: SingleChildScrollView(
        child: SideMenu(),
      ),
    ),
    drawerEnableOpenDragGesture: false,
    body: CustomScrollView(
        slivers: [
          buildSliverAppBar(context, scaffoldKey),
          SliverToBoxAdapter(
            child: ResponsiveWidget(
              largeSizedWidget: LargeLayout(child: child),
              smallSizedWidget: SmallLayout(child: child),
            ),
          ),
        ]
    ),
  );
}
