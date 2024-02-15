class ProductListBaseResponse {
  ProductListBaseResponse({
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

  ProductListBaseResponse.fromJson(dynamic json) {
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
  num? id;
  String? slug;
  String? url;
  String? title;
  String? content;
  String? image;
  String? thumbnail;
  String? status;
  String? category;
  String? publishedAt;
  String? updatedAt;
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