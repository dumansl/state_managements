import 'package:flutter/material.dart';
import 'package:state_managements/feature/onboard/onboard_model.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({super.key, required this.model});
  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(model.description),
        Image.asset(model.imageWithPath),
      ],
    );
  }
}
