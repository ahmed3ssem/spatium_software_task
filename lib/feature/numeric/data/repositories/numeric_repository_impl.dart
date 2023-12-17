import 'package:dartz/dartz.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:spatium_software_task/core/error/exceptions.dart';
import 'package:spatium_software_task/core/error/failures.dart';
import 'package:spatium_software_task/feature/numeric/data/datasources/numeric_remote_data_source.dart';
import 'package:spatium_software_task/feature/numeric/data/models/numeric_model.dart';
import 'package:spatium_software_task/feature/numeric/domain/repositories/numeric_repository.dart';

class NumericRepositoryImpl extends NumericRepository {

	NumericRemoteDataSource numericRemoteDataSource;
	NumericRepositoryImpl({required this.numericRemoteDataSource});

  @override
  Future<Either<Failures, NumericModel>> calculateNumerics() async{
		try{
			final response = await numericRemoteDataSource.calculateNumerics();
			return Right(response);
		} on ServerException{
			return Left(ServerFailure(msg: 'error'.tr));
		}
	}

}
