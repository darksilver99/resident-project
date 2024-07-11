// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResidentDataStruct extends FFFirebaseStruct {
  ResidentDataStruct({
    String? contactAddress,
    int? status,
    DocumentReference? residentRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _contactAddress = contactAddress,
        _status = status,
        _residentRef = residentRef,
        super(firestoreUtilData);

  // "contact_address" field.
  String? _contactAddress;
  String get contactAddress => _contactAddress ?? '';
  set contactAddress(String? val) => _contactAddress = val;

  bool hasContactAddress() => _contactAddress != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "resident_ref" field.
  DocumentReference? _residentRef;
  DocumentReference? get residentRef => _residentRef;
  set residentRef(DocumentReference? val) => _residentRef = val;

  bool hasResidentRef() => _residentRef != null;

  static ResidentDataStruct fromMap(Map<String, dynamic> data) =>
      ResidentDataStruct(
        contactAddress: data['contact_address'] as String?,
        status: castToType<int>(data['status']),
        residentRef: data['resident_ref'] as DocumentReference?,
      );

  static ResidentDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ResidentDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'contact_address': _contactAddress,
        'status': _status,
        'resident_ref': _residentRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contact_address': serializeParam(
          _contactAddress,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'resident_ref': serializeParam(
          _residentRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ResidentDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResidentDataStruct(
        contactAddress: deserializeParam(
          data['contact_address'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        residentRef: deserializeParam(
          data['resident_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['resident_list'],
        ),
      );

  @override
  String toString() => 'ResidentDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResidentDataStruct &&
        contactAddress == other.contactAddress &&
        status == other.status &&
        residentRef == other.residentRef;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([contactAddress, status, residentRef]);
}

ResidentDataStruct createResidentDataStruct({
  String? contactAddress,
  int? status,
  DocumentReference? residentRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResidentDataStruct(
      contactAddress: contactAddress,
      status: status,
      residentRef: residentRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResidentDataStruct? updateResidentDataStruct(
  ResidentDataStruct? residentData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    residentData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResidentDataStructData(
  Map<String, dynamic> firestoreData,
  ResidentDataStruct? residentData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (residentData == null) {
    return;
  }
  if (residentData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && residentData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final residentDataData =
      getResidentDataFirestoreData(residentData, forFieldValue);
  final nestedData =
      residentDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = residentData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResidentDataFirestoreData(
  ResidentDataStruct? residentData, [
  bool forFieldValue = false,
]) {
  if (residentData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(residentData.toMap());

  // Add any Firestore field values
  residentData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResidentDataListFirestoreData(
  List<ResidentDataStruct>? residentDatas,
) =>
    residentDatas?.map((e) => getResidentDataFirestoreData(e, true)).toList() ??
    [];
