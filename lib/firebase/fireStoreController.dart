import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_test/models/note.dart';
import 'package:fire_base_test/models/process_response.dart';

class FirestoreController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<ProcessResponse> create({required Note note}) async {
    return await _firebaseFirestore
        .collection("Notes")
        .add(note.toMap())
        .then((value) => ProcessResponse(
            massage: "Note Created successfully", success: true))
        .catchError((error) =>
            ProcessResponse(massage: "Filed to create note", success: false));
  }

  Future<ProcessResponse> delete({required String path}) async {
    return await _firebaseFirestore
        .collection("Notes")
        .doc(path)
        .delete()
        .then((value) => ProcessResponse(
            massage: "Note Deleted successfully", success: true))
        .catchError((error) =>
            ProcessResponse(massage: "Filed to Delete note", success: false));
  }

  Future<ProcessResponse> update({required Note note}) async {
    return await _firebaseFirestore
        .collection("Notes")
        .doc(note.path)
        .update(note.toMap())
        .then((value) => ProcessResponse(
            massage: "Note Deleted successfully", success: true))
        .catchError((error) =>
            ProcessResponse(massage: "Filed to Delete note", success: false));
  }

  Stream<QuerySnapshot<Note>> read() async* {
    yield* _firebaseFirestore
        .collection("Notes")
        .withConverter<Note>(
          fromFirestore: (snapshot, options) => Note.fromMap(snapshot.data()!),
          toFirestore: (Note note, options) => note.toMap(),
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Note>> readWhere() async* {
    yield* _firebaseFirestore
        .collection("Notes")
        .where("title", isNull: true)
        .withConverter<Note>(
          fromFirestore: (snapshot, options) => Note.fromMap(snapshot.data()!),
          toFirestore: (Note note, options) => note.toMap(),
        )
        .snapshots();
  }
}
