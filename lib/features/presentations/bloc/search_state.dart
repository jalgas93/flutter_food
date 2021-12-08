import 'package:equatable/equatable.dart';
import 'package:flutter_food/features/domain/entities/person_entity.dart';

abstract class PersonSearchState extends Equatable {
  PersonSearchState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PersonSearchEmpty extends PersonSearchState {}

class PersonSearchLoading extends PersonSearchState {}

class PersonSearchLoaded extends PersonSearchState {
  final List<PersonEntity> persons;

  PersonSearchLoaded(this.persons);

  @override
  // TODO: implement props
  List<Object?> get props => [persons];
}

class PersonSearchError extends PersonSearchState {
  final String message;

  PersonSearchError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
