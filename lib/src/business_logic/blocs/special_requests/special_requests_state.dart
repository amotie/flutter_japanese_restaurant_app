part of 'special_requests_bloc.dart';

@immutable
abstract class SpecialRequestsState {
  final String specialRequest;
  final bool spedialRequestValid;

  const SpecialRequestsState({
    required this.specialRequest,
    required this.spedialRequestValid,
  });
}

class SpecialRequestsInitial extends SpecialRequestsState {
  const SpecialRequestsInitial(
      {required String specialRequest, required bool spedialRequestValid})
      : super(
            specialRequest: specialRequest,
            spedialRequestValid: spedialRequestValid);
}

class SpecialRequestLodding extends SpecialRequestsState {
  const SpecialRequestLodding(
      {required String specialRequest, required bool spedialRequestValid})
      : super(
            specialRequest: specialRequest,
            spedialRequestValid: spedialRequestValid);
}

class SpecialRequestSuccess extends SpecialRequestsState {
  const SpecialRequestSuccess(
      {required String specialRequest, required bool spedialRequestValid})
      : super(
            specialRequest: specialRequest,
            spedialRequestValid: spedialRequestValid);
}

class SpecialRequestFailure extends SpecialRequestsState {
  const SpecialRequestFailure(
      {required String specialRequest, required bool spedialRequestValid})
      : super(
            specialRequest: specialRequest,
            spedialRequestValid: spedialRequestValid);
}
