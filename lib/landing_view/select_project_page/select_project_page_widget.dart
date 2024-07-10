import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'select_project_page_model.dart';
export 'select_project_page_model.dart';

class SelectProjectPageWidget extends StatefulWidget {
  const SelectProjectPageWidget({super.key});

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
        _model.qrCode = await _model.qrCodeBlock(context);
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
                    child: GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: CustomInfoAlertViewWidget(
                        title: 'ท่านอยู่ในโครงการนี้แล้ว',
                      ),
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
                    child: GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: InsertContactAddressViewWidget(),
                    ),
                  ),
                );
              },
            ).then(
                (value) => safeSetState(() => _model.contactAddress = value));

            _model.residentRef = await actions.joinProject(
              _model.qrCode!,
              _model.contactAddress!,
            );
            _model.projectData = await ProjectListRecord.getDocumentOnce(
                functions.projectReference(_model.qrCode!));
            await action_blocks.setCurrentProjectData(
              context,
              projectDocument: _model.projectData,
              contactAddress: _model.contactAddress,
            );

            await currentUserReference!.update({
              ...mapToFirestore(
                {
                  'project_list': FieldValue.arrayUnion(
                      [functions.projectReference(_model.qrCode!)]),
                },
              ),
            });

            context.goNamed('HomePage');
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
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: CustomInfoAlertViewWidget(
                      title:
                          'ขออภัยไม่พบโครงการนี้ กรุณาตรวจสอบ QR Code หรือติดต่อเจ้าหน้าโครงการ',
                    ),
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
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
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
              'เข้าร่วมโครงการ',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/simple-blank-orange-background-vector-business_53876-175746.jpg',
                ).image,
              ),
            ),
            child: Column(
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
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: CustomInfoAlertViewWidget(
                                            title: 'ท่านอยู่ในโครงการนี้แล้ว',
                                          ),
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
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child:
                                              InsertContactAddressViewWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(
                                    () => _model.contactAddress2 = value));

                                _model.residentRef2 = await actions.joinProject(
                                  _model.qrCode!,
                                  _model.contactAddress2!,
                                );
                                _model.projectData2 =
                                    await ProjectListRecord.getDocumentOnce(
                                        functions
                                            .projectReference(_model.qrCode2!));
                                await action_blocks.setCurrentProjectData(
                                  context,
                                  projectDocument: _model.projectData2,
                                  contactAddress: _model.contactAddress2,
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

                                context.goNamed('HomePage');
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: CustomInfoAlertViewWidget(
                                          title:
                                              'ขออภัยไม่พบโครงการนี้ กรุณาตรวจสอบ QR Code หรือติดต่อเจ้าหน้าโครงการ',
                                        ),
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
                                  fontFamily: 'Inter',
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
                            return Padding(
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

                                  return Material(
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
                                            Text(
                                              containerProjectListRecord.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
          ),
        ),
      ),
    );
  }
}
