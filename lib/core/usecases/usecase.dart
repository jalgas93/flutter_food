import 'package:dartz/dartz.dart';
import 'package:flutter_food/core/error/failure.dart';
import 'package:flutter_food/features/domain/entities/person_entity.dart';

abstract class UseCase<Type,Params>{
Future<Either<Failure,Type>> call(Params params);
}