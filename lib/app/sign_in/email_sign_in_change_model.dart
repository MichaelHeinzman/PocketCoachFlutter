import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:pocket_coach/app/sign_in/email_sign_in_model.dart';
import 'package:pocket_coach/app/sign_in/validators.dart';
import 'package:pocket_coach/services/auth.dart';
import 'package:pocket_coach/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailSignInChangeModel with EmailAndPasswordValidators, ChangeNotifier {
  EmailSignInChangeModel({
    @required this.auth,
    this.email = '',
    this.password = '',
    this.sex = null,
    this.formType = EmailSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
    this.heightFeet = null,
    this.heightInches = null,
    this.goal = null,
    this.fullName = null,
    this.username = null,
    this.weight = null,
  });
  final AuthBase auth;
  String email;
  String password;
  EmailSignInFormType formType;
  bool isLoading;
  bool submitted;
  String sex = null;
  String heightFeet = null;
  String heightInches = null;
  String goal = null;
  Database db = Database();
  String username;
  String fullName;
  int weight;

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      if (this.formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassword(this.email, this.password);
      } else {
        User user = await auth.createUserWithEmailAndPassword(
            this.email, this.password);
        db.createUser(
            user.uid,
            this.email,
            this.username,
            this.fullName,
            this.weight,
            this.sex,
            this.heightFeet,
            this.heightInches,
            this.goal);
      }
    } catch (e) {
      rethrow;
    } finally {
      updateWith(isLoading: false);
    }
  }

  String get primaryButtonText {
    return formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
  }

  String get secondaryButtonText {
    return formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
  }

  bool get canSubmit {
    return emailValidator.isValid(email) &&
        passwordValidator.isValid(password) &&
        !isLoading;
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  void toggleFormType() {
    final formType = this.formType == EmailSignInFormType.signIn
        ? EmailSignInFormType.register
        : EmailSignInFormType.signIn;
    updateWith(
      email: '',
      password: '',
      formType: formType,
      isLoading: false,
      submitted: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateUsername(String username) => updateWith(username: username);

  void updateFullName(String fullName) => updateWith(fullName: fullName);

  void updateWeight(String weight) {
    int weightInt = int.parse(weight);
    updateWith(weight: weightInt);
  }

  void updateSex(String sex) => updateWith(sex: sex);

  void updateHeightFeet(String heightFeet) =>
      updateWith(heightFeet: heightFeet);

  void updateHeightInches(String heightInches) =>
      updateWith(heightInches: heightInches);

  void updateGoal(String goal) => updateWith(goal: goal);

  void updateWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
    String sex,
    String heightFeet,
    String heightInches,
    String goal,
    String fullName,
    String username,
    int weight,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.formType = formType ?? this.formType;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;
    this.sex = sex ?? this.sex;
    this.heightFeet = heightFeet ?? this.heightFeet;
    this.heightInches = heightInches ?? this.heightInches;
    this.goal = goal ?? this.goal;
    this.fullName = fullName ?? this.fullName;
    this.username = username ?? this.username;
    this.weight = weight ?? this.weight;
    notifyListeners();
  }
}
