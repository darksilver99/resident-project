import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'is_stamp_view_model.dart';
export 'is_stamp_view_model.dart';

class IsStampViewWidget extends StatefulWidget {
  const IsStampViewWidget({
    super.key,
    required this.docPath,
  });

  final String? docPath;

  @override
  State<IsStampViewWidget> createState() => _IsStampViewWidgetState();
}

class _IsStampViewWidgetState extends State<IsStampViewWidget> {
  late IsStampViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IsStampViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.transactionRef = await actions.getTransactionRef(
        widget!.docPath!,
      );
      _model.transactionDoc =
          await TransactionListRecord.getDocumentOnce(_model.transactionRef!);
      if (_model.transactionDoc?.reference != null) {
        if (_model.transactionDoc?.stamp != null &&
            _model.transactionDoc?.stamp != '') {
          _model.stampText = _model.transactionDoc!.stamp;
          _model.isStampSet = true;
        }
      }
      _model.isLoading = false;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_model.isLoading,
      child: Text(
        _model.stampText,
        maxLines: 1,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Kanit',
              color: _model.isStampSet
                  ? FlutterFlowTheme.of(context).success
                  : FlutterFlowTheme.of(context).error,
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
