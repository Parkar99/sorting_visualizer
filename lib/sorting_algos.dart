import 'dart:math';

void swap(List<int> arr, int i, int j) {
  final tmp = arr[i];
  arr[i] = arr[j];
  arr[j] = tmp;
}

Stream<List<int>> bubbleSort(List<int> items) async* {
  final c = [...items];

  for (int i = 0; i < c.length; i++) {
    for (int j = i + 1; j < c.length; j++) {
      final iItem = c[i];
      final jItem = c[j];
      if (iItem > jItem) {
        swap(c, i, j);
        yield c;
      }
    }
  }
}

Stream<List<int>> insertionSort(List<int> items) async* {
  final c = [...items];

  for (int i = 1; i < c.length; i++) {
    final key = c[i];
    int j = i - 1;

    while (j >= 0 && c[j] > key) {
      c[j + 1] = c[j--];
      yield c;
    }

    c[j + 1] = key;
    yield c;
  }
}

Stream<List<int>> selectionSort(List<int> items) async* {
  final c = [...items];
  int i, j, minIdx;

  for (i = 0; i < c.length - 1; i++) {
    minIdx = i;

    for (j = i + 1; j < c.length; j++) {
      if (c[j] < c[minIdx]) {
        minIdx = j;
      }
    }

    swap(c, minIdx, i);
    yield c;
  }
}

Stream<List<int>> merge(List<int> arr, int l, int m, int r) async* {
  final n1 = m - l + 1;
  final n2 = r - m;

  final L = <int>[];
  final R = <int>[];

  for (var i = 0; i < n1; i++) {
    L.add(arr[l + i]);
  }

  for (var j = 0; j < n2; j++) {
    R.add(arr[m + 1 + j]);
  }

  var i = 0;
  var j = 0;
  var k = l;

  while (i < n1 && j < n2) {
    if (L[i] <= R[j]) {
      arr[k] = L[i];
      i++;
      yield arr;
    } else {
      arr[k] = R[j];
      j++;
      yield arr;
    }
    k++;
  }

  while (i < n1) {
    arr[k] = L[i];
    i++;
    k++;
    yield arr;
  }

  while (j < n2) {
    arr[k] = R[j];
    j++;
    k++;
    yield arr;
  }
}

Stream<List<int>> _mergeSort(List<int> arr, int l, int r) async* {
  if (l >= r) {
    yield arr;
    return;
  }

  final m = l + ((r - l) ~/ 2);
  yield* _mergeSort(arr, l, m);
  yield* _mergeSort(arr, m + 1, r);
  yield* merge(arr, l, m, r);
}

Stream<List<int>> mergeSort(List<int> items) async* {
  final c = [...items];

  yield* _mergeSort(c, 0, c.length - 1);
}

Stream<List<int>> partition(List<int> arr, int low, int high) async* {
  final pivot = arr[high];
  int i = low - 1;

  for (int j = low; j <= high - 1; j++) {
    if (arr[j] < pivot) {
      i++;
      swap(arr, i, j);
      yield [...arr];
    }
  }
  swap(arr, i + 1, high);
  yield [...arr];
  yield [-1, i + 1];
}

Stream<List<int>> _quickSort(List<int> arr, int low, int high) async* {
  if (low < high) {
    late final int pi;
    await for (final p in partition(arr, low, high)) {
      if (p.first == -1) {
        pi = p[1];
      } else {
        yield p;
      }
    }

    yield* _quickSort(arr, low, pi - 1);
    yield [...arr];
    yield* _quickSort(arr, pi + 1, high);
    yield [...arr];
  } else {
    yield [...arr];
  }
}

Stream<List<int>> quickSort(List<int> items) async* {
  final c = [...items];
  yield* _quickSort(items, 0, c.length - 1);
}

Stream<List<int>> countSort(List<int> arr, int n, int exp) async* {
  final List<int> output = List.filled(n, 0), count = List.filled(10, 0);
  int i = 0;

  for (i = 0; i < n; i++) {
    count[(arr[i] ~/ exp) % 10]++;
  }

  for (i = 1; i < 10; i++) {
    count[i] += count[i - 1];
  }

  for (i = n - 1; i >= 0; i--) {
    output[count[(arr[i] ~/ exp) % 10] - 1] = arr[i];
    count[(arr[i] ~/ exp) % 10]--;
  }

  for (i = 0; i < n; i++) {
    arr[i] = output[i];
    yield [...arr];
  }
}

Stream<List<int>> radixSort(List<int> arr) async* {
  final c = [...arr];
  final m = c.fold<int>(c.first, (p, c) => max(p, c));

  for (int exp = 1; m ~/ exp > 0; exp *= 10) {
    yield* countSort(c, c.length, exp);
  }
}
