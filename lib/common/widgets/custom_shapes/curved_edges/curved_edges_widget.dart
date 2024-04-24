import 'package:flutter/material.dart';

import 'curved_edges.dart';

class HCurvedEdgesWidget extends StatelessWidget {
  const HCurvedEdgesWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HCustomCurvedEdges(),
      child: child,
    );
  }
}