import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc2021/features/exchange/bloc/exchange_bloc.dart';
import 'package:flutterbloc2021/features/exchange/bloc/exchange_event.dart';
import 'package:flutterbloc2021/features/exchange/bloc/exchange_state.dart';

class Exchange extends StatefulWidget {
  const Exchange({Key? key}) : super(key: key);

  @override
  _ExchangeState createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExchangeBloc, ExchangeState>(builder: (context, state) {
        if (state is AwalMula) {
          return Text(state.value.toString());
        }
        return const SizedBox();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ExchangeBloc>(context).add(GetNama(nama: 'saddam'));
        },
      ),
    );
  }
}
