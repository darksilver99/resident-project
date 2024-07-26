import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/custom_confirm_dialog_view/custom_confirm_dialog_view_widget.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/component/insert_contact_address_view/insert_contact_address_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'select_project_page_model.dart';
export 'select_project_page_model.dart';

class SelectProjectPageWidget extends StatefulWidget {
  const SelectProjectPageWidget({
    super.key,
    required this.isCanBack,
  });

  final bool? isCanBack;

  @override
  State<SelectProjectPageWidget> createState() =>
      _SelectProjectPageWidgetState();
}

class _SelectProjectPageWidgetState extends State<SelectProjectPageWidget> {
  late SelectProjectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectProjectPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!((currentUserDocument?.projectList?.toList() ?? []).isNotEmpty)) {
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
                child: CustomInfoAlertViewWidget(
                  title: 'สแกน QRCode จากเจ้าหน้าที่นิติเพื่อเข้าร่วมโครงการ',
                  status: 'info',
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));

        _model.qrCode = await _model.qrCodeBlock(context);
        if (_model.qrCode != null && _model.qrCode != '') {
          _model.isHaveProject = await actions.checkIsHaveProject(
            _model.qrCode!,
          );
          if (_model.isHaveProject!) {
            _model.isDuplicate = await actions.checkDuplicateResident(
              _model.qrCode!,
            );
            if (_model.isDuplicate!) {
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
                      child: CustomInfoAlertViewWidget(
                        title: 'ท่านอยู่ในโครงการนี้แล้ว',
                        status: 'info',
                      ),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
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
                      child: InsertContactAddressViewWidget(),
                    ),
                  );
                },
              ).then(
                  (value) => safeSetState(() => _model.contactAddress = value));

              _model.residentDoc = await actions.joinProject(
                _model.qrCode!,
                _model.contactAddress!,
              );
              await action_blocks.setCurrentResidentData(
                context,
                residentDocument: _model.residentDoc,
              );
              _model.projectData = await ProjectListRecord.getDocumentOnce(
                  functions.projectReference(_model.qrCode!));
              await action_blocks.setCurrentProjectData(
                context,
                projectDocument: _model.projectData,
              );

              await currentUserReference!.update({
                ...mapToFirestore(
                  {
                    'project_list': FieldValue.arrayUnion(
                        [functions.projectReference(_model.qrCode!)]),
                  },
                ),
              });
              await actions.pushReplacement(
                context,
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
                    child: CustomInfoAlertViewWidget(
                      title:
                          'ขออภัยไม่พบโครงการนี้ กรุณาตรวจสอบ QR Code หรือติดต่อเจ้าหน้าโครงการ',
                      status: 'failed',
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {}));
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
                  child: CustomInfoAlertViewWidget(
                    title:
                        'ขออภัยไม่พบโครงการนี้ กรุณาตรวจสอบ QR Code หรือติดต่อเจ้าหน้าโครงการ',
                    status: 'failed',
                  ),
                ),
              );
            },
          ).then((value) => setState(() {}));
        }
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
      builder: (context) => Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: Visibility(
            visible: widget!.isCanBack ?? true,
            child: FlutterFlowIconButton(
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
          ),
          title: Text(
            'เข้าร่วมโครงการ',
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Builder(
                      builder: (context) => Padding(
                        padding: EdgeInsets.all(16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.qrCode2 = await _model.qrCodeBlock(context);
                            if (_model.qrCode2 != null &&
                                _model.qrCode2 != '') {
                              _model.isHaveProject2 =
                                  await actions.checkIsHaveProject(
                                _model.qrCode2!,
                              );
                              if (_model.isHaveProject2!) {
                                _model.isDuplicate2 =
                                    await actions.checkDuplicateResident(
                                  _model.qrCode2!,
                                );
                                if (_model.isDuplicate2!) {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: WebViewAware(
                                          child: CustomInfoAlertViewWidget(
                                            title: 'ท่านอยู่ในโครงการนี้แล้ว',
                                            status: 'info',
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: WebViewAware(
                                          child:
                                              InsertContactAddressViewWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.contactAddress2 = value));

                                  _model.residentDoc2 =
                                      await actions.joinProject(
                                    _model.qrCode2!,
                                    _model.contactAddress2!,
                                  );
                                  await action_blocks.setCurrentResidentData(
                                    context,
                                    residentDocument: _model.residentDoc2,
                                  );
                                  _model.projectData2 =
                                      await ProjectListRecord.getDocumentOnce(
                                          functions.projectReference(
                                              _model.qrCode2!));
                                  await action_blocks.setCurrentProjectData(
                                    context,
                                    projectDocument: _model.projectData2,
                                  );

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'project_list': FieldValue.arrayUnion([
                                          functions
                                              .projectReference(_model.qrCode2!)
                                        ]),
                                      },
                                    ),
                                  });
                                  await actions.pushReplacement(
                                    context,
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
                                        child: CustomInfoAlertViewWidget(
                                          title:
                                              'ขออภัยไม่พบโครงการนี้ กรุณาตรวจสอบ QR Code หรือติดต่อเจ้าหน้าโครงการ',
                                          status: 'failed',
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
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
                                      child: CustomInfoAlertViewWidget(
                                        title:
                                            'ขออภัยไม่พบโครงการนี้ กรุณาตรวจสอบ QR Code หรือติดต่อเจ้าหน้าโครงการ',
                                        status: 'failed',
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            }

                            setState(() {});
                          },
                          text: 'เข้าร่วมโครงการ',
                          icon: Icon(
                            Icons.add_home,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Kanit',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: AuthUserStreamWidget(
                    builder: (context) => Builder(
                      builder: (context) {
                        final projectList =
                            (currentUserDocument?.projectList?.toList() ?? [])
                                .toList();
                        if (projectList.isEmpty) {
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
                          itemCount: projectList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 8.0),
                          itemBuilder: (context, projectListIndex) {
                            final projectListItem =
                                projectList[projectListIndex];
                            return Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: StreamBuilder<ProjectListRecord>(
                                  stream: ProjectListRecord.getDocument(
                                      projectListItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final containerProjectListRecord =
                                        snapshot.data!;

                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (FFAppState()
                                                .currentProjectData
                                                .projectRef
                                                ?.id !=
                                            containerProjectListRecord
                                                .reference.id) {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: WebViewAware(
                                                  child:
                                                      CustomConfirmDialogViewWidget(
                                                    title:
                                                        'ต้องการเลือกโครงการปัจจุบันเป็น \"${containerProjectListRecord.name}\" ใช่หรือไม่ ?',
                                                    detail:
                                                        'สามารถเปลี่ยนโครงการที่ท่านอยู่ได้ตลอดที่เมนู \"เปลี่ยนโครงการ\"',
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(
                                              () => _model.isConfirm = value));

                                          if ((_model.isConfirm != null) &&
                                              (_model.isConfirm == true)) {
                                            await action_blocks
                                                .setCurrentProjectData(
                                              context,
                                              projectDocument:
                                                  containerProjectListRecord,
                                            );
                                            _model.residentDoc3 =
                                                await queryResidentListRecordOnce(
                                              queryBuilder:
                                                  (residentListRecord) =>
                                                      residentListRecord.where(
                                                'create_by',
                                                isEqualTo: currentUserReference,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            await action_blocks
                                                .setCurrentResidentData(
                                              context,
                                              residentDocument:
                                                  _model.residentDoc3,
                                            );
                                            setState(() {});
                                            await actions.pushReplacement(
                                              context,
                                            );
                                          }
                                        }

                                        setState(() {});
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Text(
                                                      containerProjectListRecord
                                                          .name,
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Kanit',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    if (FFAppState()
                                                            .currentProjectData
                                                            .projectRef
                                                            ?.id ==
                                                        projectListItem.id) {
                                                      return Icon(
                                                        Icons.check_circle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 36.0,
                                                      );
                                                    } else {
                                                      return Icon(
                                                        Icons.circle_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 36.0,
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
