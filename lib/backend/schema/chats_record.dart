import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "created_users" field.
  DocumentReference? _createdUsers;
  DocumentReference? get createdUsers => _createdUsers;
  bool hasCreatedUsers() => _createdUsers != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_datetime" field.
  DateTime? _lastMessageDatetime;
  DateTime? get lastMessageDatetime => _lastMessageDatetime;
  bool hasLastMessageDatetime() => _lastMessageDatetime != null;

  // "created_datetime" field.
  DateTime? _createdDatetime;
  DateTime? get createdDatetime => _createdDatetime;
  bool hasCreatedDatetime() => _createdDatetime != null;

  // "unread_users" field.
  List<DocumentReference>? _unreadUsers;
  List<DocumentReference> get unreadUsers => _unreadUsers ?? const [];
  bool hasUnreadUsers() => _unreadUsers != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['users']);
    _createdUsers = snapshotData['created_users'] as DocumentReference?;
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageDatetime = snapshotData['last_message_datetime'] as DateTime?;
    _createdDatetime = snapshotData['created_datetime'] as DateTime?;
    _unreadUsers = getDataList(snapshotData['unread_users']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? createdUsers,
  String? lastMessage,
  DateTime? lastMessageDatetime,
  DateTime? createdDatetime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_users': createdUsers,
      'last_message': lastMessage,
      'last_message_datetime': lastMessageDatetime,
      'created_datetime': createdDatetime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) &&
        e1?.createdUsers == e2?.createdUsers &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageDatetime == e2?.lastMessageDatetime &&
        e1?.createdDatetime == e2?.createdDatetime &&
        listEquality.equals(e1?.unreadUsers, e2?.unreadUsers);
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.users,
        e?.createdUsers,
        e?.lastMessage,
        e?.lastMessageDatetime,
        e?.createdDatetime,
        e?.unreadUsers
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
