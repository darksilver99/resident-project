import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.type, '') == 'resident') {
        _model.isLiveInProject = await action_blocks.checkStatusLiveInProject(
          context,
          currentProjectList:
              (currentUserDocument?.projectList?.toList() ?? []),
        );
        if (_model.isLiveInProject!) {
          if (FFAppState().currentProjectData.name == null ||
              FFAppState().currentProjectData.name == '') {
            if ((currentUserDocument?.projectList?.toList() ?? []).length ==
                1) {
              _model.projectResult = await ProjectListRecord.getDocumentOnce(
                  (currentUserDocument?.projectList?.toList() ?? []).first);
              await action_blocks.setCurrentProjectData(
                context,
                projectDocument: _model.projectResult,
              );
              _model.residentDoc = await queryResidentListRecordOnce(
                queryBuilder: (residentListRecord) => residentListRecord.where(
                  'create_by',
                  isEqualTo: currentUserReference,
                ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              await action_blocks.setCurrentResidentData(
                context,
                residentDocument: _model.residentDoc,
              );
              await _model.setFirebaseToken(context);
            } else {
              context.goNamedAuth(
                'SelectProjectPage',
                context.mounted,
                queryParameters: {
                  'isCanBack': serializeParam(
                    false,
                    ParamType.bool,
                  ),
                }.withoutNulls,
              );
            }
          } else {
            await _model.setFirebaseToken(context);
          }
        } else {
          context.goNamedAuth(
            'SelectProjectPage',
            context.mounted,
            queryParameters: {
              'isCanBack': serializeParam(
                false,
                ParamType.bool,
              ),
            }.withoutNulls,
          );
        }
      } else {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: CustomInfoAlertViewWidget(
                    title: 'ขออภัยผู้ใช้นี้ไม่สามารถใช้งานระบบนี้ได้',
                    detail: 'เนื่องจากบัญชีนี้มีการลงทะเบียนใช้ระบบอื่นแล้ว',
                  ),
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));

        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        context.goNamedAuth('LoginPage', context.mounted);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              wrapWithModel(
                model: _model.backgroundViewModel,
                updateCallback: () => setState(() {}),
                child: BackgroundViewWidget(),
              ),
              if (FFAppState().currentProjectData.name != null &&
                  FFAppState().currentProjectData.name != '')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: StreamBuilder<List<ResidentServiceListRecord>>(
                    stream: queryResidentServiceListRecord(
                      parent: FFAppState().currentProjectData.projectRef,
                      queryBuilder: (residentServiceListRecord) =>
                          residentServiceListRecord
                              .where(
                                'status',
                                isEqualTo: 1,
                              )
                              .orderBy('seq'),
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
                      List<ResidentServiceListRecord>
                          gridViewResidentServiceListRecordList =
                          snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          64.0,
                          0,
                          16.0,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 1.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewResidentServiceListRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewResidentServiceListRecord =
                              gridViewResidentServiceListRecordList[
                                  gridViewIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await actions.goToPage(
                                context,
                                gridViewResidentServiceListRecord.pathName,
                              );
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 16.0, 8.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      gridViewResidentServiceListRecord
                                                          .icon,
                                                      fit: BoxFit.contain,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.jpg',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  gridViewResidentServiceListRecord
                                                      .subject,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.0,
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 8.0, 0.0),
                                          child: Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 2.0, 0.0),
                                                child: Text(
                                                  '99',
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
