import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/custom_confirm_dialog_view/custom_confirm_dialog_view_widget.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'stock_detail_view_widget.dart' show StockDetailViewWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StockDetailViewModel extends FlutterFlowModel<StockDetailViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? isConfirm;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  StockListRecord? stockResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
