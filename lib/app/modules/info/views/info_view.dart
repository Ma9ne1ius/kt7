import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../data/models/car/car.dart';

import '../../home/views/home_view.dart';
import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String strResult = controller.car.availability ? 'In Stock' : 'Not In Stock';
    Color? carColor = Parser().toParse(controller.car.color);
    const String FFName = 'Zeroes 3';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Info'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              controller.car.brand.toString(),
              style: TextStyle(fontFamily: FFName),
            ),
            Text(
              controller.car.model.toString(),
              style: TextStyle(fontFamily: FFName),
            ),
            Text(
              controller.car.color.toString(),
              style: TextStyle(fontFamily: FFName),
            ),
            Text(
              controller.car.price.toString(),
              style: TextStyle(fontFamily: FFName),
            ),
            Icon(Icons.star, size: 26, color: carColor),
            Text(
              strResult,
              style: TextStyle(fontFamily: FFName),
            ),
          ],
        ),
      ),
    );
  }
}
