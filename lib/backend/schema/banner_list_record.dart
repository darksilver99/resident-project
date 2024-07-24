import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannerListRecord extends FirestoreRecord {
  BannerListRecord._(
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

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  bool hasSeq() => _seq != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _image = snapshotData['image'] as String?;
    _seq = castToType<int>(snapshotData['seq']);
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banner_list');

  static Stream<BannerListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannerListRecord.fromSnapshot(s));

  static Future<BannerListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannerListRecord.fromSnapshot(s));

  static BannerListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BannerListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannerListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannerListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannerListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannerListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannerListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? subject,
  String? image,
  int? seq,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'subject': subject,
      'image': image,
      'seq': seq,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannerListRecordDocumentEquality implements Equality<BannerListRecord> {
  const BannerListRecordDocumentEquality();

  @override
  bool equals(BannerListRecord? e1, BannerListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.image == e2?.image &&
        e1?.seq == e2?.seq &&
        e1?.url == e2?.url;
  }

  @override
  int hash(BannerListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.subject,
        e?.image,
        e?.seq,
        e?.url
      ]);

  @override
  bool isValidKey(Object? o) => o is BannerListRecord;
}
