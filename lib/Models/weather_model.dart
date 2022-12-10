class Weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var windDirection;

  Weather({
    required this.cityName,
    required this.icon,
    required this.condition,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.windDirection,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    windDirection = json['current']['wind_dir'];
  }
}
