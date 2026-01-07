// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtext_analysis_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubtextAnalysisResponse _$SubtextAnalysisResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SubtextAnalysisResponse.fromJson(json);
}

/// @nodoc
mixin _$SubtextAnalysisResponse {
  String get status => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtext_analysis')
  SubtextAnalysis get subtextAnalysis => throw _privateConstructorUsedError;
  List<Strategy> get strategies => throw _privateConstructorUsedError;
  @JsonKey(name: 'cot_log_dump')
  String get cotLogDump => throw _privateConstructorUsedError;

  /// Serializes this SubtextAnalysisResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubtextAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtextAnalysisResponseCopyWith<SubtextAnalysisResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtextAnalysisResponseCopyWith<$Res> {
  factory $SubtextAnalysisResponseCopyWith(
    SubtextAnalysisResponse value,
    $Res Function(SubtextAnalysisResponse) then,
  ) = _$SubtextAnalysisResponseCopyWithImpl<$Res, SubtextAnalysisResponse>;
  @useResult
  $Res call({
    String status,
    Meta meta,
    @JsonKey(name: 'subtext_analysis') SubtextAnalysis subtextAnalysis,
    List<Strategy> strategies,
    @JsonKey(name: 'cot_log_dump') String cotLogDump,
  });

  $MetaCopyWith<$Res> get meta;
  $SubtextAnalysisCopyWith<$Res> get subtextAnalysis;
}

/// @nodoc
class _$SubtextAnalysisResponseCopyWithImpl<
  $Res,
  $Val extends SubtextAnalysisResponse
>
    implements $SubtextAnalysisResponseCopyWith<$Res> {
  _$SubtextAnalysisResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubtextAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? meta = null,
    Object? subtextAnalysis = null,
    Object? strategies = null,
    Object? cotLogDump = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            meta: null == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as Meta,
            subtextAnalysis: null == subtextAnalysis
                ? _value.subtextAnalysis
                : subtextAnalysis // ignore: cast_nullable_to_non_nullable
                      as SubtextAnalysis,
            strategies: null == strategies
                ? _value.strategies
                : strategies // ignore: cast_nullable_to_non_nullable
                      as List<Strategy>,
            cotLogDump: null == cotLogDump
                ? _value.cotLogDump
                : cotLogDump // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of SubtextAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of SubtextAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubtextAnalysisCopyWith<$Res> get subtextAnalysis {
    return $SubtextAnalysisCopyWith<$Res>(_value.subtextAnalysis, (value) {
      return _then(_value.copyWith(subtextAnalysis: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubtextAnalysisResponseImplCopyWith<$Res>
    implements $SubtextAnalysisResponseCopyWith<$Res> {
  factory _$$SubtextAnalysisResponseImplCopyWith(
    _$SubtextAnalysisResponseImpl value,
    $Res Function(_$SubtextAnalysisResponseImpl) then,
  ) = __$$SubtextAnalysisResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String status,
    Meta meta,
    @JsonKey(name: 'subtext_analysis') SubtextAnalysis subtextAnalysis,
    List<Strategy> strategies,
    @JsonKey(name: 'cot_log_dump') String cotLogDump,
  });

  @override
  $MetaCopyWith<$Res> get meta;
  @override
  $SubtextAnalysisCopyWith<$Res> get subtextAnalysis;
}

/// @nodoc
class __$$SubtextAnalysisResponseImplCopyWithImpl<$Res>
    extends
        _$SubtextAnalysisResponseCopyWithImpl<
          $Res,
          _$SubtextAnalysisResponseImpl
        >
    implements _$$SubtextAnalysisResponseImplCopyWith<$Res> {
  __$$SubtextAnalysisResponseImplCopyWithImpl(
    _$SubtextAnalysisResponseImpl _value,
    $Res Function(_$SubtextAnalysisResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubtextAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? meta = null,
    Object? subtextAnalysis = null,
    Object? strategies = null,
    Object? cotLogDump = null,
  }) {
    return _then(
      _$SubtextAnalysisResponseImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        meta: null == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as Meta,
        subtextAnalysis: null == subtextAnalysis
            ? _value.subtextAnalysis
            : subtextAnalysis // ignore: cast_nullable_to_non_nullable
                  as SubtextAnalysis,
        strategies: null == strategies
            ? _value._strategies
            : strategies // ignore: cast_nullable_to_non_nullable
                  as List<Strategy>,
        cotLogDump: null == cotLogDump
            ? _value.cotLogDump
            : cotLogDump // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtextAnalysisResponseImpl implements _SubtextAnalysisResponse {
  const _$SubtextAnalysisResponseImpl({
    required this.status,
    required this.meta,
    @JsonKey(name: 'subtext_analysis') required this.subtextAnalysis,
    required final List<Strategy> strategies,
    @JsonKey(name: 'cot_log_dump') required this.cotLogDump,
  }) : _strategies = strategies;

  factory _$SubtextAnalysisResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtextAnalysisResponseImplFromJson(json);

  @override
  final String status;
  @override
  final Meta meta;
  @override
  @JsonKey(name: 'subtext_analysis')
  final SubtextAnalysis subtextAnalysis;
  final List<Strategy> _strategies;
  @override
  List<Strategy> get strategies {
    if (_strategies is EqualUnmodifiableListView) return _strategies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strategies);
  }

  @override
  @JsonKey(name: 'cot_log_dump')
  final String cotLogDump;

  @override
  String toString() {
    return 'SubtextAnalysisResponse(status: $status, meta: $meta, subtextAnalysis: $subtextAnalysis, strategies: $strategies, cotLogDump: $cotLogDump)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtextAnalysisResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.subtextAnalysis, subtextAnalysis) ||
                other.subtextAnalysis == subtextAnalysis) &&
            const DeepCollectionEquality().equals(
              other._strategies,
              _strategies,
            ) &&
            (identical(other.cotLogDump, cotLogDump) ||
                other.cotLogDump == cotLogDump));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    meta,
    subtextAnalysis,
    const DeepCollectionEquality().hash(_strategies),
    cotLogDump,
  );

  /// Create a copy of SubtextAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtextAnalysisResponseImplCopyWith<_$SubtextAnalysisResponseImpl>
  get copyWith =>
      __$$SubtextAnalysisResponseImplCopyWithImpl<
        _$SubtextAnalysisResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtextAnalysisResponseImplToJson(this);
  }
}

abstract class _SubtextAnalysisResponse implements SubtextAnalysisResponse {
  const factory _SubtextAnalysisResponse({
    required final String status,
    required final Meta meta,
    @JsonKey(name: 'subtext_analysis')
    required final SubtextAnalysis subtextAnalysis,
    required final List<Strategy> strategies,
    @JsonKey(name: 'cot_log_dump') required final String cotLogDump,
  }) = _$SubtextAnalysisResponseImpl;

  factory _SubtextAnalysisResponse.fromJson(Map<String, dynamic> json) =
      _$SubtextAnalysisResponseImpl.fromJson;

  @override
  String get status;
  @override
  Meta get meta;
  @override
  @JsonKey(name: 'subtext_analysis')
  SubtextAnalysis get subtextAnalysis;
  @override
  List<Strategy> get strategies;
  @override
  @JsonKey(name: 'cot_log_dump')
  String get cotLogDump;

  /// Create a copy of SubtextAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtextAnalysisResponseImplCopyWith<_$SubtextAnalysisResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: 'risk_score')
  int get riskScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'risk_level')
  String get riskLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'core_intent')
  String get coreIntent => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call({
    @JsonKey(name: 'risk_score') int riskScore,
    @JsonKey(name: 'risk_level') String riskLevel,
    @JsonKey(name: 'core_intent') String coreIntent,
  });
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskScore = null,
    Object? riskLevel = null,
    Object? coreIntent = null,
  }) {
    return _then(
      _value.copyWith(
            riskScore: null == riskScore
                ? _value.riskScore
                : riskScore // ignore: cast_nullable_to_non_nullable
                      as int,
            riskLevel: null == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as String,
            coreIntent: null == coreIntent
                ? _value.coreIntent
                : coreIntent // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
    _$MetaImpl value,
    $Res Function(_$MetaImpl) then,
  ) = __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'risk_score') int riskScore,
    @JsonKey(name: 'risk_level') String riskLevel,
    @JsonKey(name: 'core_intent') String coreIntent,
  });
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
    : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskScore = null,
    Object? riskLevel = null,
    Object? coreIntent = null,
  }) {
    return _then(
      _$MetaImpl(
        riskScore: null == riskScore
            ? _value.riskScore
            : riskScore // ignore: cast_nullable_to_non_nullable
                  as int,
        riskLevel: null == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as String,
        coreIntent: null == coreIntent
            ? _value.coreIntent
            : coreIntent // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl({
    @JsonKey(name: 'risk_score') required this.riskScore,
    @JsonKey(name: 'risk_level') required this.riskLevel,
    @JsonKey(name: 'core_intent') required this.coreIntent,
  });

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  @JsonKey(name: 'risk_score')
  final int riskScore;
  @override
  @JsonKey(name: 'risk_level')
  final String riskLevel;
  @override
  @JsonKey(name: 'core_intent')
  final String coreIntent;

  @override
  String toString() {
    return 'Meta(riskScore: $riskScore, riskLevel: $riskLevel, coreIntent: $coreIntent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.riskScore, riskScore) ||
                other.riskScore == riskScore) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.coreIntent, coreIntent) ||
                other.coreIntent == coreIntent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, riskScore, riskLevel, coreIntent);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(this);
  }
}

abstract class _Meta implements Meta {
  const factory _Meta({
    @JsonKey(name: 'risk_score') required final int riskScore,
    @JsonKey(name: 'risk_level') required final String riskLevel,
    @JsonKey(name: 'core_intent') required final String coreIntent,
  }) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  @JsonKey(name: 'risk_score')
  int get riskScore;
  @override
  @JsonKey(name: 'risk_level')
  String get riskLevel;
  @override
  @JsonKey(name: 'core_intent')
  String get coreIntent;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubtextAnalysis _$SubtextAnalysisFromJson(Map<String, dynamic> json) {
  return _SubtextAnalysis.fromJson(json);
}

/// @nodoc
mixin _$SubtextAnalysis {
  String get tone => throw _privateConstructorUsedError;
  @JsonKey(name: 'psych_profile')
  String get psychProfile => throw _privateConstructorUsedError;

  /// Serializes this SubtextAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubtextAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtextAnalysisCopyWith<SubtextAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtextAnalysisCopyWith<$Res> {
  factory $SubtextAnalysisCopyWith(
    SubtextAnalysis value,
    $Res Function(SubtextAnalysis) then,
  ) = _$SubtextAnalysisCopyWithImpl<$Res, SubtextAnalysis>;
  @useResult
  $Res call({String tone, @JsonKey(name: 'psych_profile') String psychProfile});
}

/// @nodoc
class _$SubtextAnalysisCopyWithImpl<$Res, $Val extends SubtextAnalysis>
    implements $SubtextAnalysisCopyWith<$Res> {
  _$SubtextAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubtextAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tone = null, Object? psychProfile = null}) {
    return _then(
      _value.copyWith(
            tone: null == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                      as String,
            psychProfile: null == psychProfile
                ? _value.psychProfile
                : psychProfile // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubtextAnalysisImplCopyWith<$Res>
    implements $SubtextAnalysisCopyWith<$Res> {
  factory _$$SubtextAnalysisImplCopyWith(
    _$SubtextAnalysisImpl value,
    $Res Function(_$SubtextAnalysisImpl) then,
  ) = __$$SubtextAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tone, @JsonKey(name: 'psych_profile') String psychProfile});
}

/// @nodoc
class __$$SubtextAnalysisImplCopyWithImpl<$Res>
    extends _$SubtextAnalysisCopyWithImpl<$Res, _$SubtextAnalysisImpl>
    implements _$$SubtextAnalysisImplCopyWith<$Res> {
  __$$SubtextAnalysisImplCopyWithImpl(
    _$SubtextAnalysisImpl _value,
    $Res Function(_$SubtextAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubtextAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tone = null, Object? psychProfile = null}) {
    return _then(
      _$SubtextAnalysisImpl(
        tone: null == tone
            ? _value.tone
            : tone // ignore: cast_nullable_to_non_nullable
                  as String,
        psychProfile: null == psychProfile
            ? _value.psychProfile
            : psychProfile // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtextAnalysisImpl implements _SubtextAnalysis {
  const _$SubtextAnalysisImpl({
    required this.tone,
    @JsonKey(name: 'psych_profile') required this.psychProfile,
  });

  factory _$SubtextAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtextAnalysisImplFromJson(json);

  @override
  final String tone;
  @override
  @JsonKey(name: 'psych_profile')
  final String psychProfile;

  @override
  String toString() {
    return 'SubtextAnalysis(tone: $tone, psychProfile: $psychProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtextAnalysisImpl &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.psychProfile, psychProfile) ||
                other.psychProfile == psychProfile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tone, psychProfile);

  /// Create a copy of SubtextAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtextAnalysisImplCopyWith<_$SubtextAnalysisImpl> get copyWith =>
      __$$SubtextAnalysisImplCopyWithImpl<_$SubtextAnalysisImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtextAnalysisImplToJson(this);
  }
}

abstract class _SubtextAnalysis implements SubtextAnalysis {
  const factory _SubtextAnalysis({
    required final String tone,
    @JsonKey(name: 'psych_profile') required final String psychProfile,
  }) = _$SubtextAnalysisImpl;

  factory _SubtextAnalysis.fromJson(Map<String, dynamic> json) =
      _$SubtextAnalysisImpl.fromJson;

  @override
  String get tone;
  @override
  @JsonKey(name: 'psych_profile')
  String get psychProfile;

  /// Create a copy of SubtextAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtextAnalysisImplCopyWith<_$SubtextAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Strategy _$StrategyFromJson(Map<String, dynamic> json) {
  return _Strategy.fromJson(json);
}

/// @nodoc
mixin _$Strategy {
  String get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_response')
  String get expectedResponse => throw _privateConstructorUsedError;
  @JsonKey(name: 'use_case')
  String get useCase => throw _privateConstructorUsedError;

  /// Serializes this Strategy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Strategy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrategyCopyWith<Strategy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrategyCopyWith<$Res> {
  factory $StrategyCopyWith(Strategy value, $Res Function(Strategy) then) =
      _$StrategyCopyWithImpl<$Res, Strategy>;
  @useResult
  $Res call({
    String type,
    String content,
    @JsonKey(name: 'expected_response') String expectedResponse,
    @JsonKey(name: 'use_case') String useCase,
  });
}

/// @nodoc
class _$StrategyCopyWithImpl<$Res, $Val extends Strategy>
    implements $StrategyCopyWith<$Res> {
  _$StrategyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Strategy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? content = null,
    Object? expectedResponse = null,
    Object? useCase = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            expectedResponse: null == expectedResponse
                ? _value.expectedResponse
                : expectedResponse // ignore: cast_nullable_to_non_nullable
                      as String,
            useCase: null == useCase
                ? _value.useCase
                : useCase // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StrategyImplCopyWith<$Res>
    implements $StrategyCopyWith<$Res> {
  factory _$$StrategyImplCopyWith(
    _$StrategyImpl value,
    $Res Function(_$StrategyImpl) then,
  ) = __$$StrategyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    String content,
    @JsonKey(name: 'expected_response') String expectedResponse,
    @JsonKey(name: 'use_case') String useCase,
  });
}

/// @nodoc
class __$$StrategyImplCopyWithImpl<$Res>
    extends _$StrategyCopyWithImpl<$Res, _$StrategyImpl>
    implements _$$StrategyImplCopyWith<$Res> {
  __$$StrategyImplCopyWithImpl(
    _$StrategyImpl _value,
    $Res Function(_$StrategyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Strategy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? content = null,
    Object? expectedResponse = null,
    Object? useCase = null,
  }) {
    return _then(
      _$StrategyImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        expectedResponse: null == expectedResponse
            ? _value.expectedResponse
            : expectedResponse // ignore: cast_nullable_to_non_nullable
                  as String,
        useCase: null == useCase
            ? _value.useCase
            : useCase // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StrategyImpl implements _Strategy {
  const _$StrategyImpl({
    required this.type,
    required this.content,
    @JsonKey(name: 'expected_response') required this.expectedResponse,
    @JsonKey(name: 'use_case') required this.useCase,
  });

  factory _$StrategyImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrategyImplFromJson(json);

  @override
  final String type;
  @override
  final String content;
  @override
  @JsonKey(name: 'expected_response')
  final String expectedResponse;
  @override
  @JsonKey(name: 'use_case')
  final String useCase;

  @override
  String toString() {
    return 'Strategy(type: $type, content: $content, expectedResponse: $expectedResponse, useCase: $useCase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrategyImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.expectedResponse, expectedResponse) ||
                other.expectedResponse == expectedResponse) &&
            (identical(other.useCase, useCase) || other.useCase == useCase));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, content, expectedResponse, useCase);

  /// Create a copy of Strategy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrategyImplCopyWith<_$StrategyImpl> get copyWith =>
      __$$StrategyImplCopyWithImpl<_$StrategyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrategyImplToJson(this);
  }
}

abstract class _Strategy implements Strategy {
  const factory _Strategy({
    required final String type,
    required final String content,
    @JsonKey(name: 'expected_response') required final String expectedResponse,
    @JsonKey(name: 'use_case') required final String useCase,
  }) = _$StrategyImpl;

  factory _Strategy.fromJson(Map<String, dynamic> json) =
      _$StrategyImpl.fromJson;

  @override
  String get type;
  @override
  String get content;
  @override
  @JsonKey(name: 'expected_response')
  String get expectedResponse;
  @override
  @JsonKey(name: 'use_case')
  String get useCase;

  /// Create a copy of Strategy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrategyImplCopyWith<_$StrategyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
