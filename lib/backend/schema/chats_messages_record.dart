import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsMessagesRecord extends FirestoreRecord {
  ChatsMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chat_ref" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  bool hasDatetime() => _datetime != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _chatRef = snapshotData['chat_ref'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _datetime = snapshotData['datetime'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chats_Messages');

  static Stream<ChatsMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsMessagesRecord.fromSnapshot(s));

  static Future<ChatsMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsMessagesRecord.fromSnapshot(s));

  static ChatsMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatsMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsMessagesRecordData({
  DocumentReference? chatRef,
  String? message,
  DateTime? datetime,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat_ref': chatRef,
      'message': message,
      'datetime': datetime,
      'created_by': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsMessagesRecordDocumentEquality
    implements Equality<ChatsMessagesRecord> {
  const ChatsMessagesRecordDocumentEquality();

  @override
  bool equals(ChatsMessagesRecord? e1, ChatsMessagesRecord? e2) {
    return e1?.chatRef == e2?.chatRef &&
        e1?.message == e2?.message &&
        e1?.datetime == e2?.datetime &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(ChatsMessagesRecord? e) => const ListEquality()
      .hash([e?.chatRef, e?.message, e?.datetime, e?.createdBy]);

  @override
  bool isValidKey(Object? o) => o is ChatsMessagesRecord;
}
