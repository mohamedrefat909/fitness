import 'package:fitness/features/app/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:fitness/features/app/onboarding/presentation/widgets/custom_move_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('', () {
    // await widgetTester.pump();
    
    // onboarding screen
    testWidgets('Test Onboarding Screen ', (widgetTester) async {
      await widgetTester.pumpWidget(MaterialApp(home: OnboardingScreen()));
      expect(find.byType(Image), findsAtLeast(2));
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(Stack), findsAtLeast(2));
      await widgetTester.tap(find.text('Next'));
      await widgetTester.pump();
      expect(find.byType(Text), findsExactly(3));
      expect(find.text('Next'), findsExactly(2));
    });
    
    
    
    // Custom Move Button
    testWidgets('Test Custom move button', (widgetTester) async{
      final controller = PageController(initialPage: 1);
      await widgetTester.pumpWidget(MaterialApp(home: CustomMoveButton(text: 'text', controller: controller),));
    },);
    
    
  });
}
