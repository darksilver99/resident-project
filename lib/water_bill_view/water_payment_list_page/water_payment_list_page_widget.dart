import '/backend/backend.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/water_bill_view/water_payment_detail_view/water_payment_detail_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'water_payment_list_page_model.dart';
export 'water_payment_list_page_model.dart';

class WaterPaymentListPageWidget extends StatefulWidget {
  const WaterPaymentListPageWidget({super.key});

  @override
  State<WaterPaymentListPageWidget> createState() =>
      _WaterPaymentListPageWidgetState();
}

class _WaterPaymentListPageWidgetState
    extends State<WaterPaymentListPageWidget> {
  late WaterPaymentListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaterPaymentListPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'ประวัติการชำระ',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Kanit',
                color: Colors.white,
                fontSize: 22.0,
                letterSpacing: 0.0,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Stack(
        children: [
          wrapWithModel(
            model: _model.backgroundViewModel,
            updateCallback: () => setState(() {}),
            child: BackgroundViewWidget(),
          ),
          StreamBuilder<List<WaterPaymentListRecord>>(
            stream: queryWaterPaymentListRecord(
              queryBuilder: (waterPaymentListRecord) => waterPaymentListRecord
                  .where(
                    'resident_ref',
                    isEqualTo: FFAppState().currentResidentData.residentRef,
                  )
                  .orderBy('create_date', descending: true),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<WaterPaymentListRecord> listViewWaterPaymentListRecordList =
                  snapshot.data!;
              if (listViewWaterPaymentListRecordList.isEmpty) {
                return NoDataViewWidget();
              }

              return ListView.separated(
                padding: EdgeInsets.fromLTRB(
                  0,
                  16.0,
                  0,
                  16.0,
                ),
                scrollDirection: Axis.vertical,
                itemCount: listViewWaterPaymentListRecordList.length,
                separatorBuilder: (_, __) => SizedBox(height: 8.0),
                itemBuilder: (context, listViewIndex) {
                  final listViewWaterPaymentListRecord =
                      listViewWaterPaymentListRecordList[listViewIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          useSafeArea: true,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: WaterPaymentDetailViewWidget(
                                  dataDocument: listViewWaterPaymentListRecord,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'รายการชำระวันที่ ${functions.dateTh(listViewWaterPaymentListRecord.createDate!)}',
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Kanit',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  functions.getStatusText(
                                      listViewWaterPaymentListRecord.status,
                                      FFAppState().paymentStatusList.toList()),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Kanit',
                                        color: () {
                                          if (listViewWaterPaymentListRecord
                                                  .status ==
                                              0) {
                                            return FlutterFlowTheme.of(context)
                                                .warning;
                                          } else if (listViewWaterPaymentListRecord
                                                  .status ==
                                              1) {
                                            return FlutterFlowTheme.of(context)
                                                .warning;
                                          } else if (listViewWaterPaymentListRecord
                                                  .status ==
                                              3) {
                                            return FlutterFlowTheme.of(context)
                                                .warning;
                                          } else if (listViewWaterPaymentListRecord
                                                  .status ==
                                              4) {
                                            return FlutterFlowTheme.of(context)
                                                .success;
                                          } else if (listViewWaterPaymentListRecord
                                                  .status ==
                                              5) {
                                            return FlutterFlowTheme.of(context)
                                                .error;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .primaryText;
                                          }
                                        }(),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.navigate_next_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
