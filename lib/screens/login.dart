import 'package:flutter/material.dart';
import 'package:og_gamers/services/shared_preference_service.dart';

import '../constants.dart';
import '../routes/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  late FocusNode _userNameFocusNode;
  late FocusNode _passwordFocusNode;

  bool _enableBtn = true;
  final _form = GlobalKey<FormState>();
  final _userNameKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  void showMsg(context, String title, String content, String btnText) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(child: Text(content)),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text(btnText),
            )
          ],
        );
      },
    );
  }

  void _saveForm(context) async {
    bool? isValid = _form.currentState?.validate();
    if (isValid != null && isValid) {
      var user = _userName.text;
      var password = _password.text;
      var userCreds = kRegisteredUsers
          .firstWhere((map) => map["userName"] == user, orElse: () => {});
      if (userCreds.isNotEmpty) {
        if (userCreds["password"] == password) {
          Pref.setBool(kIsLoggedIn, true);
          Pref.setString(kUserId, user);
          Navigator.pushReplacementNamed(context, Routes.homeRoute,
              arguments: user);
        } else {
          showMsg(context, "Invalid Credentials!",
              "Please check your credentials", "Close");
        }
      } else {
        showMsg(context, "Invalid Credentials!",
            "Please check your credentials", "Close");
      }
    }
  }

  bool validateInput(value, {inputValidator = true}) {
    if (value == null ||
        (value != null && (value.length < 3 || value.length > 11))) {
      if (inputValidator) {
        setState(() {
          _enableBtn = false;
        });
      }
      return false;
    }
    return true;
  }

  void validateForm() {
    var userName = _userName.text;
    var password = _password.text;

    if (validateInput(userName, inputValidator: false) &&
        validateInput(password, inputValidator: false)) {
      if (!_enableBtn) {
        setState(() {
          _enableBtn =
              validateInput(userName) && validateInput(password) ? true : false;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _userNameFocusNode = FocusNode();
    _userNameFocusNode.addListener(() {
      if (!_userNameFocusNode.hasFocus) {
        _userNameKey.currentState?.validate();
      }
    });

    _passwordFocusNode = FocusNode();
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        _passwordKey.currentState?.validate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 75,
                  width: 150,
                  child: Image.asset(
                    "assets/gametv.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                  key: _form,
                  onChanged: validateForm,
                  child: Column(
                    children: [
                      TextFormField(
                        key: _userNameKey,
                        focusNode: _userNameFocusNode,
                        controller: _userName,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person), labelText: "User Name"),
                        validator: (String? value) {
                          return !validateInput(value)
                              ? "User Name must be between 3 to 11 characters"
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: _passwordKey,
                        focusNode: _passwordFocusNode,
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.security), labelText: "Password"),
                        validator: (String? value) {
                          return !validateInput(value)
                              ? "User Name must be between 3 to 11 characters"
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: kDarkBlack),
                        onPressed: _enableBtn ? () => _saveForm(context) : null,
                        child: const Text("Login"),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
