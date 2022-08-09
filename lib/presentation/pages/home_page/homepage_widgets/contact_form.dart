import 'package:flutter/material.dart';

import '../../../common/space.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Form',
          style: getMediumStyle(
              color: ColorManager.title_font_color_light, fontSize: 20),
          textAlign: TextAlign.left,
        ),
        verticalSpace(24),
        TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: HexColor.fromHex('#80BDFF'), width: 3.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            labelText: 'Your Name*',
          ),
        ),
      ],
    );
  }
}
