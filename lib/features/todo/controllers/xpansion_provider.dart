import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'xpansion_provider.g.dart';

@riverpod
class XpansionState extends _$XpansionState {
  @override
  bool build() {
    return false;
  }

  void setStart(bool newState) {
    state = newState;
  }
}

@riverpod
class ExpansionState0 extends _$ExpansionState0 {
  @override
  bool build() {
    return false;
  }

  void setStart(bool newState) {
    state = newState;
  }
}
