import 'package:flutter/material.dart';
import 'package:hausify_v2/common/widgets/appbar/appbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(title: Text('Search Products'), showBackArrow: true,),
    );
  }
}
