import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../service/service_method.dart';
import '../../config/service_url.dart';

enum QrcodeType {
  single, //单一二维码
  logo //带logo的二维码
}

class QrcodeProvide with ChangeNotifier {
  String qrcodeImgUrl = "";
  createQrcode(QrcodeType type, Map<String, dynamic> params) async {
    String url = "";
    String content = params['content'];
    if (content == null || content.length == 0) {
      url = "";
      notifyListeners();
    } else {
      if (type == QrcodeType.single) {
        url = qrcodeSingle;
        await get(url, formData: params).then((val) {
          qrcodeImgUrl = val['data']['qrCodeUrl'] ?? "";
          notifyListeners();
        });
      } else {
        url = qrcodeLogo;
      }
    }
  }
}
