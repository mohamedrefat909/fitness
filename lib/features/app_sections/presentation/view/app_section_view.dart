import 'package:fitness/core/app_colors/colors.dart';
import 'package:fitness/features/app_sections/presentation/view_model/navigation_cubit.dart';
import 'package:fitness/features/app_sections/presentation/view_model/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSectionView extends StatelessWidget {
  const AppSectionView({super.key});

  final List<Widget> screens = const [
    Center(child: Text('Home')),
    Center(child: Text('Chat')),
    Center(child: Text('Workouts')),
    Center(child: Text('Profile')),
  ];

  final List<String> iconPaths = const [
    'assets/svgs/home.svg',
    'assets/svgs/chat.svg',
    'assets/svgs/gym.svg',
    'assets/svgs/profile.svg',
  ];

  final List<String> labels = const ['Home', 'Chat', 'Workouts', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        int currentIndex = state.index;

        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(child: screens[currentIndex]),
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.bottomNavColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BottomNavigationBar(
                    currentIndex: currentIndex,
                    onTap: (index) {
                      context.read<NavigationCubit>().changeIndex(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    selectedItemColor: AppColors.primaryColor,
                    unselectedItemColor: AppColors.white,
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    items: List.generate(4, (index) {
                      final isSelected = currentIndex == index;
                      return BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          iconPaths[index],
                          colorFilter: ColorFilter.mode(
                            isSelected ? AppColors.primaryColor : AppColors.white,
                            BlendMode.srcIn,
                          ),
                          width: 24,
                          height: 24,
                        ),
                        label: labels[index],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}