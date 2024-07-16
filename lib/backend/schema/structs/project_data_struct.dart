// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectDataStruct extends FFFirebaseStruct {
  ProjectDataStruct({
    String? name,
    DocumentReference? projectRef,
    List<String>? projectStampList,
    String? stampField,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _projectRef = projectRef,
        _projectStampList = projectStampList,
        _stampField = stampField,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "project_ref" field.
  DocumentReference? _projectRef;
  DocumentReference? get projectRef => _projectRef;
  set projectRef(DocumentReference? val) => _projectRef = val;

  bool hasProjectRef() => _projectRef != null;

  // "projectStampList" field.
  List<String>? _projectStampList;
  List<String> get projectStampList => _projectStampList ?? const [];
  set projectStampList(List<String>? val) => _projectStampList = val;

  void updateProjectStampList(Function(List<String>) updateFn) {
    updateFn(_projectStampList ??= []);
  }

  bool hasProjectStampList() => _projectStampList != null;

  // "stamp_field" field.
  String? _stampField;
  String get stampField => _stampField ?? '';
  set stampField(String? val) => _stampField = val;

  bool hasStampField() => _stampField != null;

  static ProjectDataStruct fromMap(Map<String, dynamic> data) =>
      ProjectDataStruct(
        name: data['name'] as String?,
        projectRef: data['project_ref'] as DocumentReference?,
        projectStampList: getDataList(data['projectStampList']),
        stampField: data['stamp_field'] as String?,
      );

  static ProjectDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ProjectDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'project_ref': _projectRef,
        'projectStampList': _projectStampList,
        'stamp_field': _stampField,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'project_ref': serializeParam(
          _projectRef,
          ParamType.DocumentReference,
        ),
        'projectStampList': serializeParam(
          _projectStampList,
          ParamType.String,
          isList: true,
        ),
        'stamp_field': serializeParam(
          _stampField,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProjectDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProjectDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        projectRef: deserializeParam(
          data['project_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['project_list'],
        ),
        projectStampList: deserializeParam<String>(
          data['projectStampList'],
          ParamType.String,
          true,
        ),
        stampField: deserializeParam(
          data['stamp_field'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProjectDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProjectDataStruct &&
        name == other.name &&
        projectRef == other.projectRef &&
        listEquality.equals(projectStampList, other.projectStampList) &&
        stampField == other.stampField;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, projectRef, projectStampList, stampField]);
}

ProjectDataStruct createProjectDataStruct({
  String? name,
  DocumentReference? projectRef,
  String? stampField,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectDataStruct(
      name: name,
      projectRef: projectRef,
      stampField: stampField,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectDataStruct? updateProjectDataStruct(
  ProjectDataStruct? projectData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    projectData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectDataStructData(
  Map<String, dynamic> firestoreData,
  ProjectDataStruct? projectData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (projectData == null) {
    return;
  }
  if (projectData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && projectData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectDataData =
      getProjectDataFirestoreData(projectData, forFieldValue);
  final nestedData =
      projectDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = projectData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectDataFirestoreData(
  ProjectDataStruct? projectData, [
  bool forFieldValue = false,
]) {
  if (projectData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(projectData.toMap());

  // Add any Firestore field values
  projectData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectDataListFirestoreData(
  List<ProjectDataStruct>? projectDatas,
) =>
    projectDatas?.map((e) => getProjectDataFirestoreData(e, true)).toList() ??
    [];
