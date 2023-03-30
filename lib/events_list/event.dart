import 'package:http/http.dart' as http;
import 'dart:convert';

class Event {
  String title;
  String? imageUrl;
  int? year;
  String description;
  String readMore;

  Event(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.year,
      required this.readMore});

  factory Event.fromJson(json) {
    return Event(
        title: json["pages"][0]["titles"]?["normalized"],
        imageUrl: json["pages"][0]["thumbnail"]?["source"],
        description: json["text"],
        year: json["year"],
        readMore: json["pages"][0]["content_urls"]?["mobile"]?["page"]
      );
  }

  @override
  String toString() {
    return "\ntitle = $title"
        "\nimageUrl = $imageUrl"
        "\ndescription = $description"
        "\nyear = $year";
  }
}

Future<List<Event>> fetch(
    String? langue, String? type, String? month, String? day) async {
  var url = Uri.parse(
      'https://api.wikimedia.org/feed/v1/wikipedia/$langue/onthisday/$type/$month/$day');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);
    List<dynamic> eventsJson = jsonData[type];
    List<Event> events =
        eventsJson.map((eventJson) => Event.fromJson(eventJson)).toList();
    return events;
  } else {
    throw Exception('Failed to load data');
  }
}
