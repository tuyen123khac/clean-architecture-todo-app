import 'dart:async';

abstract class UseCase<Data, Params> {
  const UseCase();

  Future<Data> call(Params params);
}

abstract class StreamUseCase<Data, Params> {
  const StreamUseCase();

  Stream<Data> call(Params params);
}

class NoParams {}
