import 'package:either_dart/either.dart';
import 'package:flutter_bloc_clean_arch/core/error/failure.dart';

abstract class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
