import 'package:flutter_bloc/flutter_bloc.dart';

import 'exchange_event.dart';
import 'exchange_state.dart';

class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  ExchangeBloc() : super(UnInitialize()) {
    on<GetNama>(_namaku);
  }

  _namaku(GetNama event, Emitter<ExchangeState> emit) =>
      emit(AwalMula(value: event.nama));
}
