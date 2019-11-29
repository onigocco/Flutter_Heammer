import 'package:flutter/material.dart';
import 'package:heammer/pages/AudioRoomItem.dart';

class AudioRoomCell extends StatefulWidget {
  final AudioRoomItem item;
  AudioRoomCell(this.item);
  @override
  _AudioRoomCell createState() => _AudioRoomCell(this.item);
}

class _AudioRoomCell extends State<AudioRoomCell> {
  final AudioRoomItem item;
  _AudioRoomCell(this.item);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Column(
          children: [
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                  width: constraints.maxWidth,
                  height: constraints.maxWidth,
                  child: Stack(children: [
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: FadeInImage.assetNetwork(
                            placeholder:
                                'assets/images/audio_chat_room_item_bg.png',
                            image:'${item.coverImage}',
                            fit: BoxFit.fill)),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                        decoration: new BoxDecoration(
                          color: Color.fromARGB(255, 155, 88, 252),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Text('${item.tags.first}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: 40,
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
                              Row(children: [
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Image.asset(
                                      'assets/images/audio_chat_room_count.png',
                                      width: 20,
                                      height: 20,
                                    )),
                                Text('${item.onlineMemberCount}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))
                              ]),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Image.asset(
                                      'assets/images/audio_play.gif',
                                      width: 20,
                                      height: 20))
                            ],
                          ),
                        )),
                  ]));
            }),
            Expanded(
                child: ConstrainedBox(
              // padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                  child: Text('${item.name}',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 34, 34, 34)))),
              constraints: new BoxConstraints.expand(),
            ))
          ],
        ));
  }
}
