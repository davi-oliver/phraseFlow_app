import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final emaillController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final countryController = TextEditingController();
  final birtyDayController = TextEditingController();

  group("Teste Formulario: isNotEmpty:", () {
    testWidgets("validate controller: email", (widgetTester) async {
      // validate email with @ and .com
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
                child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
              controller: emaillController,
            )),
          ),
        ),
      );
      await widgetTester.enterText(
          find.byType(TextFormField), 'davizr@gmail.com');
      expect(emaillController.text.isEmpty, false);
    });

    testWidgets("validate controller: password", (widgetTester) async {
      // validate password with 6 characters
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
                child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              controller: passwordController,
            )),
          ),
        ),
      );
      await widgetTester.enterText(find.byType(TextFormField), '123456');
      expect(passwordController.text.length, greaterThan(5));
    });

    testWidgets("validate controller: confirmPassword", (widgetTester) async {
      // validate confirmPassword with 6 characters
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
                child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Confirm Password',
              ),
              controller: confirmPasswordController,
            )),
          ),
        ),
      );
      await widgetTester.enterText(find.byType(TextFormField), '123456');
      expect(confirmPasswordController.text.length, greaterThan(5));
    });

    testWidgets("validate controller: name", (widgetTester) async {
      // validate name with 6 characters
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
                child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Name',
              ),
              controller: nameController,
            )),
          ),
        ),
      );
      await widgetTester.enterText(find.byType(TextFormField), 'Davi');
      expect(nameController.text, equals("Davi"));
    });

    testWidgets("validate controller: country", (widgetTester) async {
      // validate country with 6 characters
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
                child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Country',
              ),
              controller: countryController,
            )),
          ),
        ),
      );

      await widgetTester.enterText(find.byType(TextFormField), 'br');
      expect(countryController.text, equals("br"));
    });

    testWidgets("validate controller: birtyDay", (widgetTester) async {
      // validate birtyDay with 6 characters
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
                child: TextFormField(
              decoration: InputDecoration(
                hintText: 'BirtyDay',
              ),
              controller: birtyDayController,
            )),
          ),
        ),
      );
      await widgetTester.enterText(find.byType(TextFormField), '02/10/2000');
      expect(birtyDayController.text, equals("02/10/2000"));
    });
  });
}
