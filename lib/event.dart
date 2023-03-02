import 'package:http/http.dart' as http;
import 'dart:convert';

class Event {
  String? title;
  String? imageUrl;
  String? year;
  String? description;

  Event({ 
    this.title,
    this.description,
    this.imageUrl,
    this.year
  });

  factory Event.fromJson(json) {
    return Event(
      title : json["pages"][0]["titles"]?["normalized"],
      imageUrl : json["pages"][0]["originalimage"]?["source"],
      description : json["text"],
      year : json["year"]
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

Future<List<Event>> fetch() async {
  var url = Uri.parse(
      'https://api.wikimedia.org/feed/v1/wikipedia/fr/onthisday/events/03/01');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);
    List<dynamic> eventsJson = jsonData['events'];
    List<Event> events =
        eventsJson.map((eventJson) => Event.fromJson(eventJson)).toList();
    return events;
  } else {
    throw Exception('Failed to load data');
  }
}
