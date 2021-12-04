class EmbeddedRes {
  final double temperature;

  final double humidity;

  EmbeddedRes(this.temperature, this.humidity);

  factory EmbeddedRes.fromJson(dynamic json) {
    return EmbeddedRes(json['temperature'], json['humidity']);
  }

  Map<String, double> toMap() {
    return {
      "temperature": temperature,
      "humidity": humidity,
    };
  }

  @override
  String toString() {
    return "EmbeddedRes: ${toMap()}";
  }
}
