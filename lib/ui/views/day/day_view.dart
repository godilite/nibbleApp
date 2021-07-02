import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'day_viewmodel.dart';

class DayView extends StatelessWidget {
  const DayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DayViewModel>.reactive(
        viewModelBuilder: () => DayViewModel(),
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: RoundedButton(
                    onPressed: () => model.selectDate(context),
                    label: 'Change Date',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.selectedDateString,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    RoundedButton(onPressed: model.addMeal, label: 'Add Meal')
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: model.dailyMeals.isEmpty
                      ? Center(
                          child: Text(
                            'No meals added!',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 20),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) =>
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  model.dailyMeals[index].title!,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                          separatorBuilder: (BuildContext context, index) =>
                              SizedBox(
                                height: 10,
                              ),
                          itemCount: model.dailyMeals.length),
                )
              ],
            ),
          );
        });
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.shade900,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
