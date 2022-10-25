import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/blocs/special_requests/special_requests_bloc.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/widget/bottom_sheet_custom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialRequest extends StatelessWidget {
  const SpecialRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _specialRequestBloc = SpecialRequestsBloc();
    return BottomSheetCustom(
      child: BlocProvider(
        create: (context) => _specialRequestBloc,
        child: BlocBuilder<SpecialRequestsBloc, SpecialRequestsState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Special Request',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Special Request',
                      labelText: 'Special Request',
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      errorText: state.spedialRequestValid
                          ? null
                          : 'Special Request is required',
                      errorStyle: TextStyle(
                        color: Colors.red[300],
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red[300]!,
                        ),
                      ),
                    ),
                    maxLines: 10,
                    onChanged: (value) {
                      context.read<SpecialRequestsBloc>().add(
                            GetSpecialRequests(value),
                          );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SpecialRequestsBloc>().add(
                            SubmitSpecialRequests(state.specialRequest),
                          );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      // fixedSize: MaterialStateProperty.all(const Size(400, 80)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
