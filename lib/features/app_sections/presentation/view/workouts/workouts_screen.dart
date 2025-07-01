import 'package:fitness/core/app_colors/colors.dart';
import 'package:fitness/core/widgets/app_section.dart';
import 'package:fitness/features/app_sections/presentation/view/workouts/models/muscles_group_entity.dart';
import 'package:fitness/features/app_sections/presentation/view/workouts/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutsScreen extends StatelessWidget {
  WorkoutsScreen({super.key});
  final List<String> sections = [
    'full Body',
    'chest',
    'chest',
    'chest',
    'chest',
    'chest',
    'chest',
    'chest',
    'chest',
    'chest',
    'chest',
    'chest',
    'chest',
    'chest',
    'back',
    'legs',
    'chest',
    'chest',
    'chest',
    'chest',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Text(
              'Workouts',
              style: GoogleFonts.balooThambi2(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: AppColors.backgroundColor,
              ),
            ),
            const SizedBox(height: 24),
            AppSection(items: sections),
            CustomGridView(

              content: [
               MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                   MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
                 MusclesGroupEntity(
                  id: '67c8499726895f87ce0aa9be',
                  name: 'Pectoralis Major',
                  image: 'https://iili.io/33p7y9p.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
