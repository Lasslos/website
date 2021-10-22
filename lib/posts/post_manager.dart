import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:website/widgets/custom_text.dart';

class Post implements Comparable<Post> {
  int id;
  String title;
  String body;
  DateTime timeStamp;
  Post._private(this.id, this.title, this.body, this.timeStamp);

  static Post fromJSON(Map<String, dynamic> json) {
    try {
      int id = int.parse(_getFromJSON(json, 'id')!);
      String title = _getFromJSON(json, 'title')!;
      String body = _getFromJSON(json, 'body')!;
      DateTime timeStamp = DateTime.parse(_getFromJSON(json, 'timestamp')!);
      return Post._private(id, title, body, timeStamp);
    } catch (e) {
      throw FormatException('Failed to parse json. Exception was:', e);
    }
  }
  static T? _getFromJSON<T>(Map<String, dynamic> json, String path) {
    Object? result = json[path];
    if (result == null || result is! T) {
      return null;
    }
    return result as T;
  }

  @override
  int compareTo(other) {
    return timeStamp.compareTo(other.timeStamp);
  }
}

class PostManager {
  static final PostManager instance = PostManager._private();

  final StreamController<List<Post>> _internalStreamController = StreamController.broadcast();
  final StreamController<List<Post>> _publicStreamController = StreamController.broadcast();
  Stream<List<Post>> get stream => _publicStreamController.stream;

  List<Post> posts = List.unmodifiable([]);
  bool initialized = false;

  PostManager._private() {
    _startLifeCycle();
  }
  
  Future<void> _startLifeCycle() async {
    int errorCount = 0;

    _internalStreamController.stream.listen((event) {
      errorCount = 0;
      _publicStreamController.add(event);
    },
      onError: (error) {
        errorCount++;
        if (error is HttpException) {
          _publicStreamController.addError(
            HttpPostException(
              error,
              DateTime.now().add(Duration(seconds: errorCount * 3)),
                  () async {
                await _load();
                },
            ),
          );
        } else {
          _publicStreamController.addError(error);
        }
      }
    );
    await _load();
    await Future.delayed(const Duration(seconds: 1));
    initialized = true;

  }
  Future<void> _load() async {
    try {
      var respond = await http.get(
          Uri.http('db.lh0.eu', '/get-posts.php'));
      List<dynamic> json = jsonDecode(respond.body);
      List<Post> posts = [];
      for (var jsonElement in json) {
        posts.add(Post.fromJSON(jsonElement));
      }
      posts.sort();
      this.posts = List.unmodifiable(posts);
      _internalStreamController.add(this.posts);
    } on HttpException catch (e) {
      _internalStreamController.addError(e);
    }
  }

}

class HttpPostException implements Exception {
  HttpException httpException;
  DateTime retryTime;
  void Function() retry;
  
  HttpPostException(this.httpException, this.retryTime, this.retry);
  Widget get errorMessageWidget => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomText(
        'Oh no! Could not get the posts. "${httpException.message}"',
      ),
      StreamBuilder<Duration>(
        stream: tryAgainDurationStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container();
          }
          return CustomText('Retrying in ${snapshot.data?.inSeconds} seconds.');
        }
      ),
      TextButton(
        onPressed: () {
          retry();
        },
        child: const Text('Retry'),
      ),
    ]
  );

  Stream<Duration> tryAgainDurationStream() async* {
    while (retryTime.isAfter(DateTime.now())) {
      yield retryTime.difference(DateTime.now());
      await Future.delayed(const Duration(milliseconds: 250));
    }
  }
}