import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_and_upload_q_r_code_page_model.dart';
export 'scan_and_upload_q_r_code_page_model.dart';

class ScanAndUploadQRCodePageWidget extends StatefulWidget {
  const ScanAndUploadQRCodePageWidget({super.key});

  @override
  State<ScanAndUploadQRCodePageWidget> createState() =>
      _ScanAndUploadQRCodePageWidgetState();
}

class _ScanAndUploadQRCodePageWidgetState
    extends State<ScanAndUploadQRCodePageWidget> {
  late ScanAndUploadQRCodePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanAndUploadQRCodePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
