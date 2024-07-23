import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stock_total_view_widget.dart' show StockTotalViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StockTotalViewModel extends FlutterFlowModel<StockTotalViewWidget> {
  ///  Local state fields for this component.

  int total = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in StockTotalView widget.
  int? totalStock;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
