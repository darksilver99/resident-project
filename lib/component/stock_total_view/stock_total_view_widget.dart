import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stock_total_view_model.dart';
export 'stock_total_view_model.dart';

class StockTotalViewWidget extends StatefulWidget {
  const StockTotalViewWidget({super.key});

  @override
  State<StockTotalViewWidget> createState() => _StockTotalViewWidgetState();
}

class _StockTotalViewWidgetState extends State<StockTotalViewWidget> {
  late StockTotalViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StockTotalViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.totalStock = await queryStockListRecordCount(
        queryBuilder: (stockListRecord) => stockListRecord
            .where(
              'resident_ref_list',
              arrayContains: FFAppState().currentResidentData.residentRef,
            )
            .where(
              'status',
              isEqualTo: 0,
            ),
      );
      _model.total = _model.totalStock!;
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
    context.watch<FFAppState>();

    return Visibility(
      visible: _model.total > 0,
      child: Align(
        alignment: AlignmentDirectional(1.0, -1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
          child: Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).error,
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                child: Text(
                  _model.total.toString(),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Kanit',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
