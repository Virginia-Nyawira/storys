// To parse this JSON data, do
//
//     final bloggerStorys = bloggerStorysFromJson(jsonString);

import 'dart:convert';

BloggerStorys bloggerStorysFromJson(String str) => BloggerStorys.fromJson(json.decode(str));

String bloggerStorysToJson(BloggerStorys data) => json.encode(data.toJson());

class BloggerStorys {
  String kind;
  List<Post> items;
  String etag;

  BloggerStorys({
    required this.kind,
    required this.items,
    required this.etag,
  });

  factory BloggerStorys.fromJson(Map<String, dynamic> json) => BloggerStorys(
    kind: json["kind"],
    items: List<Post>.from(json["items"].map((x) => Post.fromJson(x))),
    etag: json["etag"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "etag": etag,
  };
}

class Post {
  String kind;
  String id;
  Blog blog;
  DateTime published;
  DateTime updated;
  String url;
  String selfLink;
  String title;
  String content;
  Author author;
  Replies replies;
  String etag;

  Post({
    required this.kind,
    required this.id,
    required this.blog,
    required this.published,
    required this.updated,
    required this.url,
    required this.selfLink,
    required this.title,
    required this.content,
    required this.author,
    required this.replies,
    required this.etag,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    kind: json["kind"],
    id: json["id"],
    blog: Blog.fromJson(json["blog"]),
    published: DateTime.parse(json["published"]),
    updated: DateTime.parse(json["updated"]),
    url: json["url"],
    selfLink: json["selfLink"],
    title: json["title"],
    content: json["content"],
    author: Author.fromJson(json["author"]),
    replies: Replies.fromJson(json["replies"]),
    etag: json["etag"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "id": id,
    "blog": blog.toJson(),
    "published": published.toIso8601String(),
    "updated": updated.toIso8601String(),
    "url": url,
    "selfLink": selfLink,
    "title": title,
    "content": content,
    "author": author.toJson(),
    "replies": replies.toJson(),
    "etag": etag,
  };
}

class Author {
  String id;
  String displayName;
  String url;
  Image image;

  Author({
    required this.id,
    required this.displayName,
    required this.url,
    required this.image,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    displayName: json["displayName"],
    url: json["url"],
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "displayName": displayName,
    "url": url,
    "image": image.toJson(),
  };
}

class Image {
  String url;

  Image({
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class Blog {
  String id;

  Blog({
    required this.id,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class Replies {
  String totalItems;
  String selfLink;

  Replies({
    required this.totalItems,
    required this.selfLink,
  });

  factory Replies.fromJson(Map<String, dynamic> json) => Replies(
    totalItems: json["totalItems"],
    selfLink: json["selfLink"],
  );

  Map<String, dynamic> toJson() => {
    "totalItems": totalItems,
    "selfLink": selfLink,
  };
}
