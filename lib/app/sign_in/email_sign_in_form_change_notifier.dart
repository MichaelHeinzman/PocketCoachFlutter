import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_coach/app/sign_in/email_sign_in_change_model.dart';
import 'package:pocket_coach/common_widgets/form_submit_button.dart';
import 'package:pocket_coach/common_widgets/platform_exception_alert_dialog.dart';
import 'package:pocket_coach/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'email_sign_in_model.dart';
import 'package:intl/intl.dart';

class EmailSignInFormChangeNotifier extends StatefulWidget {
  EmailSignInFormChangeNotifier({@required this.model});
  final EmailSignInChangeModel model;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<EmailSignInChangeModel>(
      builder: (context) => EmailSignInChangeModel(auth: auth),
      child: Consumer<EmailSignInChangeModel>(
        builder: (context, model, _) =>
            EmailSignInFormChangeNotifier(model: model),
      ),
    );
  }

  @override
  _EmailSignInFormChangeNotifierState createState() =>
      _EmailSignInFormChangeNotifierState();
}

class _EmailSignInFormChangeNotifierState
    extends State<EmailSignInFormChangeNotifier> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  EmailSignInChangeModel get model => widget.model;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      await model.submit();
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Sign in failed',
        exception: e,
      ).show(context);
    }
  }

  void _emailEditingComplete() {
    final newFocus = model.emailValidator.isValid(model.email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _toggleFormType() {
    model.toggleFormType();
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    if (model.formType == EmailSignInFormType.signIn) {
      return [
        _buildEmailTextField(),
        SizedBox(height: 8.0),
        _buildPasswordTextField(),
        SizedBox(height: 8.0),
        FormSubmitButton(
          text: model.primaryButtonText,
          onPressed: model.canSubmit ? _submit : null,
        ),
        SizedBox(height: 8.0),
        FlatButton(
          child: Text(model.secondaryButtonText),
          onPressed: !model.isLoading ? _toggleFormType : null,
        ),
      ];
    } else {
      return [
        _buildEmailTextField(),
        SizedBox(height: 8.0),
        _buildPasswordTextField(),
        _buildUsernameTextField(),
        _buildFullNameTextField(),
        _buildWeightTextField(),
        _buildSexDropdown(),
        _buildHeightDropdown(),
        _buildGoalsDropdown(),
        FormSubmitButton(
          text: model.primaryButtonText,
          onPressed: model.canSubmit ? _submit : null,
        ),
        SizedBox(height: 8.0),
        FlatButton(
          child: Text(model.secondaryButtonText),
          onPressed: !model.isLoading ? _toggleFormType : null,
        ),
      ];
    }
  }

  DropdownButton<String> _buildGoalsDropdown() {
    return DropdownButton<String>(
      value: model.goal,
      items: <String>['Build Muscle', 'Lose Weight', 'General Health']
          .map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      hint: Text('Goal'),
      onChanged: model.updateGoal,
    );
  }

  TextField _buildWeightTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Weight',
        enabled: model.isLoading == false,
      ),
      textInputAction: TextInputAction.done,
      onChanged: model.updateWeight,
    );
  }

  Row _buildHeightDropdown() {
    return Row(children: <Widget>[
      DropdownButton<String>(
        value: model.heightFeet,
        items: <String>['1\'', '2\'', '3\'', '4\'', '5\'', '6\'', '7\'', '8\'']
            .map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        hint: Text('Height'),
        onChanged: model.updateHeightFeet,
      ),
      DropdownButton<String>(
        value: model.heightInches,
        items: <String>[
          '0\'\'',
          '1\'\'',
          '2\'\'',
          '3\'\'',
          '4\'',
          '5\'\'',
          '6\'\'',
          '7\'\'',
          '8\'\'',
          '9\'\'',
          '10\'\'',
          '11\'\''
        ].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        hint: Text('Inches'),
        onChanged: model.updateHeightInches,
      ),
    ]);
  }

  DropdownButton<String> _buildSexDropdown() {
    return DropdownButton<String>(
      value: model.sex,
      items: <String>['Male', 'Female'].map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      hint: Text('Sex'),
      onChanged: model.updateSex,
    );
  }

  TextField _buildFullNameTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Full Name',
        enabled: model.isLoading == false,
      ),
      textInputAction: TextInputAction.done,
      onChanged: model.updateFullName,
    );
  }

  List<Widget> _buildBirthdayDropDown() {
    final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
    final timeFormat = DateFormat("h:mm a");
    return [
      DateTimePickerFormField(
        format: dateFormat,
        onChanged: (date) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('$date')));
        },
      ),
      TimePickerFormField(
        format: timeFormat,
        onChanged: (time) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('$time')));
        },
      ),
      DateTimePickerFormField(
        format: dateFormat,
        enabled: false,
        dateOnly: true,
      ),
      TimePickerFormField(
        format: toDateFormat(TimeOfDayFormat.HH_colon_mm),
        enabled: false,
      ),
    ];
  }

  TextField _buildUsernameTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Username',
        enabled: model.isLoading == false,
      ),
      textInputAction: TextInputAction.done,
      onChanged: model.updateUsername,
    );
  }

  TextField _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'Password',
        errorText: model.passwordErrorText,
        enabled: model.isLoading == false,
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: model.updatePassword,
      onEditingComplete: _submit,
    );
  }

  TextField _buildEmailTextField() {
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'test@test.com',
        errorText: model.emailErrorText,
        enabled: model.isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: model.updateEmail,
      onEditingComplete: () => _emailEditingComplete(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
