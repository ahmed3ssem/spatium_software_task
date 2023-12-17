import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:spatium_software_task/core/error/failures.dart';
import 'package:spatium_software_task/core/usecase/use_case.dart';
import 'package:spatium_software_task/core/utils/app_strings.dart';
import 'package:spatium_software_task/feature/numeric/data/models/numeric_model.dart';
import 'package:spatium_software_task/feature/numeric/domain/usecases/numeric_usecase.dart';

part 'numeric_state.dart';

class NumericCubit extends Cubit<NumericState> {

  NumericUseCase numericUseCase;
  NumericCubit({required this.numericUseCase}) : super(NumericInitial());

  Future<void> getData() async{
    emit(NumericIsLoading());
    Either<Failures , NumericModel> response = await numericUseCase(NoParams());
    emit(response.fold((failures) => NumericError(msg: mapFailureToMsg(failures)), (numeric) => NumericLoaded(numericModel: numeric)));
  }

  String mapFailureToMsg(Failures failures){
    switch (failures.runtimeType){
      case const (ServerFailure):
        return AppStrings.serverError;
      case const (CashFailure):
        return AppStrings.cacheError;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
