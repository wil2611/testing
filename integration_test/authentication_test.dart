import 'package:f_testing_template/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  Future<Widget> createHomeScreen() async {
    WidgetsFlutterBinding.ensureInitialized();
    return const MyApp();
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();


  testWidgets("Login -> signup -> creación usuario -> login no exitoso",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
    await tester.pumpWidget(w);

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('SignUpPage')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'a@a.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '123456');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'b@a.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '123456');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);
  });

  testWidgets("Login -> signup -> creación usuario -> login exitoso -> logout",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
    await tester.pumpWidget(w);

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.tap(find.byKey(const Key('ButtonLoginCreateAccount')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('SignUpPage')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpEmail')), 'a@a.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldSignUpPassword')), '123456');

    await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginEmail')), 'a@a.com');

    await tester.enterText(
        find.byKey(const Key('TextFormFieldLoginPassword')), '123456');

    await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginScreen')), findsOneWidget);
    
    await tester.tap(find.byKey(const Key("ButtonHomeLogOff")));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("LoginScreen")), findsOneWidget);
  });

  testWidgets(
      "Login -> signup -> creación usuario -> login éxitoso -> logout -> login exitoso",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
  });

  testWidgets(
      "Login -> signup -> creación usuario -> login éxitoso -> logout -> login no exitoso",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
  });
}
