// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool get hasBought => throw _privateConstructorUsedError;
  bool get isStarred => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      int? quantity,
      String? memo,
      DateTime? date,
      bool hasBought,
      bool isStarred});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? memo = freezed,
    Object? date = freezed,
    Object? hasBought = freezed,
    Object? isStarred = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasBought: hasBought == freezed
          ? _value.hasBought
          : hasBought // ignore: cast_nullable_to_non_nullable
              as bool,
      isStarred: isStarred == freezed
          ? _value.isStarred
          : isStarred // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      int? quantity,
      String? memo,
      DateTime? date,
      bool hasBought,
      bool isStarred});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, (v) => _then(v as _$_Item));

  @override
  _$_Item get _value => super._value as _$_Item;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? quantity = freezed,
    Object? memo = freezed,
    Object? date = freezed,
    Object? hasBought = freezed,
    Object? isStarred = freezed,
  }) {
    return _then(_$_Item(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasBought: hasBought == freezed
          ? _value.hasBought
          : hasBought // ignore: cast_nullable_to_non_nullable
              as bool,
      isStarred: isStarred == freezed
          ? _value.isStarred
          : isStarred // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item(
      {this.id = '',
      this.name = '',
      this.quantity,
      this.memo,
      this.date,
      this.hasBought = false,
      this.isStarred = false});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  final int? quantity;
  @override
  final String? memo;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final bool hasBought;
  @override
  @JsonKey()
  final bool isStarred;

  @override
  String toString() {
    return 'Item(id: $id, name: $name, quantity: $quantity, memo: $memo, date: $date, hasBought: $hasBought, isStarred: $isStarred)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.hasBought, hasBought) &&
            const DeepCollectionEquality().equals(other.isStarred, isStarred));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(hasBought),
      const DeepCollectionEquality().hash(isStarred));

  @JsonKey(ignore: true)
  @override
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {final String id,
      final String name,
      final int? quantity,
      final String? memo,
      final DateTime? date,
      final bool hasBought,
      final bool isStarred}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int? get quantity;
  @override
  String? get memo;
  @override
  DateTime? get date;
  @override
  bool get hasBought;
  @override
  bool get isStarred;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
