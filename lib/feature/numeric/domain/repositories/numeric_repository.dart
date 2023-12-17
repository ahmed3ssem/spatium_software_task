import 'package:dartz/dartz.dart';
import 'package:spatium_software_task/core/error/failures.dart';
import 'package:spatium_software_task/feature/numeric/data/models/numeric_model.dart';

abstract class NumericRepository {

  Future<Either<Failures , NumericModel>> calculateNumerics();
}
