import 'package:flutter/material.dart';

class LabelCheckBox extends StatefulWidget {
  const LabelCheckBox({super.key, required this.checkboxLabel});
  final String checkboxLabel;
  @override
  State<LabelCheckBox> createState() => _LabelCheckBoxState();
}

class _LabelCheckBoxState extends State<LabelCheckBox> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          ischecked = !ischecked;
        });
      },
      child: Row(
        children: <Widget>[
          Checkbox(
              value: ischecked,
              onChanged: (value) {
                setState(() {
                  ischecked = !ischecked;
                });
              }),
          Text(
            widget.checkboxLabel,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
