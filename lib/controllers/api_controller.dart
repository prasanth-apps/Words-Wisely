import 'package:get/state_manager.dart';
import 'package:words_wisely/models/quote_model.dart';
import 'package:words_wisely/services/api_service.dart';

class ApiController extends GetxController {
  final quote = Rxn<QuoteModel>();
  Future<void> fetchQuote() async {
    final result = await ApiService().fetchRandom();
    quote.value = result;
  }

  @override
  void onInit() {
    fetchQuote();
    super.onInit();
  }
}
