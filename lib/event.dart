import 'package:http/http.dart' as http;
import 'dart:convert';

class Event {
  var id;
  var title;
  var imageUrl;
  var year;
  var description;

  Event();

  factory Event.fromJson(json) {
    Event event = Event();
    event.title = json["pages"][0]["titles"]["normalized"];
    event.imageUrl = json["pages"][0]["originalimage"] != null
        ? json["pages"][0]["originalimage"]["source"]
        : "no image to display";
    event.description = json["text"];
    event.year = json["year"];
    return event;
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
