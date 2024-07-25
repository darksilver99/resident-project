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

import '/backend/firebase_storage/storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter/services.dart';

Future<List<String>> uploadImageToFirebase(
  String type,
  List<FFUploadedFile> imageList,
) async {
  // Add your function code here!

  List<String> urlList = [];
  for (var i = 0; i < imageList.length; i++) {
    String path =
        'transaction/${FFAppState().currentProjectData.projectRef!.id}/$type/${imageList[i].name}';

    Uint8List compress = await FlutterImageCompress.compressWithList(
      imageList[i].bytes!,
      minWidth: 300,
      quality: 50,
    );

    var url = await uploadData(path, compress);
    if (url != null) {
      urlList.add(url);
    }
  }
  return urlList;
}
