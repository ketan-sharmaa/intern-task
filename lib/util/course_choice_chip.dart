import 'package:flutter/material.dart';

class CourseChoiceChip extends StatefulWidget {
  const CourseChoiceChip({super.key});

  @override
  State<CourseChoiceChip> createState() => _CourseChoiceChipState();
}

class _CourseChoiceChipState extends State<CourseChoiceChip> {
  late int defaultChoiceIndex;
  final List<String> choicesList = ['Beginner', 'Intermediate', 'Expert'];

  @override
  void initState() {
    super.initState();
    defaultChoiceIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(choicesList.length, (index) {
        return ChoiceChip(
          labelPadding: const EdgeInsets.symmetric(horizontal: 18.0),
          label: Text(
            choicesList[index],
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: defaultChoiceIndex == index
                    ? Colors.white
                    : Theme.of(context).primaryColor),
          ),
          side: BorderSide(color: Theme.of(context).primaryColor),
          selected: defaultChoiceIndex == index,
          selectedColor: Theme.of(context).primaryColor,
          onSelected: (value) {
            setState(() {
              defaultChoiceIndex = value ? index : defaultChoiceIndex;
            });
          },
          elevation: 1,
        );
      }),
    );
  }
}
