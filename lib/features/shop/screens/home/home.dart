
import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

import 'package:hausify_v2/utils/constants/colors.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
                clipper: HCustomCurvedEdges(),
                child: Container(
                color: HColors.primaryColor,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(top: -150, right: -250,child: HCircularContainer(backgroundColor: HColors.textWhite.withOpacity(0.1))),
                      Positioned(top: 100, right: -300,child: HCircularContainer(backgroundColor: HColors.textWhite.withOpacity(0.1))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
