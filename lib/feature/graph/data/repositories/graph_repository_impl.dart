import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:spatium_software_task/core/error/exceptions.dart';
import 'package:spatium_software_task/core/error/failures.dart';
import 'package:spatium_software_task/feature/graph/data/datasources/graph_remote_data_source.dart';
import 'package:spatium_software_task/feature/graph/domain/repositories/graph_repository.dart';

class GraphRepositoryImpl extends GraphRepository {

	GraphRemoteDataSource graphRemoteDataSource;
	GraphRepositoryImpl({required this.graphRemoteDataSource});

  @override
  Future<Either<Failures, Map<String, int>>> getGraphData() async{
		try{
			final response = await graphRemoteDataSource.getGraphData();
			return Right(response);
		} on ServerException{
			return Left(ServerFailure(msg: 'error'.tr));
		}
  }

}
