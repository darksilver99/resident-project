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
