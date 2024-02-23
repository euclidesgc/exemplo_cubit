import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_listenner_state.dart';

class MyListennerCubit extends Cubit<MyListennerState> {
  MyListennerCubit() : super(MyListennerInitial());

  Future<void> submitForm() async {
    try {
      emit(MyListennerLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(MyListennerSuccess());
    } catch (e) {
      emit(MyListennerError('Erro ao realizar login!'));
    }
  }
}
