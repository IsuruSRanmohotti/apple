import 'package:apple/controller/auth_controller.dart';
import 'package:apple/controller/user_controller.dart';
import 'package:apple/models/user_model.dart';
import 'package:apple/utils/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UserAuthProvider extends ChangeNotifier {
  final TextEditingController _userNameController = TextEditingController();
  TextEditingController get userNameController => _userNameController;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  void clearTextFields() {
    _userNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    notifyListeners();
  }

  Future<void> startCreateAccount(BuildContext context) async {
    if (_userNameController.text.trim().isEmpty) {
      CustomDialog.showCupertinoAlertDialog(context,
          title: 'Something went wrong!',
          subtitle: 'Please Check Your User Name');
    } else if (_emailController.text.trim().length < 3) {
      CustomDialog.showCupertinoAlertDialog(context,
          title: 'Something went wrong!', subtitle: 'Please Check Your Email');
    } else if (_passwordController.text != _confirmPasswordController.text) {
      CustomDialog.showCupertinoAlertDialog(context,
          title: 'Something went wrong!',
          subtitle: 'Please Check Your Password');
    } else {
      EasyLoading.show();
      await AuthController()
          .createUserAccount(
              _emailController.text, _passwordController.text, context)
          .then(
        (value) async {
          EasyLoading.dismiss();
          if (value != null) {
            UserModel user = UserModel(
                email: value.user!.email!,
                name: _userNameController.text.trim(),
                uid: value.user!.uid);

            await UserController().saveUserData(user);
          }
          clearTextFields();
        },
      );
    }
  }

  Future<void> startSignInUser(BuildContext context) async {
    if (_emailController.text.trim().isEmpty) {
      CustomDialog.showCupertinoAlertDialog(context,
          title: 'Something went wrong!', subtitle: 'Please Check Your Email');
    } else if (_passwordController.text.trim().isEmpty) {
      CustomDialog.showCupertinoAlertDialog(context,
          title: 'Something went wrong!',
          subtitle: 'Please Check Your Password');
    } else {
      EasyLoading.show();

      await AuthController()
          .signinUser(_emailController.text, _passwordController.text, context)
          .then(
        (value) {
          clearTextFields();
          EasyLoading.dismiss();
        },
      );
    }
  }

  Future<void> startSendPasswordResetEmail(BuildContext context) async {
    if (_emailController.text.trim().isEmpty) {
      CustomDialog.showCupertinoAlertDialog(context,
          title: 'Something went wrong', subtitle: 'Please check your email');
    } else {
      EasyLoading.show();
      await AuthController().sendPasswordResetEmail(_emailController.text).then(
        (value) {
          EasyLoading.dismiss();
          CustomDialog.showCupertinoAlertDialog(context,
              title: 'Success',
              subtitle: 'Please check your emails - ${_emailController.text}');
          clearTextFields();
        },
      );
    }
  }
}
