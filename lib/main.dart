import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => FirstPage(),
        );
      case '/second':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => SecondPage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => FirstPage(),
        );
    }
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/second'),
              child: Text('PUSH'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed('/second'),
              child: Text('REPLACE'),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('POP'),
        ),
      ),
    );
  }
}
