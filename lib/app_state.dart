import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _invitationLink = prefs.getString('ff_invitationLink') ?? _invitationLink;
  }

  late SharedPreferences prefs;

  bool agreeCheck = false;

  List<String> homeTimeEvents = ['onComplete', 'onTap'];

  int sliderValue = 4;

  List<double> sliderGradientStops = [0, 0.3, 0.5, 0.7, 0.8, 1];

  List<int> sliderColors = [
    4281199971,
    4288667470,
    4294244426,
    4294361924,
    4294541630,
    4294720046
  ];

  List<double> sliderStops = [0.7, 1];

  String _invitationLink =
      'https://sosapp.gbvolkoff.name?apn=com.gv.sosapp&ibi=com.gv.sosapp&link=https%3A%2F%2Fsosapp.gbvolkoff.name%2FacceptInvitation%3FhostUID%3D';
  String get invitationLink => _invitationLink;
  set invitationLink(String _value) {
    _invitationLink = _value;
    prefs.setString('ff_invitationLink', _value);
  }

  int chatMaxDuration = 300;

  String msgImg = '';
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
