import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sorting_visualizer/sort_cubit.dart';
import 'package:universal_html/html.dart' hide Text;

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SortCubit>(
      create: (context) => SortCubit(),
      child: GetMaterialApp(
        enableLog: false,
        debugShowCheckedModeBanner: false,
        title: 'SV',
        initialRoute: '/',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        getPages: [
          GetPage(
            name: '/',
            page: () {
              document.title = 'Home';
              return const HomePage();
            },
          ),
        ],
      ),
    );
  }
}

typedef ListToSort = List<int> Function([int count]);

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  BlocBuilder<SortCubit, SortState>(
                    buildWhen: (previous, current) =>
                        previous.list != current.list,
                    builder: (context, state) {
                      return ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 1000,
                        ),
                        child: Bars(bars: state.list),
                      );
                    },
                  ),
                  BlocBuilder<SortCubit, SortState>(builder: (context, state) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 800,
                          ),
                          child: TextFormField(
                            initialValue: state.count.toString(),
                            decoration: const InputDecoration(
                              labelText: 'Number of items to sort',
                            ),
                            enabled: !state.running,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            onChanged: (value) {
                              final count = int.tryParse(value);
                              if (count == null) return;
                              if (count > 2000) {
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Cannot be greater than 2000'),
                                    ),
                                  );
                                return;
                              }
                              context.read<SortCubit>().setCount(count);
                              context.read<SortCubit>().regenerate();
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: state.running
                              ? context.watch<SortCubit>().stop
                              : null,
                          child: const Text('Stop'),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: state.running
                              ? null
                              : context.watch<SortCubit>().regenerate,
                          child: const Text('Shuffle'),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: state.running
                              ? null
                              : context.watch<SortCubit>().runBubbleSort,
                          child: const Text('Bubble Sort'),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: state.running
                              ? null
                              : context.watch<SortCubit>().runInsertionSort,
                          child: const Text('Insertion Sort'),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: state.running
                              ? null
                              : context.watch<SortCubit>().runSelectionSort,
                          child: const Text('Selection Sort'),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: state.running
                              ? null
                              : context.watch<SortCubit>().runMergeSort,
                          child: const Text('Merge Sort'),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: state.running
                              ? null
                              : context.watch<SortCubit>().runQuickSort,
                          child: const Text('Quick Sort'),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: state.running
                              ? null
                              : context.watch<SortCubit>().runRadixSort,
                          child: const Text('Radix Sort'),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Bars extends StatelessWidget {
  const Bars({
    Key? key,
    required this.bars,
  }) : super(key: key);

  final List<int> bars;

  @override
  Widget build(BuildContext context) {
    final height = max(MediaQuery.of(context).size.height ~/ 3, 300);
    final maxBar = bars.fold<int>(
      bars.first,
      (previousValue, element) => max(previousValue, element),
    );

    return SizedBox(
      height: height.toDouble() + 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (final bar in bars)
            Expanded(
              child: Container(
                height: (bar / maxBar) * height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
