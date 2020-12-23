
import 'dart:async';

import 'package:demo_logging/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future throwDartException() async {
  try{
    throw new StateError('Dart Exception');
  }catch(e){
    debugPrint('error ${e.toString()}');
    errorReport(e.toString(), null);
  }
}

Future throwPluginException() async {
  try{
    throw new MissingPluginException('Plugin Exception');
  }catch(e){
    debugPrint('error ${e.toString()}');
    errorReport(e.toString(), null);
  }
}

void errorReport(String msg, StackTrace stackTrace) async {
  bugsnagNotifier.notify(msg, stackTrace);
  await Sentry.captureException(msg, stackTrace: stackTrace);
}