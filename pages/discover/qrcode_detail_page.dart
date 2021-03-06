import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/device_config.dart';
import '../../provide/discover/qrcode_provide.dart';
import 'package:provide/provide.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../config/tool.dart';

class QrCodeDetailPage extends StatelessWidget {
  final QrcodeType qrcodeType;
  QrCodeDetailPage({Key key, @required this.qrcodeType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _editController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("二维码"),
      ),
      body: Provide<QrcodeProvide>(
        builder: (context, child, provide) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.7,
                    child: TextField(
                        controller: _editController,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            filled: false, hintText: "输入内容生成二维码"),
                        onSubmitted: (text) {}),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.1),
                    width: screenWidth * 0.2,
                    child: RaisedButton(
                      child: Text("生成"),
                      onPressed: () {
                        if (_editController.text == null ||
                            _editController.text.length == 0) {
                          ToolManager.showToast("内容不能为空");
                        } else {
                          if (qrcodeType == QrcodeType.single) {
                            Provide.value<QrcodeProvide>(context).createQrcode(
                                QrcodeType.single,
                                {'content': _editController.text, 'type': 0});
                          } else {}
                        }
                      },
                    ),
                  )
                ],
              ),
              CachedNetworkImage(
                width: nWidth(500),
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: provide.qrcodeImgUrl,
                errorWidget: (context, url, error) => null,
              )
            ],
          );
        },
      ),
    );
  }
}
