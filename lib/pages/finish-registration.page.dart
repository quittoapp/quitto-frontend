import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:quitto/stores/finish-registration.store.dart';
import 'package:quitto/stores/user.store.dart';
import 'package:quitto/styles/dimensions.dart';
import 'package:quitto/styles/text-field-decoration.dart';
import 'package:quitto/styles/text-field-wrapper.dart';
import 'package:quitto/styles/text-styles.dart';
import 'package:quitto/widgets/time-picker.dart';

class FinishRegistration extends HookWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FinishRegistrationStore(),
      child: Builder(builder: (context) {
        final finishRegistrationStore =
            Provider.of<FinishRegistrationStore>(context);

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
                  TimePicker(
                      label: 'I usually start smoking at',
                      onChange: finishRegistrationStore.setSmokingStartTime),
                  SizedBox(height: Dimensions.xl),
                  TimePicker(
                      label: 'I usually finish smoking at',
                      onChange: finishRegistrationStore.setSmokingEndTime),
                  SizedBox(height: Dimensions.xl),
                  TextFieldWrapper(
                    label: 'Number of cigarettes per day',
                    child: TextField(
                      decoration: textFieldDecoration(''),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => finishRegistrationStore
                          .setSmokingsPerDay(int.parse(value)),
                    ),
                  ),
                  SizedBox(height: Dimensions.xl),
                  ..._buildErrors(finishRegistrationStore),
                  ElevatedButton(
                    onPressed: () => _finishRegistration(context),
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
      }),
    );
  }

  List<Widget> _buildErrors(FinishRegistrationStore finishRegistrationStore) {
    if (finishRegistrationStore.errors.isEmpty) {
      return [];
    }

    return finishRegistrationStore.errors.map((e) => Text(e)).toList();
  }

  void _finishRegistration(BuildContext context) async {
    final finishRegistrationStore =
        Provider.of<FinishRegistrationStore>(context, listen: false);
    final userStore = Provider.of<UserStore>(context, listen: false);

    await finishRegistrationStore.finishRegistration();
    await userStore.getMe();

    Navigator.of(context).pushReplacementNamed('/home');
  }
}
