import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'scan_and_upload_q_r_code_page_widget.dart'
    show ScanAndUploadQRCodePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanAndUploadQRCodePageModel
    extends FlutterFlowModel<ScanAndUploadQRCodePageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - getQRCodeDataFromImagePath] action in Container widget.
  String? qrcode;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
