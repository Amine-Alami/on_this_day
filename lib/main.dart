import 'package:flutter/material.dart';
import 'package:on_this_day/events_list/events_list.dart';
import 'package:on_this_day/home/home.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => Font(widget: Home())),
  GoRoute(
      path: '/eventsList/:langue/:type/:day/:month',
      builder: (context, state) => Font(
            widget: EventsList(
                langue: state.params['langue'],
                day: state.params['day'],
                month: state.params['month'],
                type: state.params['type']),
          ))
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router, theme: ThemeData(useMaterial3: true));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Font(widget: Home());
  }
}

class Font extends StatelessWidget {
  const Font({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[600],
          title: Row(
            children: [
              ModalRoute.of(context)!.settings.name == '/'
                  ? const Icon(Icons.history_edu, size: 30, color: Colors.white)
                  : IconButton(
                      onPressed: () => GoRouter.of(context).go('/'),
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      )),
              const Text("  On This Day",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/back-image.jpg"),
                    fit: BoxFit.cover,
                    opacity: 0.6)),
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: widget
              )
            ));
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
