import 'package:flutter/material.dart';
import 'package:on_this_day/events_list/event.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsList extends StatefulWidget {
  EventsList({
    super.key, 
    required this.langue,
    required this.type,
    required this.day,
    required this.month
  });
  String? type;
  String? langue;
  String? day;
  String? month;

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  late Future<List<Event>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetch(widget.langue,
                      widget.type, 
                      widget.month,
                      widget.day);
  }

  Widget _eventCards() {
    return FutureBuilder<List<Event>>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!.map((event) {
              return _card(event);
            }).toList(),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _card(Event event) {
    return Container(
        padding: const EdgeInsets.fromLTRB(30,20,30,0),
        width: double.maxFinite,
        child: Card(
            elevation: 5,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  event.imageUrl != null ? ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network("${event.imageUrl}",
                        width: 320)) : Container(),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          event.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          event.year != null ? event.year.toString() : "",
                          style: const TextStyle(fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(event.description),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: GestureDetector(
                      onTap: () => launch(event.readMore),
                      child: const Text.rich(
                        TextSpan(
                          text: 'Read more...',
                          style: TextStyle(
                            color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  )
                ]))));
  }
  @override
  Widget build(BuildContext context) {
    return _eventCards();
  }
}
