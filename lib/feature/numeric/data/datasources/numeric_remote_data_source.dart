import 'package:spatium_software_task/feature/numeric/data/models/numeric_model.dart';

abstract class NumericRemoteDataSource {

  Future<NumericModel> calculateNumerics();
}
