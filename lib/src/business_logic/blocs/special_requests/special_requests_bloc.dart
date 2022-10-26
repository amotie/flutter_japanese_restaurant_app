import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'special_requests_event.dart';
part 'special_requests_state.dart';

class SpecialRequestsBloc
    extends Bloc<SpecialRequestsEvent, SpecialRequestsState> {
  SpecialRequestsBloc()
      : super(const SpecialRequestsInitial(
          specialRequest: '',
          spedialRequestValid: true,
        )) {
    on<SpecialRequestsEvent>((event, emit) async {
      if (event is GetSpecialRequests) {
        emit(SpecialRequestsInitial(
          specialRequest: event.specialRequest,
          spedialRequestValid: event.specialRequest != '' ? true : false,
        ));
      }
      if (event is SubmitSpecialRequests) {
        if (event.specialRequest != '' ? true : false) {
          emit(SpecialRequestLodding(
            specialRequest: event.specialRequest,
            spedialRequestValid: event.specialRequest != '' ? true : false,
          ));
          await Future.delayed(const Duration(seconds: 2));
          emit(SpecialRequestSuccess(
            specialRequest: event.specialRequest,
            spedialRequestValid: event.specialRequest != '' ? true : false,
          ));
        }
      }
    });
  }
}
