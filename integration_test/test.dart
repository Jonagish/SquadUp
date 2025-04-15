import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:squad_up/flutter_flow/flutter_flow_drop_down.dart';
import 'package:squad_up/flutter_flow/flutter_flow_icon_button.dart';
import 'package:squad_up/flutter_flow/flutter_flow_widgets.dart';
import 'package:squad_up/flutter_flow/flutter_flow_theme.dart';
import 'package:squad_up/index.dart';
import 'package:squad_up/main.dart';
import 'package:squad_up/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:squad_up/backend/firebase/firebase_config.dart';
import 'package:squad_up/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('US1 : User Account Creation', () {
    testWidgets('Successful Account Creation ', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: SignUpPageWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(const ValueKey('email_field_rpdn')), 'test@example.com');
      await tester.enterText(
          find.byKey(const ValueKey('password_field_csu8')), 'Password');
      await tester.enterText(
          find.byKey(const ValueKey('Confirm_pass_field_80q8')), 'Password');
      await tester.tap(find.byKey(const ValueKey('SignUp_Button_ms4s')));
      expect(find.text('Finish Completing Your Profile'), findsWidgets);
    });

    testWidgets('Account already exists', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: SignUpPageWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(const ValueKey('email_field_rpdn')), 'test@example.com');
      await tester.enterText(
          find.byKey(const ValueKey('password_field_csu8')), 'Password');
      await tester.enterText(
          find.byKey(const ValueKey('Confirm_pass_field_80q8')), 'Password');
      await tester.tap(find.byKey(const ValueKey('SignUp_Button_ms4s')));
      expect(
          find.text(
              'An account with this email already exists. Please sign in or use a different email to create a new account.'),
          findsWidgets);
    });

    testWidgets('Invalid email', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: SignUpPageWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(const ValueKey('email_field_rpdn')), 'test@');
      await tester.enterText(
          find.byKey(const ValueKey('password_field_csu8')), 'Password');
      await tester.enterText(
          find.byKey(const ValueKey('Confirm_pass_field_80q8')), 'Password');
      await tester.tap(find.byKey(const ValueKey('SignUp_Button_ms4s')));
    });
  });

  testWidgets('Logout', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('logoutButton_f93s')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.text('Forgot_link'), findsWidgets);
  });

  testWidgets('US 2 - User Login', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('email_field_3oli')), 'test@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('pass_field_0nao')), 'testPassword');
    await tester.tap(find.byKey(const ValueKey('Login_Button_jznr')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.text('Check Golden Path'), findsWidgets);
  });

  testWidgets('US3 Backend Setup', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(find.byKey(const ValueKey('email_field_rpdn')),
        'backendtest1@squadup.app');
    await tester.enterText(
        find.byKey(const ValueKey('password_field_csu8')), 'Firebase123');
    await tester.enterText(
        find.byKey(const ValueKey('Confirm_pass_field_80q8')), 'Firebase123');
    await tester.tap(find.byKey(const ValueKey('SignUp_Button_ms4s')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
