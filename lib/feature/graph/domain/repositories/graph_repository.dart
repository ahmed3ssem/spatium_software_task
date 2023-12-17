import 'package:dartz/dartz.dart';
import 'package:spatium_software_task/core/error/failures.dart';

abstract class GraphRepository {

  Future<Either<Failures , Map<String, int>>> getGraphData();
}
