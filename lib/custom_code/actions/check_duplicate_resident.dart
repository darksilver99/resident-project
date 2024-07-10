// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:resident_project/auth/firebase_auth/auth_util.dart';

Future<bool> checkDuplicateResident(String projectDocID) async {
  // Add your function code here!
  QuerySnapshot<Map<String, dynamic>> rs = await FirebaseFirestore.instance
      .collection("project_list/$projectDocID/resident_list")
      .where("create_by", isEqualTo: currentUserReference)
      .get();
  return rs.docs.isNotEmpty ? true : false;
}
