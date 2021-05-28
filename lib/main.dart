import 'package:blogger/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  // Stream<QuerySnapshot> getBlogStream() {
    // Stream collectionStream = FirebaseFirestore.instance.collection('blogs').snapshots();
    // return collectionStream.map((list) => list.documents.map((blog) => Blog.fromFirestore(blog)).toList());
    // return collectionStream;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Providers(
        providers: [
          Provider<Stream<QuerySnapshot>>.value(
            FirebaseFirestore.instance.collection('blogs').snapshots()
            // FirebaseFirestore.instance.collection('blogs').snapshots();
          ),
        ],
        child: NavBar(),
      ),
      title: 'Blogger',
    );
  }
}
