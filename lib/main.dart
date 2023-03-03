import 'package:flutter/material.dart';
import 'package:on_this_day/events_list/events_list.dart';
import 'package:on_this_day/home/home.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => Home()),
  GoRoute(path: '/events', builder: (context, state) => const EventsList())
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ON THIS DAY ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 118, 51, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '  On This Day'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[600],
          title: Row(
            children: [
              const Icon(
                Icons.history_edu,
                size: 40,
                color: Colors.white
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                )
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/back-image.jpg"),
              fit: BoxFit.cover,
              opacity: 0.5
            )
          ),
          child: Home()));
  }
}
