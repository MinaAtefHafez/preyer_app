import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_app/core/dependency_injection/dependency_injection.dart';
import 'package:prayer_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:prayer_app/features/home/presentation/cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCubit = sl<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      bloc: homeCubit,
      builder: (context, state) {
        return Scaffold(
          body: homeCubit.activeScreen[homeCubit.bottomNavBarIndex],
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey.shade500,
              showUnselectedLabels: true,
              currentIndex: homeCubit.bottomNavBarIndex,
              onTap: (index) {
                if (index < 3) {
                  homeCubit.changeBottomNavIndex(index);
                } else {
                  // Navigate
                }
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.alarm), label: 'الصلوات'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.mosque), label: 'القبة'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.date_range), label: 'هجرى'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz), label: 'المزيد')
              ]),
        );
      },
    );
  }
}
