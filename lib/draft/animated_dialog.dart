import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<Object?> showAnimatedDialog(
  BuildContext context,
  Widget child, {
  Duration? duration,
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, _, __) => child,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black,
    transitionDuration: duration ?? const Duration(milliseconds: 300),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCubicEmphasized,
        ),
        child: FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubicEmphasized,
          ),
          child: child,
        ),
      );
    },
  );
}

Future saveAssetVideoToFile() async {
  var content = await rootBundle.load("assets/videos/4k_video.mp4");
  final directory = await getApplicationDocumentsDirectory();
  var file = File("${directory.path}/4k_video.mp4");
  file.writeAsBytesSync(content.buffer.asUint8List());
}
