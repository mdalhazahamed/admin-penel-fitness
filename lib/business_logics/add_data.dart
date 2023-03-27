import 'package:cloud_firestore/cloud_firestore.dart';

class addData {
  adminDataAdd(
      title, description, type, thumbnailLink, videoSorce, time) async {
    try {
      await FirebaseFirestore.instance
          .collection("practice")
          .doc(type)
          .collection("all")
          .doc()
          .set({
        'title': title,
        'description': description,
        'type': type,
        'thumbnail': thumbnailLink,
        'url': videoSorce,
        'time_stamp': time,
      });
    } catch (e) {
      print(e);
    }
  }
}
