import 'package:cook4me/models/meal_model.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  MealCard({this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              fit: BoxFit.cover,
              image: NetworkImage(meal.image),
              child: InkWell(
                onTap: () {
                  /*
									Navigator.pushNamed(
										context,
										'/city',
										arguments: meal.name,
									);
									 */
                },
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: Colors.black54,
                child: Text(
                  meal.name,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
