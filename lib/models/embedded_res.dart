class EmbeddedRes {
  final double temperature;
  final double humidity;
  final String name;
  final double growth;
  final bool lightOn;
  final double pH;

  EmbeddedRes(
    this.temperature,
    this.humidity,
    this.name,
    this.growth,
    this.lightOn,
    this.pH,
  );

  /// Contains some mock data
  factory EmbeddedRes.fromJson(dynamic json) {
    return EmbeddedRes(
        json['temperature'], json['humidity'], "Radish", 0.96, true, 7.2);
  }

  Map<String, dynamic> toMap() {
    return {
      "temperature": temperature,
      "humidity": humidity,
      "name": name,
      "growth": growth,
      "lightOn": lightOn,
      "pH": pH,
    };
  }

  @override
  String toString() {
    return "EmbeddedRes: ${toMap()}";
  }
}
