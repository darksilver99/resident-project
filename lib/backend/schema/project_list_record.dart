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

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
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
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectListRecordDocumentEquality implements Equality<ProjectListRecord> {
  const ProjectListRecordDocumentEquality();

  @override
  bool equals(ProjectListRecord? e1, ProjectListRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(ProjectListRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is ProjectListRecord;
}
