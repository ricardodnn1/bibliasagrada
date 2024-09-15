import 'dart:developer';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';

Future<void> shareText({
  required String book,
  required String verse,
}) async {
  try {
    Share.text(book, verse, 'text/plain');
  } catch (e) {
    log('error: $e');
  }
}
