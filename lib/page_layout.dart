import 'package:flutter/material.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/widgets/app_bar.dart';
import 'package:website/widgets/page_large.dart';
import 'package:website/widgets/page_small.dart';

class PageLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
    key: scaffoldKey,
    appBar: buildAppBar(context, scaffoldKey),
    drawer: Drawer(

    ),
    body: ResponsiveWidget(
      largeSizedWidget: LargePage(),
      smallSizedWidget: SmallPage(),
    ),
  );
}