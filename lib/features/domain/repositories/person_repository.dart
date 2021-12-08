import 'package:flutter_food/core/error/failure.dart';
import 'package:flutter_food/features/domain/entities/person_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);

  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
}
