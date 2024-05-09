import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addrecordsDetails(
      Map<String, dynamic> recordsInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Record")
        .doc(id)
        .set(recordsInfoMap);
  }
}
