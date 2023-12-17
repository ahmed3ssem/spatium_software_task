import 'package:dartz/dartz.dart';
import 'package:spatium_software_task/core/error/failures.dart';
import 'package:spatium_software_task/core/usecase/use_case.dart';
import 'package:spatium_software_task/feature/graph/domain/repositories/graph_repository.dart';


class GraphUseCase implements UseCase<Map<String, int> , NoParams>{

  final GraphRepository graphRepository;

  GraphUseCase({required this.graphRepository});

  @override
  Future<Either<Failures, Map<String, int>>> call(NoParams params)=> graphRepository.getGraphData();

}