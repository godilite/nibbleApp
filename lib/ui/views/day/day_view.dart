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
                    onPressed: () => model.selectTime(context),
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
                      model.selectedDate,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    RoundedButton(onPressed: () {}, label: 'Add Meal')
                  ],
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
