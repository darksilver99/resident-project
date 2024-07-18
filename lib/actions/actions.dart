import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future setConfigData(BuildContext context) async {
  ConfigRecord? configResult;

  configResult =
      await ConfigRecord.getDocumentOnce(functions.configReference());
  FFAppState().configData = ConfigDataStruct(
    storeVersion: configResult?.storeVersion,
    storeIosLink: configResult?.storeIosLink,
    storeAndroidLink: configResult?.storeAndroidLink,
    policyUrl: configResult?.policyUrl,
  );
  FFAppState().update(() {});
}

Future setCurrentProjectData(
  BuildContext context, {
  required ProjectListRecord? projectDocument,
}) async {
  FFAppState().currentProjectData = ProjectDataStruct(
    name: projectDocument?.name,
    projectRef: projectDocument?.reference,
    projectStampList: projectDocument?.stampList,
    stampField: projectDocument?.stampField,
  );
  FFAppState().update(() {});
}

Future clearPrefData(BuildContext context) async {
  FFAppState().configData = ConfigDataStruct();
  FFAppState().currentProjectData = ProjectDataStruct();
  FFAppState().currentResidentData = ResidentDataStruct();
}

Future setCurrentResidentData(
  BuildContext context, {
  required ResidentListRecord? residentDocument,
}) async {
  FFAppState().currentResidentData = ResidentDataStruct(
    contactAddress: residentDocument?.contactAddress,
    status: residentDocument?.status,
    residentRef: residentDocument?.reference,
  );
  FFAppState().update(() {});
}

Future<bool?> checkStatusLiveInProject(
  BuildContext context, {
  required List<DocumentReference>? currentProjectList,
}) async {
  if (!currentProjectList!
      .contains(FFAppState().currentProjectData.projectRef)) {
    FFAppState().currentProjectData = ProjectDataStruct();
    FFAppState().currentResidentData = ResidentDataStruct();
    return false;
  } else {
    return true;
  }
}
