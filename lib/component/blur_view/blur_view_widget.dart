import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blur_view_model.dart';
export 'blur_view_model.dart';

import 'dart:ui';

class BlurViewWidget extends StatefulWidget {
  const BlurViewWidget({super.key});

  @override
  State<BlurViewWidget> createState() => _BlurViewWidgetState();
}

class _BlurViewWidgetState extends State<BlurViewWidget> {
  late BlurViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlurViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0, // Horizontal blur radius
          sigmaY: 5.0, // Vertical blur radius
        ),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
