import 'package:flutter/material.dart';
import 'package:nibble_app/ui/views/day/day_view.dart';
import 'package:nibble_app/ui/views/week/week_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WeekView extends StatelessWidget {
  const WeekView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WeekViewModel>.reactive(
        viewModelBuilder: () => WeekViewModel(),
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: model.weekMeals.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                model.weekMeals[index].day!,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              RoundedButton(
                                  onPressed: () => model
                                      .addMeal(model.weekMeals[index].date!),
                                  label: 'Add Meal')
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          model.weekMeals[index].meals!.isEmpty
                              ? Center(
                                  child: Text(
                                    'No meals!',
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 10),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      model.weekMeals[index].meals!.length,
                                  itemBuilder: (context, mealIndex) =>
                                      Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      model.weekMeals[index].meals![mealIndex]
                                          .title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                      child: Divider(),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
