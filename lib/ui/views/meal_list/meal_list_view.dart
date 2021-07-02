import 'package:flutter/material.dart';
import 'package:nibble_app/ui/views/day/day_view.dart';
import 'package:nibble_app/ui/views/meal_list/meal_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MealListView extends StatelessWidget {
  const MealListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MealListViewModel>.reactive(
        viewModelBuilder: () => MealListViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Add Meal',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 30),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics()),
                          itemCount: model.mealList.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    model.mealList[index],
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  RoundedButton(
                                      onPressed: () => Navigator.pop(
                                          context, model.mealList[index]),
                                      label: 'Add')
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, index) =>
                              Divider(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
