import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.arguments});
  final Map<String,dynamic>arguments;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();

}


class _ResetPasswordState extends State<ResetPassword> {
  final emailController = TextEditingController();
  final codeController = TextEditingController();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    codeController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
  }
  @override
  void initState() {
    emailController.text = widget.arguments['email'];

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
          key: _formKey,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 250,
              child: Image.asset(Assets.login), // Reuse login image
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Enter the OTP sent to your phone",
            style: Styles.text18,
          ),
        ],
      )),
    );
  }
}
