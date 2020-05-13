import 'package:cook4me/models/meal_model.dart';
import 'package:cook4me/views/home/widgets/meal_card.dart';
import 'package:cook4me/widgets/c4m_loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/meal_model.dart';
import '../../providers/meal_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<Meal> meals = Provider.of<MealProvider>(context).meals;

    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text(
            'Cook4Me',
            style: GoogleFonts.pacifico(fontSize: 30.0),
          ),
          backgroundColor: Color.fromRGBO(145, 63, 48, 1)),
      body: Container(
        padding: EdgeInsets.all(10),
        child: RefreshIndicator(
          onRefresh: Provider.of<MealProvider>(context).fetchData,
          child: meals.length > 0
              ? ListView.builder(
                  itemBuilder: (_, i) => MealCard(
                    meal: meals[i],
                  ),
                  itemCount: meals.length,
                )
              : c4mLoading(),
        ),
      ),
    );
  }
}
