enum FirestoreCollection {
  users,
  hotels,
}

extension FirestoreCollectionX on FirestoreCollection {
  String get path => name;
}
