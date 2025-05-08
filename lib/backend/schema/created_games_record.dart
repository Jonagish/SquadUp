import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreatedGamesRecord extends FirestoreRecord {
  CreatedGamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "sport" field.
  String? _sport;
  String get sport => _sport ?? '';
  bool hasSport() => _sport != null;

  // "card_image" field.
  String? _cardImage;
  String get cardImage => _cardImage ?? '';
  bool hasCardImage() => _cardImage != null;

  // "people_playing" field.
  int? _peoplePlaying;
  int get peoplePlaying => _peoplePlaying ?? 0;
  bool hasPeoplePlaying() => _peoplePlaying != null;

  // "date_game" field.
  DateTime? _dateGame;
  DateTime? get dateGame => _dateGame;
  bool hasDateGame() => _dateGame != null;

  // "setting" field.
  String? _setting;
  String get setting => _setting ?? '';
  bool hasSetting() => _setting != null;

  // "host_username" field.
  String? _hostUsername;
  String get hostUsername => _hostUsername ?? '';
  bool hasHostUsername() => _hostUsername != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "list_players" field.
  List<DocumentReference>? _listPlayers;
  List<DocumentReference> get listPlayers => _listPlayers ?? const [];
  bool hasListPlayers() => _listPlayers != null;

  void _initializeFields() {
    _location = snapshotData['location'] as LatLng?;
    _address = snapshotData['address'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _details = snapshotData['details'] as String?;
    _sport = snapshotData['sport'] as String?;
    _cardImage = snapshotData['card_image'] as String?;
    _peoplePlaying = castToType<int>(snapshotData['people_playing']);
    _dateGame = snapshotData['date_game'] as DateTime?;
    _setting = snapshotData['setting'] as String?;
    _hostUsername = snapshotData['host_username'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _listPlayers = getDataList(snapshotData['list_players']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('created_games');

  static Stream<CreatedGamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreatedGamesRecord.fromSnapshot(s));

  static Future<CreatedGamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CreatedGamesRecord.fromSnapshot(s));

  static CreatedGamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreatedGamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreatedGamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreatedGamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreatedGamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreatedGamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreatedGamesRecordData({
  LatLng? location,
  String? address,
  DateTime? createdTime,
  String? details,
  String? sport,
  String? cardImage,
  int? peoplePlaying,
  DateTime? dateGame,
  String? setting,
  String? hostUsername,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'address': address,
      'created_time': createdTime,
      'details': details,
      'sport': sport,
      'card_image': cardImage,
      'people_playing': peoplePlaying,
      'date_game': dateGame,
      'setting': setting,
      'host_username': hostUsername,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreatedGamesRecordDocumentEquality
    implements Equality<CreatedGamesRecord> {
  const CreatedGamesRecordDocumentEquality();

  @override
  bool equals(CreatedGamesRecord? e1, CreatedGamesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.location == e2?.location &&
        e1?.address == e2?.address &&
        e1?.createdTime == e2?.createdTime &&
        e1?.details == e2?.details &&
        e1?.sport == e2?.sport &&
        e1?.cardImage == e2?.cardImage &&
        e1?.peoplePlaying == e2?.peoplePlaying &&
        e1?.dateGame == e2?.dateGame &&
        e1?.setting == e2?.setting &&
        e1?.hostUsername == e2?.hostUsername &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.listPlayers, e2?.listPlayers);
  }

  @override
  int hash(CreatedGamesRecord? e) => const ListEquality().hash([
        e?.location,
        e?.address,
        e?.createdTime,
        e?.details,
        e?.sport,
        e?.cardImage,
        e?.peoplePlaying,
        e?.dateGame,
        e?.setting,
        e?.hostUsername,
        e?.userRef,
        e?.listPlayers
      ]);

  @override
  bool isValidKey(Object? o) => o is CreatedGamesRecord;
}
