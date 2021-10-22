import 'package:flutter/material.dart';
import 'package:website/posts/post_manager.dart';
import 'package:website/widgets/custom_text.dart';
import 'package:website/widgets/posts_builder_widget.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => PostsBuilderWidget(
    builder: (context, posts) => ListView(
      children: [
        _buildLastPostWidget(context, posts.last),

      ],
    ),
  );

  Widget _buildLastPostWidget(BuildContext context, Post lastPost) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SelectableText(lastPost.title, style: Theme.of(context).textTheme.headline3,),
      SelectableText(lastPost.body),
    ],
  );
}
