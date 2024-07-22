import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationListRecord extends FirestoreRecord {
  NotificationListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "doc_path" field.
  String? _docPath;
  String get docPath => _docPath ?? '';
  bool hasDocPath() => _docPath != null;

  // "resident_ref_list" field.
  List<DocumentReference>? _residentRefList;
  List<DocumentReference> get residentRefList => _residentRefList ?? const [];
  bool hasResidentRefList() => _residentRefList != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
    _docPath = snapshotData['doc_path'] as String?;
    _residentRefList = getDataList(snapshotData['resident_ref_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('project_list/${FFAppState().currentProjectData.projectRef!.id}/notification_list');

  static Stream<NotificationListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationListRecord.fromSnapshot(s));

  static Future<NotificationListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NotificationListRecord.fromSnapshot(s));

  static NotificationListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationListRecordData({
  DateTime? createDate,
  String? type,
  String? subject,
  String? detail,
  String? docPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'type': type,
      'subject': subject,
      'detail': detail,
      'doc_path': docPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationListRecordDocumentEquality
    implements Equality<NotificationListRecord> {
  const NotificationListRecordDocumentEquality();

  @override
  bool equals(NotificationListRecord? e1, NotificationListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.type == e2?.type &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail &&
        e1?.docPath == e2?.docPath &&
        listEquality.equals(e1?.residentRefList, e2?.residentRefList);
  }

  @override
  int hash(NotificationListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.type,
        e?.subject,
        e?.detail,
        e?.docPath,
        e?.residentRefList
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationListRecord;
}
