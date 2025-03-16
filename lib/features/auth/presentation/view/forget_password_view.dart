import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/widgets/action_button.dart';
import '../../../../core/utils/widgets/input_field.dart';
import '../controller/login_bloc.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

final TextEditingController email = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                child: Image.asset(Assets.login),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Please enter your email to receive a code reset password",
              style: Styles.text18,
            ),
            const SizedBox(height: 15),
            InputField(
              borderColor: AppColors.grey5,
              borderThickness: 1.8,
              borderRadius: 4,
              labelText: "Email",
              endIcon: Icons.email,
              inputController: email,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return ActionButton(
                  text: "Login",
                  textColor: AppColors.whiteBG,
                  bgColor: AppColors.secondary,
                  borderRadius: 25,
                  isLoading: state is LoginLoading,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    context
                        .read<LoginBloc>()
                        .add(ForgetPasswordEvent(email: email.text));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
