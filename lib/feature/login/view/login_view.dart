import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:state_managements/feature/login/viewModel/login_view_model.dart';
import 'package:state_managements/product/constant/image_enum.dart';
import 'package:state_managements/product/page_padding.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String hintText = "Name";

  final String data = "Login";

  final String data2 = "Remember Me";

  final String login = "Login";

  late final LoginViewModel _loginViewModel;

  @override
  void initState() {
    _loginViewModel = LoginViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return _bodyView(context);
      },
    );
  }

  Scaffold _bodyView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const PagePadding.allLow(),
        child: Column(
          children: [
            AnimatedContainer(
              duration: context.durationLow,
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.2),
              width: context.dynamicWidth(0.3),
              child: ImageEnums.door.toImage,
            ),
            Text(
              login,
              style: context.textTheme.headlineMedium,
            ),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: hintText,
                focusColor: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Center(
                child: Text(data),
              ),
            ),
            CheckboxListTile(
              value: context.watch<LoginViewModel>().isCheckBoxOkay,
              title: Text(data2),
              onChanged: (value) {
                context.read<LoginViewModel>().checkBoxChange(value ?? false);
                _loginViewModel.checkBoxChange(value ?? false);
              },
            )
          ],
        ),
      ),
    );
  }
}
