// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_lists.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemLists {
  List<ItemList> get itemLists => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemListsCopyWith<ItemLists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemListsCopyWith<$Res> {
  factory $ItemListsCopyWith(ItemLists value, $Res Function(ItemLists) then) =
      _$ItemListsCopyWithImpl<$Res>;
  $Res call({List<ItemList> itemLists, bool loading});
}

/// @nodoc
class _$ItemListsCopyWithImpl<$Res> implements $ItemListsCopyWith<$Res> {
  _$ItemListsCopyWithImpl(this._value, this._then);

  final ItemLists _value;
  // ignore: unused_field
  final $Res Function(ItemLists) _then;

  @override
  $Res call({
    Object? itemLists = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      itemLists: itemLists == freezed
          ? _value.itemLists
          : itemLists // ignore: cast_nullable_to_non_nullable
              as List<ItemList>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemListsCopyWith<$Res> implements $ItemListsCopyWith<$Res> {
  factory _$$_ItemListsCopyWith(
          _$_ItemLists value, $Res Function(_$_ItemLists) then) =
      __$$_ItemListsCopyWithImpl<$Res>;
  @override
  $Res call({List<ItemList> itemLists, bool loading});
}

/// @nodoc
class __$$_ItemListsCopyWithImpl<$Res> extends _$ItemListsCopyWithImpl<$Res>
    implements _$$_ItemListsCopyWith<$Res> {
  __$$_ItemListsCopyWithImpl(
      _$_ItemLists _value, $Res Function(_$_ItemLists) _then)
      : super(_value, (v) => _then(v as _$_ItemLists));

  @override
  _$_ItemLists get _value => super._value as _$_ItemLists;

  @override
  $Res call({
    Object? itemLists = freezed,
    Object? loading = freezed,
  }) {
    return _then(_$_ItemLists(
      itemLists: itemLists == freezed
          ? _value._itemLists
          : itemLists // ignore: cast_nullable_to_non_nullable
              as List<ItemList>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ItemLists implements _ItemLists {
  const _$_ItemLists(
      {final List<ItemList> itemLists = const <ItemList>[],
      this.loading = true})
      : _itemLists = itemLists;

  final List<ItemList> _itemLists;
  @override
  @JsonKey()
  List<ItemList> get itemLists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemLists);
  }

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'ItemLists(itemLists: $itemLists, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemLists &&
            const DeepCollectionEquality()
                .equals(other._itemLists, _itemLists) &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_itemLists),
      const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  _$$_ItemListsCopyWith<_$_ItemLists> get copyWith =>
      __$$_ItemListsCopyWithImpl<_$_ItemLists>(this, _$identity);
}

abstract class _ItemLists implements ItemLists {
  const factory _ItemLists(
      {final List<ItemList> itemLists, final bool loading}) = _$_ItemLists;

  @override
  List<ItemList> get itemLists;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$_ItemListsCopyWith<_$_ItemLists> get copyWith =>
      throw _privateConstructorUsedError;
}
