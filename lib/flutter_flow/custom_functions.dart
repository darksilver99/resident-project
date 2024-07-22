import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference configReference() {
  return FirebaseFirestore.instance.doc("config/park_car_app");
}

DocumentReference projectReference(String projectDocID) {
  return FirebaseFirestore.instance.doc("project_list/$projectDocID");
}

String dateTh(DateTime date) {
  final DateFormat formatter = DateFormat('d MMMM yyyy', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

String dateTimeTh(DateTime date) {
  final DateFormat formatter = DateFormat('d MMMM yyyy HH:mm:ss', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

String getIssueStatus(
  int status,
  List<IssueStatusDataStruct> issueStatusList,
) {
  for (var dataStatus in issueStatusList) {
    if (dataStatus.status == status) {
      return dataStatus.subject;
    }
  }
  return '-';
}
