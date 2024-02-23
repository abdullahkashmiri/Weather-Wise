class CurrentWeather {
  CurrentWeather({
    Location? location,
    Current? current,
  })   : _location = location ?? Location(),
        _current = current ?? Current();

  Location _location = Location();
  Current? _current = Current();

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    _location = json['location'] != null
        ? Location.fromJson(json['location'])
        : Location();
    _current = json['current'] != null
        ? Current.fromJson(json['current'])
        : Current();
  }

  CurrentWeather copyWith({
    Location? location,
    Current? current,
  }) =>
      CurrentWeather(
        location: location ?? _location,
        current: current ?? _current,
      );

  Location get location => _location;
  Current? get current => _current;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['location'] = _location.toJson();
    if (_current != null) {
      map['current'] = _current!.toJson();
    }
    return map;
  }
}

class Location {
  Location({
    String? name,
    String? region,
    String? country,
    num? lat,
    num? lon,
    String? tzId,
    num? localtimeEpoch,
    String? localtime,
  }) {
    _name = name ?? '';
    _region = region;
    _country = country;
    _lat = lat;
    _lon = lon;
    _tzId = tzId;
    _localtimeEpoch = localtimeEpoch;
    _localtime = localtime;
  }

  Location.fromJson(dynamic json) {
    _name = json['name'] ?? '';
    _region = json['region'];
    _country = json['country'];
    _lat = json['lat'];
    _lon = json['lon'];
    _tzId = json['tz_id'];
    _localtimeEpoch = json['localtime_epoch'];
    _localtime = json['localtime'];
  }

  String _name = '';
  String? _region;
  String? _country;
  num? _lat;
  num? _lon;
  String? _tzId;
  num? _localtimeEpoch;
  String? _localtime;

  Location copyWith({
    String? name,
    String? region,
    String? country,
    num? lat,
    num? lon,
    String? tzId,
    num? localtimeEpoch,
    String? localtime,
  }) =>
      Location(
        name: name ?? _name,
        region: region ?? _region,
        country: country ?? _country,
        lat: lat ?? _lat,
        lon: lon ?? _lon,
        tzId: tzId ?? _tzId,
        localtimeEpoch: localtimeEpoch ?? _localtimeEpoch,
        localtime: localtime ?? _localtime,
      );

  String get name => _name;
  String? get region => _region;
  String? get country => _country;
  num? get lat => _lat;
  num? get lon => _lon;
  String? get tzId => _tzId;
  num? get localtimeEpoch => _localtimeEpoch;
  String? get localtime => _localtime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['region'] = _region;
    map['country'] = _country;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['tz_id'] = _tzId;
    map['localtime_epoch'] = _localtimeEpoch;
    map['localtime'] = _localtime;
    return map;
  }
}

class Current {
  // double? lastUpdatedEpoch;
  // DateTime? lastUpdated;
  double? tempC;
  double? tempF;
  //  double? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  // double? windDegree;
  // String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  // double? visKm;
  // double? visMiles;
  double? uv;
  // double? gustMph;
  // double? gustKph;

  Current({
    // this.lastUpdatedEpoch,
    // this.lastUpdated,
    this.tempC,
    this.tempF,
    // this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    // this.windDegree,
    // this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    // this.visKm,
    // this.visMiles,
    this.uv,
    // this.gustMph,
    // this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    var condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    var current = Current(
      //    lastUpdatedEpoch: json['last_updated_epoch'],
      //    lastUpdated: DateTime.parse(json['last_updated']),
      tempC: json['temp_c'],
      tempF: json['temp_f'],
      //    isDay: json['is_day'],
      condition: condition,
      windMph: json['wind_mph'],
      windKph: json['wind_kph'],
      // windDegree: json['wind_degree'],
      // windDir: json['wind_dir'],
      pressureMb: json['pressure_mb'],
      pressureIn: json['pressure_in'],
      precipMm: json['precip_mm'],
      precipIn: json['precip_in'],
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslikeC: json['feelslike_c'],
      feelslikeF: json['feelslike_f'],
      // visKm: json['vis_km'],
      // visMiles: json['vis_miles'],
      uv: json['uv'],
      // gustMph: json['gust_mph'],
      // gustKph: json['gust_kph'],
    );
    return current;
  }


  Map<String, dynamic> toJson() {
    return {
      // 'last_updated_epoch': lastUpdatedEpoch,
      //  'last_updated': lastUpdated,
      'temp_c': tempC,
      'temp_f': tempF,
      //   'is_day': isDay,
      'condition': condition?.toJson(),
      'wind_mph': windMph,
      'wind_kph': windKph,
      // 'wind_degree': windDegree,
      // 'wind_dir': windDir,
      'pressure_mb': pressureMb,
      'pressure_in': pressureIn,
      'precip_mm': precipMm,
      'precip_in': precipIn,
      'humidity': humidity,
      'cloud': cloud,
      'feelslike_c': feelslikeC,
      'feelslike_f': feelslikeF,
      // 'vis_km': visKm,
      // 'vis_miles': visMiles,
      'uv': uv,
      // 'gust_mph': gustMph,
      // 'gust_kph': gustKph,
    };
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'icon': icon,
      'code': code,
    };
  }
}
