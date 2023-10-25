import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kt7/app/data/models/cardata/carsdata.dart';

import '../../../data/models/car/car.dart';

enum NetworkDataStatus {
  init,
  loading,
  success,
  error,
}
class HomeController extends GetxController {

  var path = 'https://myfakeapi.com/api/cars';
  var client = Dio();
  // var networkStatus = NetworkDataStatus.values[0];
  var cars = <Car>[].obs;
  var status = NetworkDataStatus.init.obs;

  
  void getData() async{
    status.value = NetworkDataStatus.loading;
    var response = await client.get(path);
    if(response.statusCode != 200){
      status.value = NetworkDataStatus.error;
      return;
    }
    status.value =NetworkDataStatus.success;
    cars.value = CarsData.fromJson(response.data).cars;
  }
  


  @override
  void onInit() {
    getData();
    super.onInit();
  }

}
