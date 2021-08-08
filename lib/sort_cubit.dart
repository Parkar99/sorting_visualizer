import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' hide mergeSort;
import 'package:freezed_annotation/freezed_annotation.dart'
    hide insertionSort, mergeSort;
import 'package:sorting_visualizer/sorting_algos.dart';

part 'sort_cubit.freezed.dart';

class SortCubit extends Cubit<SortState> {
  SortCubit() : super(SortState(list: generateList(SortState.defaultCount)));

  static List<int> generateList(int count) {
    return List.generate(count, (index) => index + 1)..shuffle();
  }

  void setCount(int count) {
    if (count <= 0) return;
    emit(state.copyWith.call(count: count));
  }

  void regenerate() {
    emit(state.copyWith.call(
      list: generateList(state.count),
    ));
  }

  void stop() => emit(state.copyWith.call(
        list: generateList(state.count),
        running: false,
      ));

  Future<void> runBubbleSort() async {
    await _runAlgo(bubbleSort);
  }

  Future<void> runInsertionSort() async => _runAlgo(insertionSort);

  Future<void> runSelectionSort() async => _runAlgo(selectionSort);

  Future<void> runMergeSort() async => _runAlgo(mergeSort);

  Future<void> runQuickSort() async => _runAlgo(quickSort);

  Future<void> runRadixSort() async => _runAlgo(radixSort);

  Future<void> _runAlgo(
    Stream<List<int>> Function(List<int>) algorithm,
  ) async {
    emit(state.copyWith.call(
      running: true,
    ));
    await for (final newList in algorithm(state.list)) {
      if (!state.running) break;
      emit(state.copyWith.call(list: [...newList]));
      await Future.delayed(const Duration(milliseconds: 5));
    }
    emit(state.copyWith.call(
      running: false,
    ));
  }
}

@freezed
class SortState with _$SortState {
  static const defaultCount = 100;

  const factory SortState({
    required List<int> list,
    @Default(false) bool running,
    @Default(SortState.defaultCount) int count,
  }) = _SortState;
}
