import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResidentServiceListRecord extends FirestoreRecord {
  ResidentServiceListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  bool hasSeq() => _seq != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "path_name" field.
  String? _pathName;
  String get pathName => _pathName ?? '';
  bool hasPathName() => _pathName != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _seq = castToType<int>(snapshotData['seq']);
    _subject = snapshotData['subject'] as String?;
    _pathName = snapshotData['path_name'] as String?;
    _type = snapshotData['type'] as String?;
    _status = castToType<int>(snapshotData['status']);
    _icon = snapshotData['icon'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('resident_service_list')
          : FirebaseFirestore.instance.collectionGroup('resident_service_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('resident_service_list').doc(id);

  static Stream<ResidentServiceListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResidentServiceListRecord.fromSnapshot(s));

  static Future<ResidentServiceListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ResidentServiceListRecord.fromSnapshot(s));

  static ResidentServiceListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResidentServiceListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResidentServiceListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResidentServiceListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResidentServiceListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResidentServiceListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResidentServiceListRecordData({
  int? seq,
  String? subject,
  String? pathName,
  String? type,
  int? status,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'seq': seq,
      'subject': subject,
      'path_name': pathName,
      'type': type,
      'status': status,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResidentServiceListRecordDocumentEquality
    implements Equality<ResidentServiceListRecord> {
  const ResidentServiceListRecordDocumentEquality();

  @override
  bool equals(ResidentServiceListRecord? e1, ResidentServiceListRecord? e2) {
    return e1?.seq == e2?.seq &&
        e1?.subject == e2?.subject &&
        e1?.pathName == e2?.pathName &&
        e1?.type == e2?.type &&
        e1?.status == e2?.status &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(ResidentServiceListRecord? e) => const ListEquality()
      .hash([e?.seq, e?.subject, e?.pathName, e?.type, e?.status, e?.icon]);

  @override
  bool isValidKey(Object? o) => o is ResidentServiceListRecord;
}
