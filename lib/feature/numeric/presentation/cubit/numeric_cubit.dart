import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'numeric_state.dart';

class NumericCubit extends Cubit<NumericState> {
  NumericCubit() : super(NumericInitial());
}
