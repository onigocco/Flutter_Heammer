import 'package:flutter/material.dart';
import 'VideoItem.dart';

class VideoCell extends StatefulWidget {
  final VideoItem item;
  VideoCell(this.item);
  @override
  _VideoCell createState() => _VideoCell(this.item);
}

class _VideoCell extends State<VideoCell> {
  final VideoItem item;
  _VideoCell(this.item);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Container(
            child: Stack(children: [
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/video_item_default.png',
                  image: '${item.thumbnailUrl}',
                  fit: BoxFit.fill)),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 48,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/audio_chat_room_item_mask.png'),
                        fit: BoxFit.fill)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/avatar_default.png',
                            image: '${item.avatar}',
                            width: 28,
                            height: 28,
                          ),
                        )),
                    Row(children: [
                      Container(
                          padding: EdgeInsets.only(right: 4),
                          width: 24,
                          height: 24,
                          child:
                              Image.asset('assets/images/video_item_lke.png')),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Text('${item.likeCount}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
                  ],
                ),
              )),
        ])));
  }
}
