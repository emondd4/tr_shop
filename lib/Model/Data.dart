
import 'package:hive/hive.dart';

part 'Data.g.dart';

@HiveType(typeId: 1)
class Data {
  Data({
      this.id, 
      this.slug, 
      this.url, 
      this.title, 
      this.content, 
      this.image, 
      this.thumbnail, 
      this.status, 
      this.category, 
      this.publishedAt, 
      this.updatedAt, 
      this.userId,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    slug = json['slug'];
    url = json['url'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    category = json['category'];
    publishedAt = json['publishedAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
  }

  @HiveField(0)
  num? id;
  @HiveField(1)
  String? slug;
  @HiveField(2)
  String? url;
  @HiveField(3)
  String? title;
  @HiveField(4)
  String? content;
  @HiveField(5)
  String? image;
  @HiveField(6)
  String? thumbnail;
  @HiveField(7)
  String? status;
  @HiveField(8)
  String? category;
  @HiveField(9)
  String? publishedAt;
  @HiveField(10)
  String? updatedAt;
  @HiveField(11)
  num? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    map['url'] = url;
    map['title'] = title;
    map['content'] = content;
    map['image'] = image;
    map['thumbnail'] = thumbnail;
    map['status'] = status;
    map['category'] = category;
    map['publishedAt'] = publishedAt;
    map['updatedAt'] = updatedAt;
    map['userId'] = userId;
    return map;
  }

}