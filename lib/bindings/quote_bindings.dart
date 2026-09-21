import 'package:get/instance_manager.dart';
import 'package:words_wisely/controllers/api_controller.dart';
import 'package:words_wisely/services/api_service.dart';

class QuoteBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(ApiController());
  }
}
