import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResidentListRecord extends FirestoreRecord {
  ResidentListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "contact_address" field.
  String? _contactAddress;
  String get contactAddress => _contactAddress ?? '';
  bool hasContactAddress() => _contactAddress != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _status = castToType<int>(snapshotData['status']);
    _contactAddress = snapshotData['contact_address'] as String?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resident_list');

  static Stream<ResidentListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResidentListRecord.fromSnapshot(s));

  static Future<ResidentListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResidentListRecord.fromSnapshot(s));

  static ResidentListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResidentListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResidentListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResidentListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResidentListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResidentListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResidentListRecordData({
  DateTime? createDate,
  int? status,
  String? contactAddress,
  DateTime? updateDate,
  DocumentReference? createBy,
  DocumentReference? updateBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'status': status,
      'contact_address': contactAddress,
      'update_date': updateDate,
      'create_by': createBy,
      'update_by': updateBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResidentListRecordDocumentEquality
    implements Equality<ResidentListRecord> {
  const ResidentListRecordDocumentEquality();

  @override
  bool equals(ResidentListRecord? e1, ResidentListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.status == e2?.status &&
        e1?.contactAddress == e2?.contactAddress &&
        e1?.updateDate == e2?.updateDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateBy == e2?.updateBy;
  }

  @override
  int hash(ResidentListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.status,
        e?.contactAddress,
        e?.updateDate,
        e?.createBy,
        e?.updateBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ResidentListRecord;
}
