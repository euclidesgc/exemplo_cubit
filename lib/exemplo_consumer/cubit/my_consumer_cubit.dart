import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_consumer_state.dart';

class MyConsumerCubit extends Cubit<MyConsumerState> {
  MyConsumerCubit() : super(MyConsumerInitial());

  Future<void> submitForm() async {
    try {
      emit(MyConsumerLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(MyConsumerSuccess());
    } catch (e) {
      emit(MyConsumerError('Erro ao realizar login!'));
    }
  }
}
