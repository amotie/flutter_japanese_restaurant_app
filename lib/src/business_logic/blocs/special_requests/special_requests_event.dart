part of 'special_requests_bloc.dart';

@immutable
abstract class SpecialRequestsEvent {}

class GetSpecialRequests extends SpecialRequestsEvent {
  final String specialRequest;

  GetSpecialRequests(this.specialRequest);
}

class SubmitSpecialRequests extends SpecialRequestsEvent {
  final String specialRequest;

  SubmitSpecialRequests(this.specialRequest);
}
