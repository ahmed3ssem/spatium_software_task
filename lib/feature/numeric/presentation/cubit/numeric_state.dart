part of 'numeric_cubit.dart';

abstract class NumericState extends Equatable {
  const NumericState();

  @override
  List<Object> get props => [];
}

class NumericInitial extends NumericState {}

class NumericIsLoading extends NumericState{}

class NumericLoaded extends NumericState{

  final NumericModel numericModel;

  const NumericLoaded({required this.numericModel});

  @override
  List<Object> get props =>[numericModel];
}

class NumericError extends NumericState{
  final String msg;
  const NumericError({required this.msg});

  @override
  List<Object> get props =>[msg];
}
