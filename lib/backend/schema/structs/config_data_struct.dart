// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigDataStruct extends FFFirebaseStruct {
  ConfigDataStruct({
    int? storeVersion,
    String? storeIosLink,
    String? storeAndroidLink,
    String? policyUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _storeVersion = storeVersion,
        _storeIosLink = storeIosLink,
        _storeAndroidLink = storeAndroidLink,
        _policyUrl = policyUrl,
        super(firestoreUtilData);

  // "store_version" field.
  int? _storeVersion;
  int get storeVersion => _storeVersion ?? 0;
  set storeVersion(int? val) => _storeVersion = val;

  void incrementStoreVersion(int amount) =>
      storeVersion = storeVersion + amount;

  bool hasStoreVersion() => _storeVersion != null;

  // "store_ios_link" field.
  String? _storeIosLink;
  String get storeIosLink => _storeIosLink ?? '';
  set storeIosLink(String? val) => _storeIosLink = val;

  bool hasStoreIosLink() => _storeIosLink != null;

  // "store_android_link" field.
  String? _storeAndroidLink;
  String get storeAndroidLink => _storeAndroidLink ?? '';
  set storeAndroidLink(String? val) => _storeAndroidLink = val;

  bool hasStoreAndroidLink() => _storeAndroidLink != null;

  // "policy_url" field.
  String? _policyUrl;
  String get policyUrl => _policyUrl ?? '';
  set policyUrl(String? val) => _policyUrl = val;

  bool hasPolicyUrl() => _policyUrl != null;

  static ConfigDataStruct fromMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        storeVersion: castToType<int>(data['store_version']),
        storeIosLink: data['store_ios_link'] as String?,
        storeAndroidLink: data['store_android_link'] as String?,
        policyUrl: data['policy_url'] as String?,
      );

  static ConfigDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'store_version': _storeVersion,
        'store_ios_link': _storeIosLink,
        'store_android_link': _storeAndroidLink,
        'policy_url': _policyUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'store_version': serializeParam(
          _storeVersion,
          ParamType.int,
        ),
        'store_ios_link': serializeParam(
          _storeIosLink,
          ParamType.String,
        ),
        'store_android_link': serializeParam(
          _storeAndroidLink,
          ParamType.String,
        ),
        'policy_url': serializeParam(
          _policyUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConfigDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        storeVersion: deserializeParam(
          data['store_version'],
          ParamType.int,
          false,
        ),
        storeIosLink: deserializeParam(
          data['store_ios_link'],
          ParamType.String,
          false,
        ),
        storeAndroidLink: deserializeParam(
          data['store_android_link'],
          ParamType.String,
          false,
        ),
        policyUrl: deserializeParam(
          data['policy_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConfigDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfigDataStruct &&
        storeVersion == other.storeVersion &&
        storeIosLink == other.storeIosLink &&
        storeAndroidLink == other.storeAndroidLink &&
        policyUrl == other.policyUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([storeVersion, storeIosLink, storeAndroidLink, policyUrl]);
}

ConfigDataStruct createConfigDataStruct({
  int? storeVersion,
  String? storeIosLink,
  String? storeAndroidLink,
  String? policyUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigDataStruct(
      storeVersion: storeVersion,
      storeIosLink: storeIosLink,
      storeAndroidLink: storeAndroidLink,
      policyUrl: policyUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfigDataStruct? updateConfigDataStruct(
  ConfigDataStruct? configData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    configData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfigDataStructData(
  Map<String, dynamic> firestoreData,
  ConfigDataStruct? configData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (configData == null) {
    return;
  }
  if (configData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && configData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final configDataData = getConfigDataFirestoreData(configData, forFieldValue);
  final nestedData = configDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = configData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfigDataFirestoreData(
  ConfigDataStruct? configData, [
  bool forFieldValue = false,
]) {
  if (configData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(configData.toMap());

  // Add any Firestore field values
  configData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfigDataListFirestoreData(
  List<ConfigDataStruct>? configDatas,
) =>
    configDatas?.map((e) => getConfigDataFirestoreData(e, true)).toList() ?? [];
