import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'loading_list_view_widget.dart' show LoadingListViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingListViewModel extends FlutterFlowModel<LoadingListViewWidget> {
  ///  Local state fields for this component.

  List<int> tmpList = [0, 0, 0, 0, 0];
  void addToTmpList(int item) => tmpList.add(item);
  void removeFromTmpList(int item) => tmpList.remove(item);
  void removeAtIndexFromTmpList(int index) => tmpList.removeAt(index);
  void insertAtIndexInTmpList(int index, int item) =>
      tmpList.insert(index, item);
  void updateTmpListAtIndex(int index, Function(int) updateFn) =>
      tmpList[index] = updateFn(tmpList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
