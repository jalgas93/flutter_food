import 'package:equatable/equatable.dart';

abstract class PersonSearchEvent extends Equatable {
  const PersonSearchEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PersonSearch extends PersonSearchEvent {
  final String personQuery;

  PersonSearch(this.personQuery);
}