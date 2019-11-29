class VideoItem {
  int anchorFlag;
  String avatar;
  int duration;
  int likeCount;
  int shareCount;
  String text;
  String thumbnailUrl;
  int type;
  String url;
  int userId;
  int id;
  int status;

  VideoItem(
    this.anchorFlag,
    this.avatar,
    this.duration,
    this.likeCount,
    this.shareCount,
    this.text,
    this.thumbnailUrl,
    this.type,
    this.url,
    this.userId,
    this.id,
    this.status,
  );

  VideoItem.fromJson(Map<String, dynamic> json)
      : anchorFlag = json['anchorFlag'],
        avatar = json['avatar'],
        duration = json['duration'],
        likeCount = json['likeCount'],
        shareCount = json['shareCount'],
        text = json['text'],
        thumbnailUrl = json['thumbnailUrl'],
        type = json['type'],
        url = json['url'],
        userId = json['userId'],
        id = json['id'],
        status = json['status'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'anchorFlag': anchorFlag,
        'avatar': avatar,
        'duration': duration,
        'likeCount': likeCount,
        'shareCount': shareCount,
        'text': text,
        'thumbnailUrl': thumbnailUrl,
        'type': type,
        'url': url,
        'userId': userId,
        'id': id,
        'status': status,
      };
}
