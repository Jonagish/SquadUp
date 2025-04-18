// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SportCardStruct extends FFFirebaseStruct {
  SportCardStruct({
    List<String>? sport,
    DateTime? dateGame,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sport = sport,
        _dateGame = dateGame,
        super(firestoreUtilData);

  // "sport" field.
  List<String>? _sport;
  List<String> get sport => _sport ?? const [];
  set sport(List<String>? val) => _sport = val;

  void updateSport(Function(List<String>) updateFn) {
    updateFn(_sport ??= []);
  }

  bool hasSport() => _sport != null;

  // "date_game" field.
  DateTime? _dateGame;
  DateTime? get dateGame => _dateGame;
  set dateGame(DateTime? val) => _dateGame = val;

  bool hasDateGame() => _dateGame != null;

  static SportCardStruct fromMap(Map<String, dynamic> data) => SportCardStruct(
        sport: getDataList(data['sport']),
        dateGame: data['date_game'] as DateTime?,
      );

  static SportCardStruct? maybeFromMap(dynamic data) => data is Map
      ? SportCardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sport': _sport,
        'date_game': _dateGame,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sport': serializeParam(
          _sport,
          ParamType.String,
          isList: true,
        ),
        'date_game': serializeParam(
          _dateGame,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SportCardStruct fromSerializableMap(Map<String, dynamic> data) =>
      SportCardStruct(
        sport: deserializeParam<String>(
          data['sport'],
          ParamType.String,
          true,
        ),
        dateGame: deserializeParam(
          data['date_game'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SportCardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SportCardStruct &&
        listEquality.equals(sport, other.sport) &&
        dateGame == other.dateGame;
  }

  @override
  int get hashCode => const ListEquality().hash([sport, dateGame]);
}

SportCardStruct createSportCardStruct({
  DateTime? dateGame,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SportCardStruct(
      dateGame: dateGame,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SportCardStruct? updateSportCardStruct(
  SportCardStruct? sportCard, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sportCard
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSportCardStructData(
  Map<String, dynamic> firestoreData,
  SportCardStruct? sportCard,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sportCard == null) {
    return;
  }
  if (sportCard.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sportCard.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sportCardData = getSportCardFirestoreData(sportCard, forFieldValue);
  final nestedData = sportCardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sportCard.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSportCardFirestoreData(
  SportCardStruct? sportCard, [
  bool forFieldValue = false,
]) {
  if (sportCard == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sportCard.toMap());

  // Add any Firestore field values
  sportCard.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSportCardListFirestoreData(
  List<SportCardStruct>? sportCards,
) =>
    sportCards?.map((e) => getSportCardFirestoreData(e, true)).toList() ?? [];
