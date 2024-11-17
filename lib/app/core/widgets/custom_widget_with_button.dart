import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/cupertino.dart';

class CustomWidgetWithButton extends StatelessWidget {
  Widget widget, button;
  CustomWidgetWithButton({required this.widget, required this.button});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: widget,
        ),
        10.width,
        Expanded(
          flex: 2,
          child: button,
        )
      ],
    );
  }

  _widgetWithButton({required Widget textField, required Widget button}) => Row(
    children: [
      Expanded(
        flex: 8,
        child: textField,
      ),
      10.width,
      Expanded(
        flex: 2,
        child: button,
      )
    ],
  );

}
