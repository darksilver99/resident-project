import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'stamp_detail_view_widget.dart' show StampDetailViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StampDetailViewModel extends FlutterFlowModel<StampDetailViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for stampSelected widget.
  FormFieldController<List<String>>? stampSelectedValueController;
  String? get stampSelectedValue =>
      stampSelectedValueController?.value?.firstOrNull;
  set stampSelectedValue(String? val) =>
      stampSelectedValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
