import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IssueeListRecord extends FirestoreRecord {
  IssueeListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "create_project" field.
  String? _createProject;
  String get createProject => _createProject ?? '';
  bool hasCreateProject() => _createProject != null;

  // "create_project_ref" field.
  DocumentReference? _createProjectRef;
  DocumentReference? get createProjectRef => _createProjectRef;
  bool hasCreateProjectRef() => _createProjectRef != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "contact_name" field.
  String? _contactName;
  String get contactName => _contactName ?? '';
  bool hasContactName() => _contactName != null;

  // "contact_phone" field.
  String? _contactPhone;
  String get contactPhone => _contactPhone ?? '';
  bool hasContactPhone() => _contactPhone != null;

  // "device_data" field.
  String? _deviceData;
  String get deviceData => _deviceData ?? '';
  bool hasDeviceData() => _deviceData != null;

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  bool hasAppName() => _appName != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _createProject = snapshotData['create_project'] as String?;
    _createProjectRef =
        snapshotData['create_project_ref'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
    _contactName = snapshotData['contact_name'] as String?;
    _contactPhone = snapshotData['contact_phone'] as String?;
    _deviceData = snapshotData['device_data'] as String?;
    _appName = snapshotData['app_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('issuee_list');

  static Stream<IssueeListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IssueeListRecord.fromSnapshot(s));

  static Future<IssueeListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IssueeListRecord.fromSnapshot(s));

  static IssueeListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IssueeListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IssueeListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IssueeListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IssueeListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IssueeListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIssueeListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  String? createProject,
  DocumentReference? createProjectRef,
  int? status,
  String? subject,
  String? detail,
  String? contactName,
  String? contactPhone,
  String? deviceData,
  String? appName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'create_project': createProject,
      'create_project_ref': createProjectRef,
      'status': status,
      'subject': subject,
      'detail': detail,
      'contact_name': contactName,
      'contact_phone': contactPhone,
      'device_data': deviceData,
      'app_name': appName,
    }.withoutNulls,
  );

  return firestoreData;
}

class IssueeListRecordDocumentEquality implements Equality<IssueeListRecord> {
  const IssueeListRecordDocumentEquality();

  @override
  bool equals(IssueeListRecord? e1, IssueeListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.createProject == e2?.createProject &&
        e1?.createProjectRef == e2?.createProjectRef &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail &&
        e1?.contactName == e2?.contactName &&
        e1?.contactPhone == e2?.contactPhone &&
        e1?.deviceData == e2?.deviceData &&
        e1?.appName == e2?.appName;
  }

  @override
  int hash(IssueeListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.createProject,
        e?.createProjectRef,
        e?.status,
        e?.subject,
        e?.detail,
        e?.contactName,
        e?.contactPhone,
        e?.deviceData,
        e?.appName
      ]);

  @override
  bool isValidKey(Object? o) => o is IssueeListRecord;
}
