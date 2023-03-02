import 'package:flutter/material.dart';
import 'package:on_this_day/events_list/event.dart';

class EventsList extends StatefulWidget {
  const EventsList({super.key});

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  late Future<List<Event>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetch("fr","events", "12", "26");
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
        return const CircularProgressIndicator();
      },
    );
  }

  Widget _card(Event event) {
    return Container(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
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
                          event.year.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(event.description),
                  )
                ]))));
  }

  @override
  Widget build(BuildContext context) {
    return _eventCards();
  }
}