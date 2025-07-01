import 'package:fitness/core/app_colors/colors.dart';
import 'package:fitness/features/app_sections/presentation/view/workouts/models/muscles_group_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({super.key, required this.content});
  List<MusclesGroupEntity> content;
  @override
  Widget build(BuildContext context) {
    return content.isEmpty
        ? Padding(
          padding: const EdgeInsets.only(top:16),
          child: Text(
            'Comming Soon',
            style: GoogleFonts.balooThambi2(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: AppColors.backgroundColor,
            ),
          ),
        )
        : Expanded(
          child: GridView.builder(
            padding: EdgeInsets.only(top: 24),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
            ),
            itemCount: content.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){},
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                        content[index].image!,
                        width: 163,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Text(
                        content[index].name!,
                        style: GoogleFonts.balooThambi2(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
  }
}
