import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heammer/pages/CustomRoute.dart';
import 'VideoPlayCell.dart';
import 'VideoItem.dart';

class VideoPlayPage extends StatefulWidget {
  final VideoItem item;
  VideoPlayPage(this.item);
  // static String routeName = '/videoPlay';

  @override
  _VideoPlayPage createState() => _VideoPlayPage(this.item);
}

class _VideoPlayPage extends State<VideoPlayPage> {
  final VideoItem item;
  _VideoPlayPage(this.item);
  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Stack(children: [
      Positioned(
          child: MediaQuery.removePadding(
              context: context,
              // removeTop: true,
              // removeBottom: true,
              child: PageView.builder(
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, position) {
                  return VideoPlayCell(this.item);
                },
              ))),
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        height: topPadding + 44,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/video_nav_bg.png'),
                    fit: BoxFit.fill)),
            // color: Colors.red,
            padding: EdgeInsets.only(top: topPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                    padding: EdgeInsets.all(0),
                    child: Image.asset(
                      'assets/images/appBar_leading_back_light.png',
                      width: 26,
                      height: 26,
                    ),
                    onPressed: () => CustomRoute.pop(context)),
                CupertinoButton(
                    padding: EdgeInsets.all(0),
                    child: Image.asset(
                      'assets/images/appBar_action_more.png',
                      width: 26,
                      height: 26,
                    ),
                    onPressed: () {
                      showCupertinoModalPopup<int>(
                          context: context,
                          builder: (ctx) {
                            var dialog = CupertinoActionSheet(
                                cancelButton: CupertinoActionSheetAction(
                                    child: Text('Cancel'),
                                    onPressed: () => Navigator.pop(context, 0)),
                                actions: [
                                  CupertinoActionSheetAction(
                                      child: Text('Report'),
                                      onPressed: () =>
                                          Navigator.pop(context, 1))
                                ]);
                            return dialog;
                          }).then((value) {
                        print(value);
                      });
                    })
              ],
            )),
      ),
    ]));
  }
}
