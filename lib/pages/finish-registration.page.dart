import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quitto/styles/dimensions.dart';
import 'package:quitto/styles/text-field-decoration.dart';
import 'package:quitto/styles/text-field-wrapper.dart';
import 'package:quitto/styles/text-styles.dart';
import 'package:quitto/widgets/time-picker.dart';

class FinishRegistration extends HookWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.l,
            vertical: Dimensions.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Finish registration', style: TextStyles.heading),
              SizedBox(height: Dimensions.xl),
              TimePicker(label: 'I usually start smoking at'),
              SizedBox(height: Dimensions.xl),
              TimePicker(label: 'I usually finish smoking at'),
              SizedBox(height: Dimensions.xl),
              TextFieldWrapper(
                label: 'Number of cigarettes per day',
                child: TextField(
                  decoration: textFieldDecoration(''),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: Dimensions.xl),
              ElevatedButton(
                onPressed: () {},
                child: Text('Finish registration'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 30),
                  ),
                  elevation: MaterialStateProperty.all(6.0),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(Dimensions.m),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
