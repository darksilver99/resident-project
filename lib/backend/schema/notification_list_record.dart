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

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

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

  // "resident_ref" field.
  DocumentReference? _residentRef;
  DocumentReference? get residentRef => _residentRef;
  bool hasResidentRef() => _residentRef != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
    _docPath = snapshotData['doc_path'] as String?;
    _residentRef = snapshotData['resident_ref'] as DocumentReference?;
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
  DocumentReference? receiver,
  String? type,
  String? subject,
  String? detail,
  String? docPath,
  DocumentReference? residentRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'receiver': receiver,
      'type': type,
      'subject': subject,
      'detail': detail,
      'doc_path': docPath,
      'resident_ref': residentRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationListRecordDocumentEquality
    implements Equality<NotificationListRecord> {
  const NotificationListRecordDocumentEquality();

  @override
  bool equals(NotificationListRecord? e1, NotificationListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.receiver == e2?.receiver &&
        e1?.type == e2?.type &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail &&
        e1?.docPath == e2?.docPath &&
        e1?.residentRef == e2?.residentRef;
  }

  @override
  int hash(NotificationListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.receiver,
        e?.type,
        e?.subject,
        e?.detail,
        e?.docPath,
        e?.residentRef
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationListRecord;
}
