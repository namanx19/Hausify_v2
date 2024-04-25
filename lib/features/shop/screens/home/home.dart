import 'package:flutter/material.dart';
import 'package:hausify_v2/features/shop/screens/home/widgets/home_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return const  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Header
            HPrimaryHeaderContainer(
              child: Column(
                children: [
                  HHomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
