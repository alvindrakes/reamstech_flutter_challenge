import 'package:get/get.dart';
import 'package:reamstech_challenge/data/abilities-list.dart';
import 'package:reamstech_challenge/model/itemcard_model.dart';

class HomeCtrl extends GetxController {
  bool isLoading = true;
  final List<ItemCardModel> itemCards = [];

  onInit() {
    _simulateLoading();
    _getData();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    update();
  }

  List<ItemCardModel> _getData() {
    for (var i = 0; i < SimulatedData.abilities.length; i++) {
      itemCards.add(ItemCardModel.fromMap(SimulatedData.abilities[i]));
    }

    return itemCards;
  }
}
