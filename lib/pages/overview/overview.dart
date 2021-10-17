import 'package:flutter/material.dart';
import 'package:website/posts/post_manager.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
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
                'Something went wrong, and we are not entirely sure what it is.',
              ),
            );
          }
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: LinearProgressIndicator(),
          );
        }

        return Text('YAY! ${snapshot.data.toString()}');
      },
    );
  }
}
