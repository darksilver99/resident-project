import '/backend/backend.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/stock_view/stock_detail_view/stock_detail_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'stock_page_widget.dart' show StockPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StockPageModel extends FlutterFlowModel<StockPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
  }

  @override
  void dispose() {
    backgroundViewModel.dispose();
  }
}
