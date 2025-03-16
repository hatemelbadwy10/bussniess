import 'package:business_app/core/services/navigation_service.dart';
import 'package:business_app/features/auth/presentation/controller/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app_routing/route_names.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/widgets/action_button.dart';
import '../../../../core/utils/widgets/input_field.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is VerifySuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("OTP Verified Successfully")),
              );
              // Navigate to the next screen (e.g., home page)
              getIt<NavigationService>().navigateToAndClearStack( RouteNames.homeView);
            } else if (state is VerifyFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
            }
          },
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Form(
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
                      const SizedBox(height: 15),
                      InputField(
                        borderColor: AppColors.grey5,
                        borderThickness: 1.8,
                        borderRadius: 4,
                        labelText: "OTP Code",
                        inputController: otpController,
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if (value == null || value.isEmpty || value.length != 6) {
                            return "Enter a valid 6-digit OTP";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      ActionButton(
                        text: "Verify",
                        textColor: AppColors.whiteBG,
                        bgColor: AppColors.secondary,
                        borderRadius: 25,
                        isLoading: state is VerifyLoading, // Show loading state
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;
                          context.read<LoginBloc>().add(
                            VerifyEvent(otp: otpController.text.trim()),
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Powered by 8WORX",
                          style: Styles.text13Bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
