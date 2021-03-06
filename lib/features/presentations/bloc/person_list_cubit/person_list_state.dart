import 'package:equatable/equatable.dart';
import 'package:flutter_food/features/domain/entities/person_entity.dart';

abstract class PersonState extends Equatable {
  PersonState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PersonEmpty extends PersonState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PersonLoading extends PersonState {
  final List<PersonEntity> oldPersonsList;
  final bool isFirstFetch;

  PersonLoading(this.oldPersonsList, {this.isFirstFetch = false});

  @override
  // TODO: implement props
  List<Object?> get props => [oldPersonsList];
}

class PersonLoaded extends PersonState {
  final List<PersonEntity> personList;

  PersonLoaded(this.personList);

  @override
  // TODO: implement props
  List<Object?> get props => [personList];
}

class PersonError extends PersonState {
  final String message;

  PersonError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
