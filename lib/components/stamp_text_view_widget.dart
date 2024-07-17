import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stamp_text_view_model.dart';
export 'stamp_text_view_model.dart';

class StampTextViewWidget extends StatefulWidget {
  const StampTextViewWidget({super.key});

  @override
  State<StampTextViewWidget> createState() => _StampTextViewWidgetState();
}

class _StampTextViewWidgetState extends State<StampTextViewWidget> {
  late StampTextViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StampTextViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello World',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Kanit',
            letterSpacing: 0.0,
          ),
    );
  }
}
