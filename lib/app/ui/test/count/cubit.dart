import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xm_wanandroid_flutter/app/ui/test/count/event.dart';

class CountCubit extends Cubit<int>{
  CountCubit() : super(0);

  void increment(){
      emit(state + 1);
    }

    void decrement(){
      emit(state - 1);
    }

    @override
  void onChange(Change<int> change) {
      print('状态变更: ${change.currentState} → ${change.nextState}');
    super.onChange(change);

  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('计数器错误: $error');
    super.onError(error, stackTrace);
  }

}