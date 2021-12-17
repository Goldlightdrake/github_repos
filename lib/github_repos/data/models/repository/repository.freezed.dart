// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return _Repository.fromJson(json);
}

/// @nodoc
class _$RepositoryTearOff {
  const _$RepositoryTearOff();

  _Repository call(
      {required String id,
      required String name,
      required String url,
      required List<Issue> issues,
      required List<PullRequest> pull_requests}) {
    return _Repository(
      id: id,
      name: name,
      url: url,
      issues: issues,
      pull_requests: pull_requests,
    );
  }

  Repository fromJson(Map<String, Object?> json) {
    return Repository.fromJson(json);
  }
}

/// @nodoc
const $Repository = _$RepositoryTearOff();

/// @nodoc
mixin _$Repository {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  List<Issue> get issues => throw _privateConstructorUsedError;
  List<PullRequest> get pull_requests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepositoryCopyWith<Repository> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryCopyWith<$Res> {
  factory $RepositoryCopyWith(
          Repository value, $Res Function(Repository) then) =
      _$RepositoryCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String url,
      List<Issue> issues,
      List<PullRequest> pull_requests});
}

/// @nodoc
class _$RepositoryCopyWithImpl<$Res> implements $RepositoryCopyWith<$Res> {
  _$RepositoryCopyWithImpl(this._value, this._then);

  final Repository _value;
  // ignore: unused_field
  final $Res Function(Repository) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? issues = freezed,
    Object? pull_requests = freezed,
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
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      issues: issues == freezed
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<Issue>,
      pull_requests: pull_requests == freezed
          ? _value.pull_requests
          : pull_requests // ignore: cast_nullable_to_non_nullable
              as List<PullRequest>,
    ));
  }
}

/// @nodoc
abstract class _$RepositoryCopyWith<$Res> implements $RepositoryCopyWith<$Res> {
  factory _$RepositoryCopyWith(
          _Repository value, $Res Function(_Repository) then) =
      __$RepositoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String url,
      List<Issue> issues,
      List<PullRequest> pull_requests});
}

/// @nodoc
class __$RepositoryCopyWithImpl<$Res> extends _$RepositoryCopyWithImpl<$Res>
    implements _$RepositoryCopyWith<$Res> {
  __$RepositoryCopyWithImpl(
      _Repository _value, $Res Function(_Repository) _then)
      : super(_value, (v) => _then(v as _Repository));

  @override
  _Repository get _value => super._value as _Repository;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? issues = freezed,
    Object? pull_requests = freezed,
  }) {
    return _then(_Repository(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      issues: issues == freezed
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<Issue>,
      pull_requests: pull_requests == freezed
          ? _value.pull_requests
          : pull_requests // ignore: cast_nullable_to_non_nullable
              as List<PullRequest>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Repository implements _Repository {
  const _$_Repository(
      {required this.id,
      required this.name,
      required this.url,
      required this.issues,
      required this.pull_requests});

  factory _$_Repository.fromJson(Map<String, dynamic> json) =>
      _$$_RepositoryFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String url;
  @override
  final List<Issue> issues;
  @override
  final List<PullRequest> pull_requests;

  @override
  String toString() {
    return 'Repository(id: $id, name: $name, url: $url, issues: $issues, pull_requests: $pull_requests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Repository &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.issues, issues) &&
            const DeepCollectionEquality()
                .equals(other.pull_requests, pull_requests));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(issues),
      const DeepCollectionEquality().hash(pull_requests));

  @JsonKey(ignore: true)
  @override
  _$RepositoryCopyWith<_Repository> get copyWith =>
      __$RepositoryCopyWithImpl<_Repository>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepositoryToJson(this);
  }
}

abstract class _Repository implements Repository {
  const factory _Repository(
      {required String id,
      required String name,
      required String url,
      required List<Issue> issues,
      required List<PullRequest> pull_requests}) = _$_Repository;

  factory _Repository.fromJson(Map<String, dynamic> json) =
      _$_Repository.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get url;
  @override
  List<Issue> get issues;
  @override
  List<PullRequest> get pull_requests;
  @override
  @JsonKey(ignore: true)
  _$RepositoryCopyWith<_Repository> get copyWith =>
      throw _privateConstructorUsedError;
}
