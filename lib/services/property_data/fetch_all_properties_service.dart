import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('properties');

late QuerySnapshot querySnapshot;
var properties = [];

// Fetch all available properties from firebase collection.
Future<void> fetchProperties() async {
  try {
    querySnapshot = await _mainCollection.get();
    properties = [];
    for (var result in querySnapshot.docs) {
      properties.add(result.data());
    }
  } catch (e) {
    print(e);
  }
}
