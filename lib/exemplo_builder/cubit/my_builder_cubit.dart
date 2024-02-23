import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_builder_state.dart';

class MyBuilderCubit extends Cubit<MyBuilderState> {
  MyBuilderCubit() : super(MyBuilderInitial());

  Future<void> submitForm() async {
    try {
      emit(MyBuilderLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(MyBuilderSuccess());
    } catch (e) {
      emit(MyBuilderError('Erro ao realizar login!'));
    }
  }
}
