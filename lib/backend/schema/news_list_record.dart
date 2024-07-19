import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsListRecord extends FirestoreRecord {
  NewsListRecord._(
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

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "display_image" field.
  String? _displayImage;
  String get displayImage => _displayImage ?? '';
  bool hasDisplayImage() => _displayImage != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
    _images = getDataList(snapshotData['images']);
    _displayImage = snapshotData['display_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('project_list/${FFAppState().currentProjectData.projectRef!.id}/news_list');

  static Stream<NewsListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsListRecord.fromSnapshot(s));

  static Future<NewsListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsListRecord.fromSnapshot(s));

  static NewsListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NewsListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  String? subject,
  String? detail,
  String? displayImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'subject': subject,
      'detail': detail,
      'display_image': displayImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsListRecordDocumentEquality implements Equality<NewsListRecord> {
  const NewsListRecordDocumentEquality();

  @override
  bool equals(NewsListRecord? e1, NewsListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.displayImage == e2?.displayImage;
  }

  @override
  int hash(NewsListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.status,
        e?.subject,
        e?.detail,
        e?.images,
        e?.displayImage
      ]);

  @override
  bool isValidKey(Object? o) => o is NewsListRecord;
}
