import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food/core/error/failure.dart';
import 'package:flutter_food/features/domain/usecases/search_person.dart';
import 'package:flutter_food/features/presentations/bloc/search_event.dart';
import 'package:flutter_food/features/presentations/bloc/search_state.dart';
import 'package:meta/meta.dart';

const SERVER_FAILURE_MESSAGE = 'Server failure';
const CACHED_FAILURE_MESSAGE = 'cached failure';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({required this.searchPerson}) : super(PersonSearchEmpty());

  @override
  Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
    if (event is PersonSearch) {
      yield* _mapFetchPersonsToState(event.personQuery);
    }
  }

  Stream<PersonSearchState> _mapFetchPersonsToState(String personQuery) async* {
    yield PersonSearchLoading();

    final failureOrPerson =
        await searchPerson(SearchPersonParams(query: personQuery));

    yield failureOrPerson.fold(
        (failure) => PersonSearchError(
              message: _mapFailureToMessage(failure),
            ),
        (person) => PersonSearchLoaded(person));
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHED_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
