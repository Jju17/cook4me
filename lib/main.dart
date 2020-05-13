import 'package:flutter/material.dart';
import 'views/home/home_view.dart';
import 'providers/meal_provider.dart';
import 'package:provider/provider.dart';
import 'views/not_found/not_found.dart';

main() {
  runApp(Cook4Me());
}

class Cook4Me extends StatefulWidget {
  @override
  _Cook4MeState createState() => _Cook4MeState();
}

class _Cook4MeState extends State<Cook4Me> {
  final MealProvider mealProvider = MealProvider();

  @override
  void initState() {
    mealProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: mealProvider),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => HomeView(),
        },
        onUnknownRoute: (_) => MaterialPageRoute(
          builder: (_) => NotFound(),
        ),
      ),
    );
  }
}
