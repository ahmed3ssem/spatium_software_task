import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:spatium_software_task/core/error/failures.dart';
import 'package:spatium_software_task/core/usecase/use_case.dart';
import 'package:spatium_software_task/core/utils/app_strings.dart';
import 'package:spatium_software_task/feature/graph/domain/usecases/graph_usecase.dart';

part 'graph_state.dart';

class GraphCubit extends Cubit<GraphState> {

  GraphUseCase graphUseCase;
  GraphCubit({required this.graphUseCase}) : super(GraphInitial());

  Future<void> getData() async{
    emit(GraphLoading());
    Either<Failures , Map<String, int>> response = await graphUseCase(NoParams());
    emit(response.fold((failures) => GraphError(msg: mapFailureToMsg(failures)), (monthFrequency) => GraphLoaded(monthFrequency: monthFrequency)));
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

