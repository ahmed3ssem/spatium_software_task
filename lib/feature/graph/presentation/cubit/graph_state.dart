part of 'graph_cubit.dart';

abstract class GraphState extends Equatable {
  const GraphState();

  @override
  List<Object> get props => [];
}

class GraphInitial extends GraphState {}

class GraphLoading extends GraphState{}

class GraphLoaded extends GraphState{

  final Map<String, int> monthFrequency;

  const GraphLoaded({required this.monthFrequency});

  @override
  List<Object> get props =>[monthFrequency];
}

class GraphError extends GraphState{
  final String msg;
  const GraphError({required this.msg});

  @override
  List<Object> get props =>[msg];
}
