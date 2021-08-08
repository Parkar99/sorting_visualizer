// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sort_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SortStateTearOff {
  const _$SortStateTearOff();

  _SortState call(
      {required List<int> list,
      bool running = false,
      int count = SortState.defaultCount}) {
    return _SortState(
      list: list,
      running: running,
      count: count,
    );
  }
}

/// @nodoc
const $SortState = _$SortStateTearOff();

/// @nodoc
mixin _$SortState {
  List<int> get list => throw _privateConstructorUsedError;
  bool get running => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortStateCopyWith<SortState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortStateCopyWith<$Res> {
  factory $SortStateCopyWith(SortState value, $Res Function(SortState) then) =
      _$SortStateCopyWithImpl<$Res>;
  $Res call({List<int> list, bool running, int count});
}

/// @nodoc
class _$SortStateCopyWithImpl<$Res> implements $SortStateCopyWith<$Res> {
  _$SortStateCopyWithImpl(this._value, this._then);

  final SortState _value;
  // ignore: unused_field
  final $Res Function(SortState) _then;

  @override
  $Res call({
    Object? list = freezed,
    Object? running = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<int>,
      running: running == freezed
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as bool,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SortStateCopyWith<$Res> implements $SortStateCopyWith<$Res> {
  factory _$SortStateCopyWith(
          _SortState value, $Res Function(_SortState) then) =
      __$SortStateCopyWithImpl<$Res>;
  @override
  $Res call({List<int> list, bool running, int count});
}

/// @nodoc
class __$SortStateCopyWithImpl<$Res> extends _$SortStateCopyWithImpl<$Res>
    implements _$SortStateCopyWith<$Res> {
  __$SortStateCopyWithImpl(_SortState _value, $Res Function(_SortState) _then)
      : super(_value, (v) => _then(v as _SortState));

  @override
  _SortState get _value => super._value as _SortState;

  @override
  $Res call({
    Object? list = freezed,
    Object? running = freezed,
    Object? count = freezed,
  }) {
    return _then(_SortState(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<int>,
      running: running == freezed
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as bool,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SortState with DiagnosticableTreeMixin implements _SortState {
  const _$_SortState(
      {required this.list,
      this.running = false,
      this.count = SortState.defaultCount});

  @override
  final List<int> list;
  @JsonKey(defaultValue: false)
  @override
  final bool running;
  @JsonKey(defaultValue: SortState.defaultCount)
  @override
  final int count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SortState(list: $list, running: $running, count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SortState'))
      ..add(DiagnosticsProperty('list', list))
      ..add(DiagnosticsProperty('running', running))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SortState &&
            (identical(other.list, list) ||
                const DeepCollectionEquality().equals(other.list, list)) &&
            (identical(other.running, running) ||
                const DeepCollectionEquality()
                    .equals(other.running, running)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(list) ^
      const DeepCollectionEquality().hash(running) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$SortStateCopyWith<_SortState> get copyWith =>
      __$SortStateCopyWithImpl<_SortState>(this, _$identity);
}

abstract class _SortState implements SortState {
  const factory _SortState({required List<int> list, bool running, int count}) =
      _$_SortState;

  @override
  List<int> get list => throw _privateConstructorUsedError;
  @override
  bool get running => throw _privateConstructorUsedError;
  @override
  int get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SortStateCopyWith<_SortState> get copyWith =>
      throw _privateConstructorUsedError;
}
