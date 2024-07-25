import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/custom_confirm_dialog_view/custom_confirm_dialog_view_widget.dart';
import '/component/custom_info_alert_view/custom_info_alert_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'water_payment_page_widget.dart' show WaterPaymentPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WaterPaymentPageModel extends FlutterFlowModel<WaterPaymentPageWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> imageBillList = [];
  void addToImageBillList(FFUploadedFile item) => imageBillList.add(item);
  void removeFromImageBillList(FFUploadedFile item) =>
      imageBillList.remove(item);
  void removeAtIndexFromImageBillList(int index) =>
      imageBillList.removeAt(index);
  void insertAtIndexInImageBillList(int index, FFUploadedFile item) =>
      imageBillList.insert(index, item);
  void updateImageBillListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      imageBillList[index] = updateFn(imageBillList[index]);

  List<FFUploadedFile> imageSlipList = [];
  void addToImageSlipList(FFUploadedFile item) => imageSlipList.add(item);
  void removeFromImageSlipList(FFUploadedFile item) =>
      imageSlipList.remove(item);
  void removeAtIndexFromImageSlipList(int index) =>
      imageSlipList.removeAt(index);
  void insertAtIndexInImageSlipList(int index, FFUploadedFile item) =>
      imageSlipList.insert(index, item);
  void updateImageSlipListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      imageSlipList[index] = updateFn(imageSlipList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  bool? isConfirm;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  bool? isConfirm2;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  List<String>? urlBillList;
  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  List<String>? urlSlipList;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backgroundViewModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
