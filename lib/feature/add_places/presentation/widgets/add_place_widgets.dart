import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';

class DropDownTextField extends StatefulWidget {
  final String hintText;
  final List<String> options;
  final void Function(String?) onChanged;
  final String? selectedOption;
  final Function? addClicked;
  final bool withAdd;

  const DropDownTextField({
    Key? key,
    required this.hintText,
    required this.options,
    required this.onChanged,
    required this.selectedOption,
    this.addClicked,
    this.withAdd = false,
  }) : super(key: key);

  @override
  DropDownTextFieldState createState() => DropDownTextFieldState();
}

class DropDownTextFieldState extends State<DropDownTextField> {
  String? _selectedOption;

  @override
  void initState() {
    _selectedOption = widget.selectedOption;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DropDownTextField oldWidget) {
    _selectedOption = widget.selectedOption;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.withAdd && !widget.options.contains("add")) {
      widget.options.add("add");
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        color: Colors.black12.withAlpha(11),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(20),
          iconDisabledColor: Colors.blue,
          iconEnabledColor: Colors.blue,
          value: _selectedOption,
          hint: Text(widget.hintText,
              style:
                  StylesText.newDefaultTextStyle.copyWith(color: Colors.grey)),
          isExpanded: true,
          onChanged: (value) {
            if (widget.withAdd && value == "add") {
              widget.addClicked?.call();
            } else {
              setState(() {
                _selectedOption = value;
                widget.onChanged(value);
              });
            }
          },
          items: widget.options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: StylesText.newDefaultTextStyle
                    .copyWith(color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
