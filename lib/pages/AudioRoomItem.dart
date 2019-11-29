class AudioRoomItem {
  String coverImage;
  int id;
  int microphoneCount;
  String name;
  int neteaseRoomId;
  int onlineMemberCount;
  int sumMemberCount;
  String userAvatar;
  int userId;
  String userName;
  String wallpaper;
  List<String> tags;
  int micCount;
  int muteMemberCount;
  int blockMemberCount;
  int muteFlag;
  String announcement;

  AudioRoomItem(
      this.coverImage,
      this.id,
      this.microphoneCount,
      this.name,
      this.neteaseRoomId,
      this.onlineMemberCount,
      this.sumMemberCount,
      this.userAvatar,
      this.userId,
      this.userName,
      this.wallpaper,
      this.tags,
      this.micCount,
      this.muteMemberCount,
      this.blockMemberCount,
      this.muteFlag,
      this.announcement);

  AudioRoomItem.fromJson(Map<String, dynamic> json)
      : coverImage = json['coverImage'],
        id = json['id'],
        microphoneCount = json['microphoneCount'],
        name = json['name'],
        neteaseRoomId = json['neteaseRoomId'],
        onlineMemberCount = json['onlineMemberCount'],
        sumMemberCount = json['sumMemberCount'],
        userAvatar = json['userAvatar'],
        userId = json['userId'],
        userName = json['userName'],
        wallpaper = json['wallpaper'],
        tags = List<String>.from(json['tags']),
        micCount = json['micCount'],
        muteMemberCount = json['muteMemberCount'],
        blockMemberCount = json['blockMemberCount'],
        muteFlag = json['muteFlag'],
        announcement = json['announcement'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'coverImage': coverImage,
        'id': id,
        'microphoneCount': microphoneCount,
        'name': name,
        'neteaseRoomId': neteaseRoomId,
        'onlineMemberCount': onlineMemberCount,
        'sumMemberCount': sumMemberCount,
        'userAvatar': userAvatar,
        'userId': userId,
        'userName': userName,
        'wallpaper': wallpaper,
        'tags': tags,
        'micCount': micCount,
        'muteMemberCount': muteMemberCount,
        'blockMemberCount': blockMemberCount,
        'muteFlag': muteFlag,
        'announcement': announcement,
      };
}
