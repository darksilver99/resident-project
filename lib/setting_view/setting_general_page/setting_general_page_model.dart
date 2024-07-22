import '/component/background_view/background_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'setting_general_page_widget.dart' show SettingGeneralPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingGeneralPageModel
    extends FlutterFlowModel<SettingGeneralPageWidget> {
  ///  Local state fields for this page.

  int selected = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backgroundViewModel.dispose();
  }
}
