import 'package:http/http.dart' as http;
import 'dart:convert';

class Event {
  String title; //events.pages.titles.display
  String imageUrl; //events.pages.originalimage.source
  String year; //events.year
  String description; //event.description

  Event({
    required this.title,
    required this.imageUrl,
    required this.year,
    required this.description,
  });

   fromJson(json): Post {
    Post p = new Post()
    p.name = ...
    return p
  }


}


  Future<Event> fetch() async {
    var url = Uri.parse(
        'https://api.wikimedia.org/feed/v1/wikipedia/fr/onthisday/events/03/01');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
List<Event> events = List<Event>.from(l.map((model)=> Event.fromJson(model)));


      var jsonResponse = jsonDecode(response.body.map();
      return Event(
        title: jsonResponse['events.pages.titles.display'],
        imageUrl: jsonResponse['imageUrl'],
        year: jsonResponse['date'],
        description: jsonResponse['description'],
      );
    } else {
      throw Exception('Failed to load data');
    }
  }
void main(List<String> args) {
  print(Event.fetch());
}
