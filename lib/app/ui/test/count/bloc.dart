import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';



class CountBloc extends Bloc<CountEvent, int> {
  CountBloc() : super(0){
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));

    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }


  //
  // @override
  // Stream<int> mapEventToState(CountEvent event) async* {
  //   switch(event){
  //     case CountEvent.increment:
  //       yield state + 1;
  //       break;
  //     case CountEvent.decrement:
  //       yield state - 1;
  //       break;
  //   }
  //   // if (event is InitEvent) {
  //   //   yield await init();
  //   // }
  // }

  // Future<CountState> init() async {
  //   return state.clone();
  // }
}
