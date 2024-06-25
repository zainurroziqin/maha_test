

import 'package:maha_test/domain/failures/failures.dart';

const serverFailureMessage = "Oops, API Error. Please try again!";
const cacheFailureMessage = "Oops, cache failed. Please try again";
const defaultFailureMessage = 'Oops, something gone wrong. Please try again';

class FailureMessage{
  static String mapFailureToMessage(Failures failures) {
    switch (failures.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return defaultFailureMessage;
    }
  }
}