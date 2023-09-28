import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChosenCategoryNotifier extends StateNotifier<String> {
  ChosenCategoryNotifier(super.state);

  void changeState(String value) {
    state = value;
  }
}

final chosenCategoryProvider =
    StateNotifierProvider<ChosenCategoryNotifier, String>((ref) {
  return ChosenCategoryNotifier("health");
});
