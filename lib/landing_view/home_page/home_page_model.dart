import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/component/loading_view/loading_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in HomePage widget.
  ProjectListRecord? projectResult;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  ResidentListRecord? residentDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  ResidentListRecord? residentDoc2;
  // Stores action output result for [Action Block - checkStatusLiveInProject] action in HomePage widget.
  bool? isLiveInProject;
  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
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
}
