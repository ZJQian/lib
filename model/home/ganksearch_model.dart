class GankSearchModel {
  int count;
  bool error;
  List<GankSearchItemModel> results;

  GankSearchModel({this.count, this.error, this.results});

  GankSearchModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    error = json['error'];
    if (json['results'] != null) {
      results = new List<GankSearchItemModel>();
      json['results'].forEach((v) {
        results.add(new GankSearchItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['error'] = this.error;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GankSearchItemModel {
  String desc;
  String ganhuoId;
  String publishedAt;
  String readability;
  String type;
  String url;
  String who;

  GankSearchItemModel(
      {this.desc,
      this.ganhuoId,
      this.publishedAt,
      this.readability,
      this.type,
      this.url,
      this.who});

  GankSearchItemModel.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    ganhuoId = json['ganhuo_id'];
    publishedAt = json['publishedAt'];
    readability = json['readability'];
    type = json['type'];
    url = json['url'];
    who = json['who'] == null ? "佚名" : json['who'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['ganhuo_id'] = this.ganhuoId;
    data['publishedAt'] = this.publishedAt;
    data['readability'] = this.readability;
    data['type'] = this.type;
    data['url'] = this.url;
    data['who'] = this.who;
    return data;
  }
}
