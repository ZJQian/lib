class GankTodayModel {
  List<String> category;
  bool error;
  Map results;

  GankTodayModel({this.category, this.error, this.results});

  GankTodayModel.fromJson(Map<String, dynamic> json) {
    category = json['category'].cast<String>();
    error = json['error'];
    results = json['results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['error'] = this.error;
    if (this.results != null) {
      data['results'] = this.results;
    }
    return data;
  }
}

class GankItemModel {
  String sId;
  String createdAt;
  String desc;
  List<dynamic> images;
  String publishedAt;
  String source;
  String type;
  String url;
  bool used;
  String who;

  GankItemModel(
      {this.sId,
      this.createdAt,
      this.desc,
      this.images,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.used,
      this.who});

  GankItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdAt = json['createdAt'];
    desc = json['desc'];
    images = json['images'];
    publishedAt = json['publishedAt'];
    source = json['source'];
    type = json['type'];
    url = json['url'];
    used = json['used'];
    who = json['who'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['desc'] = this.desc;
    if (this.images != null) {
      data['images'] = this.images;
    }
    data['publishedAt'] = this.publishedAt;
    data['source'] = this.source;
    data['type'] = this.type;
    data['url'] = this.url;
    data['used'] = this.used;
    data['who'] = this.who;
    return data;
  }
}
