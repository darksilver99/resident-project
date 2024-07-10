import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/component/insert_contact_address_view/insert_contact_address_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_project_page_widget.dart' show SelectProjectPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SelectProjectPageModel extends FlutterFlowModel<SelectProjectPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - qrCodeBlock] action in SelectProjectPage widget.
  String? qrCode;
  // Stores action output result for [Custom Action - checkIsHaveProject] action in SelectProjectPage widget.
  bool? isHaveProject;
  // Stores action output result for [Custom Action - checkDuplicateResident] action in SelectProjectPage widget.
  bool? isDuplicate;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in SelectProjectPage widget.
  String? contactAddress;
  // Stores action output result for [Custom Action - joinProject] action in SelectProjectPage widget.
  DocumentReference? residentRef;
  // Stores action output result for [Backend Call - Read Document] action in SelectProjectPage widget.
  ProjectListRecord? projectData;
  // Stores action output result for [Action Block - qrCodeBlock] action in Button widget.
  String? qrCode2;
  // Stores action output result for [Custom Action - checkIsHaveProject] action in Button widget.
  bool? isHaveProject2;
  // Stores action output result for [Custom Action - checkDuplicateResident] action in Button widget.
  bool? isDuplicate2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? contactAddress2;
  // Stores action output result for [Custom Action - joinProject] action in Button widget.
  DocumentReference? residentRef2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProjectListRecord? projectData2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future<String?> qrCodeBlock(BuildContext context) async {
    var qrCodeResult = '';

    qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
      '#C62828', // scanning line color
      'Cancel', // cancel button text
      true, // whether to show the flash icon
      ScanMode.QR,
    );

    return qrCodeResult;
  }
}
