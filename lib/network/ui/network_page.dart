import 'package:flutter/material.dart';

import '../Post.dart';
import '../post_api.dart';


class NetworkPage extends StatelessWidget {
  final Future<Post> post = fetchPost();

  NetworkPage({Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder(future: post,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Text(snapshot.data.title);
                }else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }

}