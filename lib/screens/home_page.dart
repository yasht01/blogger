import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';

import 'package:blogger/models/blogs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Stream<QuerySnapshot>>(
        builder: (BuildContext context, Stream<QuerySnapshot> blogStream) {
          return StreamBuilder<QuerySnapshot>(
              stream: blogStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                blogStream.map((list) => list.docs.map((blog) => Blog.fromFirestore(blog)).toList());
                // print(list[0]);
                // print(blogStream.elementAt(1));

                return new ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    return new ListTile(
                      // title: new Text(document.data()),
                      // subtitle: new Text(document.data()['status']),
                    );
                  }).toList(),
                );
              });
        },
      ),
    );
  }
}

// return CustomScrollView(
//             slivers: <Widget>[
//               SliverAppBar(
//                 title: Padding(
//                   padding: EdgeInsets.only(top: 15.0),
//                   child: Text(
//                     'Home',
//                     style: TextStyle(
//                       fontSize: 50.0,
//                       fontFamily: 'Poppins',
//                       letterSpacing: 1.2,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 floating: true,
//                 flexibleSpace: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.center,
//                       end: Alignment(0.0,
//                           3.0), // 10% of the width, so there are ten blinds.
//                       colors: <Color>[Color(0xff007cbe), Color(0xff000000)],
//                       tileMode: TileMode.clamp,
//                     ),
//                   ),
//                 ),
//                 expandedHeight: MediaQuery.of(context).size.height * 0.1,
//               ),
//               SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) => Card(
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 10.0,
//                       vertical: 5.0,
//                     ),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 0.95,
//                       height: MediaQuery.of(context).size.height * 0.15,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: ConstrainedBox(
//                               constraints: BoxConstraints(
//                                 maxWidth:
//                                     MediaQuery.of(context).size.width * 0.28,
//                                 maxHeight:
//                                     MediaQuery.of(context).size.width * 0.28,
//                               ),
//                               child: Image.network(
//                                 '${blogData[index].imageUrl}',
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 35.0,
//                             ),
//                             child: Column(
//                               children: [
//                                 Text(
//                                   '${blogData[index].blogTitle}',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 30.0,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       '${blogData[index].publishDate}',
//                                       style: TextStyle(
//                                         fontSize: 15.0,
//                                       ),
//                                     ),
//                                     Text(' • '),
//                                     Text(
//                                       '${blogData[index].authorName}',
//                                       style: TextStyle(
//                                         fontSize: 15.0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           IconButton(
//                             icon: Icon(
//                               Icons.more_vert_outlined,
//                               size: 30.0,
//                             ),
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   childCount: blogData.length,
//                 ),
//               ),
//             ],
//           );
