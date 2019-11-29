class LevelStyle {
  String color;
  String icon;
  String style;

  LevelStyle(
    this.color,
    this.icon,
    this.style,
  );

  LevelStyle.fromJson(Map<String, dynamic> json)
      : color = json['color'],
        icon = json['icon'],
        style = json['style'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'color': color,
        'icon': icon,
        'style': style,
      };
}

class TagObject {
  String tag;
  int id;

  TagObject(
    this.tag,
    this.id,
  );

  TagObject.fromJson(Map<String, dynamic> json)
      : tag = json['tag'],
        id = json['id'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'tag': tag,
        'id': id,
      };
}

class UserDetailItem {
  int age;
  int anchorAuthStatus;
  int anchorFlag;
  String avatar;
  int birthDay;
  String city;
  String connectedPercent;
  String currency;
  int fansCount;
  int followCount;
  String height;
  int id;
  int inRoomFlag;
  String inviteCode;
  int level;
  LevelStyle levelStyle;
  String name;
  int obtainedExperience;
  List<String> photos;
  int price;
  int roomId;
  int sex;
  String signature;
  int status;
  List<TagObject> tagObjectList;
  List<String> tags;
  int upgradeExperience;
  int weight;

  UserDetailItem(
    this.age,
    this.anchorAuthStatus,
    this.anchorFlag,
    this.avatar,
    this.birthDay,
    this.city,
    this.connectedPercent,
    this.currency,
    this.fansCount,
    this.followCount,
    this.height,
    this.id,
    this.inRoomFlag,
    this.inviteCode,
    this.level,
    this.levelStyle,
    this.name,
    this.obtainedExperience,
    this.photos,
    this.price,
    this.roomId,
    this.sex,
    this.signature,
    this.status,
    this.tagObjectList,
    this.tags,
    this.upgradeExperience,
    this.weight,
  );

  UserDetailItem.fromJson(Map<String, dynamic> json)
      : age = json['age'],
        anchorAuthStatus = json['anchorAuthStatus'],
        anchorFlag = json['anchorFlag'],
        avatar = json['avatar'],
        birthDay = json['birthDay'],
        city = json['city'],
        connectedPercent = json['connectedPercent'],
        currency = json['currency'],
        fansCount = json['fansCount'],
        followCount = json['followCount'],
        height = json['height'],
        id = json['id'],
        inRoomFlag = json['inRoomFlag'],
        inviteCode = json['inviteCode'],
        level = json['level'],
        levelStyle = LevelStyle.fromJson(json['levelStyle']),
        name = json['name'],
        obtainedExperience = json['obtainedExperience'],
        photos = List<String>.from(json['photos']),
        price = json['price'],
        roomId = json['roomId'],
        sex = json['sex'],
        signature = json['signature'],
        status = json['status'],
        tagObjectList = List.from(json['tagObjectList']).map((m) => TagObject.fromJson(m)).toList(),
        tags = List<String>.from(json['tags']),
        upgradeExperience = json['upgradeExperience'],
        weight = json['weight'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'age': age,
        'anchorAuthStatus': anchorAuthStatus,
        'anchorFlag': anchorFlag,
        'avatar': avatar,
        'birthDay': birthDay,
        'city': city,
        'connectedPercent': connectedPercent,
        'currency': currency,
        'fansCount': fansCount,
        'followCount': followCount,
        'height': height,
        'id': id,
        'inRoomFlag': inRoomFlag,
        'inviteCode': inviteCode,
        'level': level,
        'levelStyle': levelStyle,
        'name': name,
        'obtainedExperience': obtainedExperience,
        'photos': photos,
        'price': price,
        'roomId': roomId,
        'sex': sex,
        'signature': signature,
        'status': status,
        'tagObjectList': tagObjectList,
        'tags': tags,
        'upgradeExperience': upgradeExperience,
        'weight': weight,
      };
}
