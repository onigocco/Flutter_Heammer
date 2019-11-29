import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'AudioRoomCell.dart';
import 'AudioRoomItem.dart';
import 'CustomRefreshHeader.dart';
import 'NetUtils.dart';
import 'Toast.dart';

class AudioRoomListPage extends StatefulWidget {
  @override
  _AudioRoomListPage createState() => _AudioRoomListPage();
}

class _AudioRoomListPage extends State<AudioRoomListPage> {
  List<AudioRoomItem> data = [];
  int page = 0;

  @override
  initState() {
    super.initState();
    loadRoomList();
  }

  loadRoomList() async {
    var params = {'page': this.page, 'size': 10};
    try {
      var response = await Netutils.post(APIPath.audioRoomList, params);
      if (response['code'] == 200) {
        List rows = response['data']['rows'];
        setState(() {
          if (this.page == 0) {
            this.data = rows.map((m) => AudioRoomItem.fromJson(m)).toList();
          } else {
            this.data.addAll(rows.map((m) => AudioRoomItem.fromJson(m)).toList());
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
    double itemWidth = (MediaQuery.of(context).size.width - 30) / 2;
    double ratio = itemWidth / (itemWidth + 46);
    return Container(
        color: Color.fromARGB(255, 248, 248, 248),
        child: EasyRefresh(
            header: GrassHeader(),
            footer: ClassicalFooter(),
            onRefresh: () async {
              this.page = 0;
              this.loadRoomList();
            },
            onLoad: () async {
              this.loadRoomList();
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
                return AudioRoomCell(this.data[index]);
              },
            )));
  }
}
