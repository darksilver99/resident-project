import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_currentProjectData')) {
        try {
          final serializedData =
              prefs.getString('ff_currentProjectData') ?? '{}';
          _currentProjectData =
              ProjectDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentResidentData')) {
        try {
          final serializedData =
              prefs.getString('ff_currentResidentData') ?? '{}';
          _currentResidentData = ResidentDataStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _currentBackgroundNumber = prefs.getInt('ff_currentBackgroundNumber') ??
          _currentBackgroundNumber;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int value) {
    _appBuildVersion = value;
  }

  ConfigDataStruct _configData = ConfigDataStruct();
  ConfigDataStruct get configData => _configData;
  set configData(ConfigDataStruct value) {
    _configData = value;
  }

  void updateConfigDataStruct(Function(ConfigDataStruct) updateFn) {
    updateFn(_configData);
  }

  ProjectDataStruct _currentProjectData = ProjectDataStruct();
  ProjectDataStruct get currentProjectData => _currentProjectData;
  set currentProjectData(ProjectDataStruct value) {
    _currentProjectData = value;
    prefs.setString('ff_currentProjectData', value.serialize());
  }

  void updateCurrentProjectDataStruct(Function(ProjectDataStruct) updateFn) {
    updateFn(_currentProjectData);
    prefs.setString('ff_currentProjectData', _currentProjectData.serialize());
  }

  ResidentDataStruct _currentResidentData = ResidentDataStruct();
  ResidentDataStruct get currentResidentData => _currentResidentData;
  set currentResidentData(ResidentDataStruct value) {
    _currentResidentData = value;
    prefs.setString('ff_currentResidentData', value.serialize());
  }

  void updateCurrentResidentDataStruct(Function(ResidentDataStruct) updateFn) {
    updateFn(_currentResidentData);
    prefs.setString('ff_currentResidentData', _currentResidentData.serialize());
  }

  String _defaultNetworkImage =
      'https://www.silver-api.com/smart-product/resident_app/no_pic.jpg';
  String get defaultNetworkImage => _defaultNetworkImage;
  set defaultNetworkImage(String value) {
    _defaultNetworkImage = value;
  }

  int _currentBackgroundNumber = 1;
  int get currentBackgroundNumber => _currentBackgroundNumber;
  set currentBackgroundNumber(int value) {
    _currentBackgroundNumber = value;
    prefs.setInt('ff_currentBackgroundNumber', value);
  }

  List<IssueStatusDataStruct> _issueStatusList = [
    IssueStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"รอเจ้าหน้าที่ตรวจสอบ\"}')),
    IssueStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"กำลังตรวจสอบ\"}')),
    IssueStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"กำลังดำเนินการ\"}')),
    IssueStatusDataStruct.fromSerializableMap(jsonDecode(
        '{\"status\":\"4\",\"subject\":\"ดำเนินการเรียบร้อยแล้ว\"}')),
    IssueStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"5\",\"subject\":\"ไม่สามารถดำเนินการได้\"}'))
  ];
  List<IssueStatusDataStruct> get issueStatusList => _issueStatusList;
  set issueStatusList(List<IssueStatusDataStruct> value) {
    _issueStatusList = value;
  }

  void addToIssueStatusList(IssueStatusDataStruct value) {
    issueStatusList.add(value);
  }

  void removeFromIssueStatusList(IssueStatusDataStruct value) {
    issueStatusList.remove(value);
  }

  void removeAtIndexFromIssueStatusList(int index) {
    issueStatusList.removeAt(index);
  }

  void updateIssueStatusListAtIndex(
    int index,
    IssueStatusDataStruct Function(IssueStatusDataStruct) updateFn,
  ) {
    issueStatusList[index] = updateFn(_issueStatusList[index]);
  }

  void insertAtIndexInIssueStatusList(int index, IssueStatusDataStruct value) {
    issueStatusList.insert(index, value);
  }

  List<StockStatusDataStruct> _stockStatusList = [
    StockStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"รอรับพัสดุ\"}')),
    StockStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"รับพัสดุแล้ว\"}'))
  ];
  List<StockStatusDataStruct> get stockStatusList => _stockStatusList;
  set stockStatusList(List<StockStatusDataStruct> value) {
    _stockStatusList = value;
  }

  void addToStockStatusList(StockStatusDataStruct value) {
    stockStatusList.add(value);
  }

  void removeFromStockStatusList(StockStatusDataStruct value) {
    stockStatusList.remove(value);
  }

  void removeAtIndexFromStockStatusList(int index) {
    stockStatusList.removeAt(index);
  }

  void updateStockStatusListAtIndex(
    int index,
    StockStatusDataStruct Function(StockStatusDataStruct) updateFn,
  ) {
    stockStatusList[index] = updateFn(_stockStatusList[index]);
  }

  void insertAtIndexInStockStatusList(int index, StockStatusDataStruct value) {
    stockStatusList.insert(index, value);
  }

  List<StatusDataStruct> _paymentStatusList = [
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"รอตรวจสอบ\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"รอตรวจสอบ\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"กำลังตรวจสอบ\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"4\",\"subject\":\"ชำระเรียบร้อยแล้ว\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"5\",\"subject\":\"ไม่สามารถตรวจสอบได้\"}'))
  ];
  List<StatusDataStruct> get paymentStatusList => _paymentStatusList;
  set paymentStatusList(List<StatusDataStruct> value) {
    _paymentStatusList = value;
  }

  void addToPaymentStatusList(StatusDataStruct value) {
    paymentStatusList.add(value);
  }

  void removeFromPaymentStatusList(StatusDataStruct value) {
    paymentStatusList.remove(value);
  }

  void removeAtIndexFromPaymentStatusList(int index) {
    paymentStatusList.removeAt(index);
  }

  void updatePaymentStatusListAtIndex(
    int index,
    StatusDataStruct Function(StatusDataStruct) updateFn,
  ) {
    paymentStatusList[index] = updateFn(_paymentStatusList[index]);
  }

  void insertAtIndexInPaymentStatusList(int index, StatusDataStruct value) {
    paymentStatusList.insert(index, value);
  }

  List<StatusDataStruct> _helpStatusList = [
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"รอตรวจสอบ\"}')),
    StatusDataStruct.fromSerializableMap(jsonDecode(
        '{\"status\":\"1\",\"subject\":\"ดำเนินการเรียบร้อยแล้ว\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"ไม่สามารถดำเนินการได้\"}'))
  ];
  List<StatusDataStruct> get helpStatusList => _helpStatusList;
  set helpStatusList(List<StatusDataStruct> value) {
    _helpStatusList = value;
  }

  void addToHelpStatusList(StatusDataStruct value) {
    helpStatusList.add(value);
  }

  void removeFromHelpStatusList(StatusDataStruct value) {
    helpStatusList.remove(value);
  }

  void removeAtIndexFromHelpStatusList(int index) {
    helpStatusList.removeAt(index);
  }

  void updateHelpStatusListAtIndex(
    int index,
    StatusDataStruct Function(StatusDataStruct) updateFn,
  ) {
    helpStatusList[index] = updateFn(_helpStatusList[index]);
  }

  void insertAtIndexInHelpStatusList(int index, StatusDataStruct value) {
    helpStatusList.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
