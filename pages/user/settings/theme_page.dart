import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/config/app_theme.dart';
import 'package:flutter_project/config/device_config.dart';
import 'package:flutter_project/provide/app_theme_provide.dart';
import 'package:provide/provide.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("change theme")),
      body: Provide<AppThemeProvide>(
        builder: (context, child, provide) {
          return ListView.builder(
            padding: EdgeInsets.all(nWidth(16)),
            itemCount: AppTheme.values.length,
            itemBuilder: (context, index) {
              final itemAppTheme = AppTheme.values[index];
              return Card(
                color: appThemeData[itemAppTheme].primaryColor,
                child: ListTile(
                  title: Text(itemAppTheme.toString(),
                      style: appThemeData[itemAppTheme].textTheme.body1),
                  onTap: () {
                    Provide.value<AppThemeProvide>(context).changeTheme(itemAppTheme);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
