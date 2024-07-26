import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/blur_view/blur_view_widget.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/component/loading_view/loading_view_widget.dart';
import '/component/stock_total_view/stock_total_view_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  List<BannerProjectListRecord> bannerProjectList = [];
  void addToBannerProjectList(BannerProjectListRecord item) =>
      bannerProjectList.add(item);
  void removeFromBannerProjectList(BannerProjectListRecord item) =>
      bannerProjectList.remove(item);
  void removeAtIndexFromBannerProjectList(int index) =>
      bannerProjectList.removeAt(index);
  void insertAtIndexInBannerProjectList(
          int index, BannerProjectListRecord item) =>
      bannerProjectList.insert(index, item);
  void updateBannerProjectListAtIndex(
          int index, Function(BannerProjectListRecord) updateFn) =>
      bannerProjectList[index] = updateFn(bannerProjectList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in HomePage widget.
  ProjectListRecord? projectResult;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  ResidentListRecord? residentDoc;
  // Stores action output result for [Backend Call - Read Document] action in HomePage widget.
  ProjectListRecord? projectResult2;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  ResidentListRecord? residentDoc2;
  // Stores action output result for [Action Block - checkStatusLiveInProject] action in HomePage widget.
  bool? isLiveInProject;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<BannerProjectListRecord>? bannerProjectResult;
  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 0;

  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    backgroundViewModel.dispose();
    loadingViewModel.dispose();
  }

  /// Action blocks.
  Future setFirebaseToken(BuildContext context) async {
    String? firebaseToken;

    firebaseToken = await actions.getFirebaseToken();

    await currentUserReference!.update(createUsersRecordData(
      firebaseToken: firebaseToken,
    ));
  }

  Future checkAppVersion(BuildContext context) async {
    ConfigRecord? configResult;

    configResult =
        await ConfigRecord.getDocumentOnce(functions.configReference());
    FFAppState().configData = ConfigDataStruct(
      storeVersion: configResult?.storeVersion,
      storeIosLink: configResult?.storeIosLink,
      storeAndroidLink: configResult?.storeAndroidLink,
    );
    await actions.setAppVersion();
    if (FFAppState().appBuildVersion < FFAppState().configData.storeVersion) {
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
                title: 'กรุณาอัพเดทแอปพลิเคชั่นและเปิดใหม่อีกครั้ง',
                status: 'info',
              ),
            ),
          );
        },
      );

      if (isAndroid) {
        await launchURL(FFAppState().configData.storeAndroidLink);
      } else {
        await launchURL(FFAppState().configData.storeIosLink);
      }

      await actions.closeApp();
    }
  }
}
