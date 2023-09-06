// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_testing_template/ui/pages/authentication/login.dart';
import 'package:f_testing_template/ui/pages/authentication/signup.dart';
import 'package:f_testing_template/ui/pages/content/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
void main() {
  testWidgets(
      'Widget login validación @ email', (WidgetTester tester) async {
        final login_key = Key("LoginScreen");

        await tester.pumpWidget(GetMaterialApp(
          home:  LoginScreen(
          key: login_key,
          email: "blank",
          password: "blank",
        )
        ));
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "correo sin ");
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "1111111");
      await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
      await tester.pumpAndSettle();
      expect(find.text("Enter valid email address"), findsOneWidget);
      

      });

  testWidgets('Widget login validación campo vacio email',
      (WidgetTester tester) async {
        final login_key = Key("LoginScreen");

        await tester.pumpWidget(GetMaterialApp(
          home:  LoginScreen(
          key: login_key,
          email: "blank",
          password: "blank",
        )
        ));
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "");
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "1111111");
      await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
      await tester.pumpAndSettle();
      expect(find.text("Enter email"), findsOneWidget);
      

      });

  testWidgets('Widget login validación número de caracteres password',
      (WidgetTester tester) async {
        final login_key = Key("LoginScreen");

        await tester.pumpWidget(GetMaterialApp(
          home:  LoginScreen(
          key: login_key,
          email: "blank",
          password: "blank",
        )
        ));
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "emaeil@g.c");
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "11111");
      await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
      await tester.pumpAndSettle();
      expect(find.text("Password should have at least 6 characters"), findsOneWidget);
      

      });
  testWidgets('Widget login validación campo vacio password',
      (WidgetTester tester) async {
        final login_key = Key("LoginScreen");

        await tester.pumpWidget(GetMaterialApp(
          home:  LoginScreen(
          key: login_key,
          email: "blank",
          password: "blank",
        )
        ));
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "emaeil@g.c");
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "");
      await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
      await tester.pumpAndSettle();
      expect(find.text("Enter password"), findsOneWidget);
      

      });

  testWidgets(
      'Widget login autenticación exitosa', (WidgetTester tester) async {
        final login_key = Key("LoginScreen");

        await tester.pumpWidget(GetMaterialApp(
          home:  LoginScreen(
          key: login_key,
          email: "emaeil@g.c",
          password: "11111111",
        )
        ));
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "emaeil@g.c");
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "11111111");
      await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage),findsOneWidget);
      

      });

  testWidgets(
      'Widget login autenticación no exitosa', (WidgetTester tester) async {
        final login_key = Key("LoginScreen");

        await tester.pumpWidget(GetMaterialApp(
          home:  LoginScreen(
          key: login_key,
          email: "",
          password: "",
        )
        ));
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "emaeil@g.c");
      await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "1111111");
      await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
      await tester.pumpAndSettle();
      expect(find.text("User or passwor nok"), findsOneWidget);
      

      });

  testWidgets(
      'Widget signUp validación @ email', (WidgetTester tester) async {
        final login_key = Key("SignupScreen");

        await tester.pumpWidget(const GetMaterialApp(
          home:  SignUpPage()
        ));
      await tester.enterText(find.byKey(const Key("TextFormFieldSignUpEmail")), "emaeilg.c");
      await tester.enterText(find.byKey(const Key("TextFormFieldSignUpPassword")), "1111111");
      await tester.tap(find.byKey(const Key("ButtonSignUpSubmit")));
      await tester.pumpAndSettle();
      expect(find.text("Enter valid email address"), findsOneWidget);
      

      });

  testWidgets('Widget signUp validación campo vacio email',
      (WidgetTester tester) async {
        final login_key = Key("SignupScreen");

        await tester.pumpWidget(const GetMaterialApp(
          home:  SignUpPage()
        ));
      await tester.enterText(find.byKey(const Key("TextFormFieldSignUpEmail")), "");
      await tester.enterText(find.byKey(const Key("TextFormFieldSignUpPassword")), "1111111");
      await tester.tap(find.byKey(const Key("ButtonSignUpSubmit")));
      await tester.pumpAndSettle();
      expect(find.text("Enter email"), findsOneWidget);
      

      });


  testWidgets('Widget signUp validación número de caracteres password',
      (WidgetTester tester) async {
        final login_key = Key("SignupScreen");

        await tester.pumpWidget(const GetMaterialApp(
          home:  SignUpPage()
        ));
      await tester.enterText(find.byKey(const Key("TextFormFieldSignUpEmail")), "emaeilg.c");
      await tester.enterText(find.byKey(const Key("TextFormFieldSignUpPassword")), "1111");
      await tester.tap(find.byKey(const Key("ButtonSignUpSubmit")));
      await tester.pumpAndSettle();
      expect(find.text("Password should have at least 6 characters"), findsOneWidget);
      

      });


  testWidgets('Widget signUp validación campo vacio password',
      (WidgetTester tester) async {
        final login_key = Key("SignupScreen");

        await tester.pumpWidget(const GetMaterialApp(
          home:  SignUpPage()
        ));
      await tester.enterText(find.byKey(const Key("TextFormFieldSignUpEmail")), "emaeilg.c");
      await tester.enterText(find.byKey(const Key("TextFormFieldSignUpPassword")), "");
      await tester.tap(find.byKey(const Key("ButtonSignUpSubmit")));
      await tester.pumpAndSettle();
      expect(find.text("Enter password"), findsOneWidget);
      

      });


  testWidgets(
      'Widget home visualización correo', (WidgetTester tester) async {
        final login_key = Key("HomeScreen");

        await tester.pumpWidget(const GetMaterialApp(
          home:  HomePage(loggedEmail: 'emaeilg.c', loggedPassword: '111111',)
        ));
    
      expect(find.text("Hello emaeilg.c"), findsOneWidget);
      

      });

  testWidgets('Widget home nevegación detalle', (WidgetTester tester) async {
        final login_key = Key("HomeScreen");

        await tester.pumpWidget(const GetMaterialApp(
          home:  HomePage(loggedEmail: 'emaeilg.c', loggedPassword: '111111',)
        ));
      await tester.tap(find.byKey(const Key("ButtonHomeDetail")));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("DetailPage")), findsOneWidget);
      

      });

  testWidgets('Widget home logout', (WidgetTester tester) async {
        final login_key = Key("HomeScreen");

        await tester.pumpWidget(const GetMaterialApp(
          home:  HomePage(loggedEmail: 'emaeilg.c', loggedPassword: '111111',)
        ));
      await tester.tap(find.byKey(const Key("ButtonHomeLogOff")));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("LoginScreen")), findsOneWidget);
      

      });
}
