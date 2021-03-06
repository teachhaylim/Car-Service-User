import 'package:flutter/material.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/constants/config.dart';

String displayLeadingZero(int number) {
  return number.toString().length == 1 ? "0$number" : "$number";
}

Map<String, dynamic> displayStatusType({required int type}) {
  switch (type) {
    case 1:
      return {
        "value": "Pending",
        "color": Colors.orange,
      };
    case 2:
      return {
        "value": "Completed",
        "color": Colors.green,
      };
    case -1:
      return {
        "value": "Cancel",
        "color": Colors.red,
      };
    default:
      return {
        "value": "No Status",
        "color": Colors.blue,
      };
  }
}

String checkAvatar() {
  return userinfo == null || userinfo!.profilePic == "" ? "https://via.placeholder.com/150" : "$fileUrl/${userinfo!.profilePic}";
}
