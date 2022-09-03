// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemList _$ItemListFromJson(Map<String, dynamic> json) {
  return _ItemList.fromJson(json);
}

/// @nodoc
mixin _$ItemList {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemListCopyWith<ItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemListCopyWith<$Res> {
  factory $ItemListCopyWith(ItemList value, $Res Function(ItemList) then) =
      _$ItemListCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String userId,
      List<Item> items,
      String createdAt});
}

/// @nodoc
class _$ItemListCopyWithImpl<$Res> implements $ItemListCopyWith<$Res> {
  _$ItemListCopyWithImpl(this._value, this._then);

  final ItemList _value;
  // ignore: unused_field
  final $Res Function(ItemList) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? userId = freezed,
    Object? items = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemListCopyWith<$Res> implements $ItemListCopyWith<$Res> {
  factory _$$_ItemListCopyWith(
          _$_ItemList value, $Res Function(_$_ItemList) then) =
      __$$_ItemListCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String userId,
      List<Item> items,
      String createdAt});
}

/// @nodoc
class __$$_ItemListCopyWithImpl<$Res> extends _$ItemListCopyWithImpl<$Res>
    implements _$$_ItemListCopyWith<$Res> {
  __$$_ItemListCopyWithImpl(
      _$_ItemList _value, $Res Function(_$_ItemList) _then)
      : super(_value, (v) => _then(v as _$_ItemList));

  @override
  _$_ItemList get _value => super._value as _$_ItemList;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? userId = freezed,
    Object? items = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_ItemList(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ItemList implements _ItemList {
  const _$_ItemList(
      {this.id = '',
      this.title = '',
      this.userId = '',
      final List<Item> items = const <Item>[],
      this.createdAt = ''})
      : _items = items;

  factory _$_ItemList.fromJson(Map<String, dynamic> json) =>
      _$$_ItemListFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String userId;
  final List<Item> _items;
  @override
  @JsonKey()
  List<Item> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final String createdAt;

  @override
  String toString() {
    return 'ItemList(id: $id, title: $title, userId: $userId, items: $items, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemList &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_ItemListCopyWith<_$_ItemList> get copyWith =>
      __$$_ItemListCopyWithImpl<_$_ItemList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemListToJson(
      this,
    );
  }
}

abstract class _ItemList implements ItemList {
  const factory _ItemList(
      {final String id,
      final String title,
      final String userId,
      final List<Item> items,
      final String createdAt}) = _$_ItemList;

  factory _ItemList.fromJson(Map<String, dynamic> json) = _$_ItemList.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get userId;
  @override
  List<Item> get items;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ItemListCopyWith<_$_ItemList> get copyWith =>
      throw _privateConstructorUsedError;
}
