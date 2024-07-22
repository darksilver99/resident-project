import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/custom_confirm_dialog_view/custom_confirm_dialog_view_widget.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'stamp_detail_view_widget.dart' show StampDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StampDetailViewModel extends FlutterFlowModel<StampDetailViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? isConfirm;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TransactionListRecord? isStamp;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
