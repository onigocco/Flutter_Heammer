import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'CustomRoute.dart';
import 'VideoCell.dart';
import 'VideoItem.dart';
import 'CustomAppBar.dart';
import 'CustomRefreshHeader.dart';
import 'NetUtils.dart';
import 'Toast.dart';

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPage createState() => _VideoListPage();
}

class _VideoListPage extends State<VideoListPage> {
  List<VideoItem> data = [];
  int page = 0;

  @override
  initState() {
    super.initState();
    loadVideoList();
  }

  loadVideoList() async {
    var params = {'page': this.page, 'size': 10, 'type': '1'};
    try {
      var response = await Netutils.post(APIPath.videoList, params);
      if (response['code'] == 200) {
        List rows = response['data']['rows'];
        setState(() {
          if (this.page == 0) {
            this.data = rows.map((m) => VideoItem.fromJson(m)).toList();
          } else {
            this.data.addAll(rows.map((m) => VideoItem.fromJson(m)).toList());
          }
          if (this.data.length > 0) {
            this.page += 1;
          }
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
    double ratio = 173 / 255;
    return Scaffold(
        appBar: CustomAppBar(
            titleText: 'Video Plaza',
            backgroundImagePath: 'assets/images/appbar_backgoung.png'),
        body: Container(
            color: Color.fromARGB(255, 248, 248, 248),
            child: EasyRefresh(
                header: GrassHeader(),
                footer: ClassicalFooter(),
                onRefresh: () async {
                  this.page = 0;
                  this.loadVideoList();
                },
                onLoad: () async {
                  this.loadVideoList();
                },
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: this.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: ratio),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: VideoCell(this.data[index]),
                      onTap: () {
                        CustomRoute.goVideoPlay(context, this.data[index]);
                      },
                    );
                  },
                ))));
  }
}
