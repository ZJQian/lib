import 'package:flutter/material.dart';

class LotteryDetailPage extends StatelessWidget {
  LotteryDetailPage({Map<String, dynamic> dataDic}) : this.dataDic = dataDic;
  final Map<String, dynamic> dataDic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataDic['name'] ?? ""),
      ),
      body: Center(
        child: Container(
          child: Text(dataDic['name'] ?? ""),
        ),
      ),
    );
  }
}
