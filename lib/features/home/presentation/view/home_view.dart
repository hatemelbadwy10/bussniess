import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/styles.dart';
import '../../../../user_info/user_info_bloc.dart';
import '../widgets/home_action_card.dart';
import '../widgets/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(height: 20),
              Text(
                _getGreeting(),
                style: Styles.text18,
              ),
              const SizedBox(height: 4),
              Text(
                context.read<UserInfoBloc>().state.user?.data?.user?.firstName ?? "",
                style: Styles.text22Bold,
              ),
              const SizedBox(height: 4),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Last Login: 14th Feb",
              //       style: Styles.text13,
              //     ),
              //   ],
              // ),
              const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: HomeActionCard(
              ),
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning,";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon,";
    } else {
      return "Good Evening,";
    }
  }
}
