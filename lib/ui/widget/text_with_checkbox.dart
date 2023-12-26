import 'package:flutter/material.dart';

class TextWithCheckbox extends StatelessWidget {
  const TextWithCheckbox({
    required this.value,
    required this.onChanged,
    required this.title,
    super.key,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged.call(!value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: value, onChanged: onChanged),
          title,
        ],
      ),
    );
  }
}
