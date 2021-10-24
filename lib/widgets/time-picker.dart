import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quitto/styles/dimensions.dart';
import 'package:quitto/styles/text-field-decoration.dart';
import 'package:quitto/styles/text-field-wrapper.dart';
import 'package:quitto/utils/noop.dart';

class TimePicker extends HookWidget {
  final String placeholder;
  final String label;
  final Function onChange;

  TimePicker({
    this.placeholder = 'Not selected',
    this.onChange = noop,
    required this.label,
  });

  Widget build(BuildContext context) {
    final value = useState<TimeOfDay?>(null);
    final textController = useTextEditingController();

    useEffect(() {
      if (value.value == null) {
        return;
      }

      textController.text =
          '${_formatTimePart(value.value!.hour.toString())}:${_formatTimePart(value.value!.minute.toString())}';
    }, [value.value]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: Dimensions.m),
        GestureDetector(
          child: TextFieldWrapper(
            child: TextField(
              controller: textController,
              enabled: false,
              decoration:
                  textFieldDecoration(value.value == null ? placeholder : ''),
            ),
          ),
          onTap: () async {
            _handleTimePickerOpen(context, value);
          },
        ),
      ],
    );
  }

  void _handleTimePickerOpen(context, value) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) {
      return;
    }

    value.value = time;
  }

  String _formatTimePart(String element) {
    return element.padLeft(2, '0');
  }
}
