import 'package:flutter/material.dart';
import 'package:website/posts/post_manager.dart';

class PostsBuilderWidget extends StatelessWidget {
  final Widget Function(BuildContext context, List<Post> posts) builder;

  const PostsBuilderWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Post>>(
    stream: PostManager.instance.stream,
    initialData: PostManager.instance.posts,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        var error = snapshot.error;
        if (error is HttpPostException) {
          return Center(
            child: error.errorMessageWidget,
          );
        } else {
          return const Center(
            child: SelectableText(
              'Something went wrong when loading the posts, and we are not entirely sure what it is.',
            ),
          );
        }
      }
      if (!snapshot.hasData || !PostManager.instance.initialized) {
        return const Center(
          child: LinearProgressIndicator(),
        );
      }
      if (snapshot.data!.isEmpty) {
        return const Center(
          child: Text('Es scheint noch keine Posts zu geben!'),
        );
      }
      return builder(context, snapshot.data!);
    }
  );
}
