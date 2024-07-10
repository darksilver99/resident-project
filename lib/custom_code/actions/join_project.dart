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

Future<DocumentReference> joinProject(
  String projectDocID,
  String contactAddress,
) async {
  // Add your function code here!
  CollectionReference residents = FirebaseFirestore.instance
      .collection('project_list/$projectDocID/resident_list');
  DocumentReference docRef = await residents.add({
    "create_date": getCurrentTimestamp,
    "create_by": currentUserReference,
    "status": 0,
    "contact_address": contactAddress
  });
  return docRef;
}
