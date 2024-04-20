import 'package:flutter/material.dart';

import '../widgets/custom_shapes/widget_curved_edges.dart';

class SPrimaryHeaderContainer extends StatelessWidget {
  const SPrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.bgcolor,
  });

  final Widget child;
  final Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return SCurvedEdgeWidget(
      child: Container(
        color: bgcolor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          //   stack

          children: [
            child,
          ],
        ),
      ),
    );
  }
}
