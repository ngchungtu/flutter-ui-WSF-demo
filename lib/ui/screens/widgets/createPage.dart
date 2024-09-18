import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const createPage({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(
              image,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: title == "Thegioididong"
                  ? Constants.tgddColor
                  : title == "CellphoneS"
                      ? Constants.cpsColor
                      : title == "FPT"
                          ? Constants.fptColor
                          : Constants.primaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
