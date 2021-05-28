import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  String id;
  String blogTitle;
  String publishDate;
  String authorName;
  String status;
  String blogContent;
  String imageUrl;

  Blog(
      {this.id,
      this.blogTitle,
      this.publishDate,
      this.authorName,
      this.status,
      this.blogContent,
      this.imageUrl});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
        blogTitle: json['blog_title'],
        publishDate: json['publish_date'],
        authorName: json['author_name'],
        status: json['status'],
        blogContent: json['blog_content'],
        imageUrl: json['cover_image_url']);
  }

  factory Blog.fromFirestore(DocumentSnapshot snap) {
    Blog blog = Blog.fromJson(snap.data());
    blog.id = snap.id;
    return blog;
  }
}
