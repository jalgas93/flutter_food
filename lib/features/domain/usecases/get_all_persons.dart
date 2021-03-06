import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food/core/error/failure.dart';
import 'package:flutter_food/core/usecases/usecase.dart';
import 'package:flutter_food/features/domain/entities/person_entity.dart';
import 'package:flutter_food/features/domain/repositories/person_repository.dart';
import 'package:meta/meta.dart';

class GetAllPersons extends UseCase<List<PersonEntity>,PagePersonParams> {
  final PersonRepository personRepository;

  GetAllPersons(this.personRepository);

  Future<Either<Failure, List<PersonEntity>>> call(PagePersonParams params) async {
    return await personRepository.getAllPersons(params.page);
  }
}

class PagePersonParams extends Equatable{
  final int page;

  PagePersonParams( {required this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [page];

}
