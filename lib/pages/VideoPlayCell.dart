import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'NetUtils.dart';
import 'Toast.dart';
import 'VideoItem.dart';
import 'UserDetailItem.dart';

class VideoPlayCell extends StatefulWidget {
  final VideoItem item;
  VideoPlayCell(this.item);
  @override
  _VideoPlayCell createState() => _VideoPlayCell(this.item);
}

class _VideoPlayCell extends State<VideoPlayCell> {
  final VideoItem item;
  _VideoPlayCell(this.item);

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  UserDetailItem detail;

  @override
  void initState() {
    _controller = VideoPlayerController.network(this.item.url);
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    this.loadVideoDetail();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  loadVideoDetail() async {
    var params = {'id': this.item.userId};
    try {
      var response = await Netutils.get(APIPath.userDetail, params);
      if (response['code'] == 200) {
        setState(() {
          this.detail = UserDetailItem.fromJson(response['data']);
        });
      } else {
        Toast.showToast('${response['msg']}');
      }
    } catch (error) {
      Toast.showToast('$error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
                // } else {
                //   return Center(child: CircularProgressIndicator());
                // }
              },
            ),
          ),
          Center(
              child: _controller.value.isPlaying
                  ? GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                      ),
                      onTap: () {
                        setState(() {
                          _controller.pause();
                        });
                      })
                  : CupertinoButton(
                      child: Image.asset(
                        'assets/images/video_play.png',
                        width: 80,
                        height: 80,
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.play();
                        });
                      })),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 8),
                      child: Text('@' + (this.detail?.name??''),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'PingFangSC'))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Text(item.text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          // softWrap: true,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'PingFangSC'))),
                ]),
          ),
        ]));
  }
}
