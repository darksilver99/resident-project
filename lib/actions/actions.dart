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
}

Future setCurrentProjectData(
  BuildContext context, {
  required ProjectListRecord? projectDocument,
  required String? contactAddress,
}) async {
  FFAppState().currentProjectData = ProjectDataStruct(
    name: projectDocument?.name,
    projectRef: projectDocument?.reference,
    contactAddress: contactAddress,
  );
}

Future clearPrefData(BuildContext context) async {
  FFAppState().configData = ConfigDataStruct();
  FFAppState().currentProjectData = ProjectDataStruct();
}
