import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cunter/cubit/counter_cubit.dart';
import 'package:flutter_bloc_cunter/cubit/counter_cubit_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Cubit Counter App  Home"),
        ),
        body: BlocBuilder<CounterCubit, CounterCubitState>(
            builder: (contxt, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (state is CounterValueUpdated)
                    ? Text(state.counter.toString())
                    : Text("0"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        contxt.read<CounterCubit>().counterIncrease();
                      },
                      child: Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        contxt.read<CounterCubit>().counterDecrease();
                      },
                      child: Icon(Icons.remove),
                    )
                  ],
                )
              ],
            ),
          );
        }));
  }
}
