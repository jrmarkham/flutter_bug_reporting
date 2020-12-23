import 'package:demo_logging/src/pages/page_five.dart';
import 'package:demo_logging/src/pages/page_four.dart';
import 'package:demo_logging/src/pages/page_one.dart';
import 'package:demo_logging/src/pages/page_six.dart';
import 'package:demo_logging/src/pages/page_three.dart';
import 'package:demo_logging/src/pages/page_two.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sentry/sentry.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_bugsnag/flutter_bugsnag.dart';
import 'package:shake_flutter/shake_flutter.dart';

final BugsnagNotifier bugsnagNotifier =
    BugsnagNotifier("155a09cecc276a1b062f786f78f98e64");

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();



  if (kIsWeb) {

    debugPrint('is web');

    // running on the web!
    // for web
    await Sentry.init((options) {
      options.dsn =
          'https://84e11b84dbbd4dc387b8c30c1dde9baa@o489258.ingest.sentry.io/5551144';
    }// Init your App.
        );
  } else {
    // NOT running on the web! You can check for additional platforms here.
    await SentryFlutter.init((options) {
      options.dsn =
      'https://84e11b84dbbd4dc387b8c30c1dde9baa@o489258.ingest.sentry.io/5551144';

      options.useNativeBreadcrumbTracking();
    });


    debugPrint('not web');

    Shake.setInvokeShakeOnShakeDeviceEvent(true);
    Shake.setShowFloatingReportButton(true);
    Shake.setInvokeShakeOnScreenshot(true);

    Shake.start();



  }
  FlutterError.onError = (FlutterErrorDetails details) async {
    bugsnagNotifier.notify(details.exception, details.stack);
    await Sentry.captureException(details.exception, stackTrace: details.stack);
  };

  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => PageOne(),
        '/two': (context) => PageTwo(),
        '/three': (context) => PageThree(),
        '/four': (context) => PageFour(),
        '/five': (context) => PageFive(),
        '/six': (context) => PageSix()
      },
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
      title: 'Bug Snag vs Sentry',
      theme: ThemeData(
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      )));
}