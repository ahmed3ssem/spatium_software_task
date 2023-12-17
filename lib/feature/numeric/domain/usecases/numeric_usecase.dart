import 'package:dartz/dartz.dart';
import 'package:spatium_software_task/core/error/failures.dart';
import 'package:spatium_software_task/core/usecase/use_case.dart';
import 'package:spatium_software_task/feature/numeric/data/models/numeric_model.dart';
import 'package:spatium_software_task/feature/numeric/domain/repositories/numeric_repository.dart';

class NumericUseCase implements UseCase<NumericModel , NoParams>{

  final NumericRepository numericRepository;

  NumericUseCase({required this.numericRepository});

  @override
  Future<Either<Failures, NumericModel>> call(NoParams params)=> numericRepository.calculateNumerics();

}