import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  setUp(() {
    emailController.text = '';
    passwordController.text = '';
  });
  testWidgets('login widget test controlles email and password ...',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
              child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
            ),
            controller: emailController,
          )),
        ),
      ),
    );
    await tester.enterText(find.byType(TextFormField), 'davizr4@gmail.com');

    expect(emailController.text.isNotEmpty, true);
    expect(emailController.text.contains("@"), isTrue);
    expect(emailController.text.contains(".com"), true);

    await tester.pumpWidget(
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

    await tester.enterText(find.byType(TextFormField), '123456');

    expect(passwordController.text.isNotEmpty, true);
    expect(passwordController.text.length, 6);
  });
}
