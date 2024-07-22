import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'is_stamp_view_widget.dart' show IsStampViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IsStampViewModel extends FlutterFlowModel<IsStampViewWidget> {
  ///  Local state fields for this component.

  String stampText = 'ยังไม่ได้ประทับตรา';

  bool isStampSet = false;

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getTransactionRef] action in IsStampView widget.
  DocumentReference? transactionRef;
  // Stores action output result for [Backend Call - Read Document] action in IsStampView widget.
  TransactionListRecord? transactionDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
