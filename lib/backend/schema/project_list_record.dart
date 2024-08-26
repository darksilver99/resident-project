import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectListRecord extends FirestoreRecord {
  ProjectListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "stamp_list" field.
  List<String>? _stampList;
  List<String> get stampList => _stampList ?? const [];
  bool hasStampList() => _stampList != null;

  // "stamp_field" field.
  String? _stampField;
  String get stampField => _stampField ?? '';
  bool hasStampField() => _stampField != null;

  // "image_water_payment" field.
  List<String>? _imageWaterPayment;
  List<String> get imageWaterPayment => _imageWaterPayment ?? const [];
  bool hasImageWaterPayment() => _imageWaterPayment != null;

  // "help_subject_list" field.
  List<String>? _helpSubjectList;
  List<String> get helpSubjectList => _helpSubjectList ?? const [];
  bool hasHelpSubjectList() => _helpSubjectList != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _stampList = getDataList(snapshotData['stamp_list']);
    _stampField = snapshotData['stamp_field'] as String?;
    _imageWaterPayment = getDataList(snapshotData['image_water_payment']);
    _helpSubjectList = getDataList(snapshotData['help_subject_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('project_list');

  static Stream<ProjectListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectListRecord.fromSnapshot(s));

  static Future<ProjectListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectListRecord.fromSnapshot(s));

  static ProjectListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectListRecordData({
  String? name,
  String? stampField,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'stamp_field': stampField,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectListRecordDocumentEquality implements Equality<ProjectListRecord> {
  const ProjectListRecordDocumentEquality();

  @override
  bool equals(ProjectListRecord? e1, ProjectListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.stampList, e2?.stampList) &&
        e1?.stampField == e2?.stampField &&
        listEquality.equals(e1?.imageWaterPayment, e2?.imageWaterPayment) &&
        listEquality.equals(e1?.helpSubjectList, e2?.helpSubjectList);
  }

  @override
  int hash(ProjectListRecord? e) => const ListEquality().hash([
        e?.name,
        e?.stampList,
        e?.stampField,
        e?.imageWaterPayment,
        e?.helpSubjectList
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectListRecord;
}
