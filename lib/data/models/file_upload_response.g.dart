// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileUploadResponseImpl _$$FileUploadResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FileUploadResponseImpl(
  code: (json['code'] as num).toInt(),
  data: json['data'] == null
      ? null
      : FileUploadData.fromJson(json['data'] as Map<String, dynamic>),
  msg: json['msg'] as String,
  detail: json['detail'] == null
      ? null
      : FileUploadDetail.fromJson(json['detail'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$FileUploadResponseImplToJson(
  _$FileUploadResponseImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'data': instance.data,
  'msg': instance.msg,
  'detail': instance.detail,
};

_$FileUploadDataImpl _$$FileUploadDataImplFromJson(Map<String, dynamic> json) =>
    _$FileUploadDataImpl(
      bytes: (json['bytes'] as num).toInt(),
      createdAt: (json['created_at'] as num).toInt(),
      fileName: json['file_name'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$FileUploadDataImplToJson(
  _$FileUploadDataImpl instance,
) => <String, dynamic>{
  'bytes': instance.bytes,
  'created_at': instance.createdAt,
  'file_name': instance.fileName,
  'id': instance.id,
};

_$FileUploadDetailImpl _$$FileUploadDetailImplFromJson(
  Map<String, dynamic> json,
) => _$FileUploadDetailImpl(logid: json['logid'] as String);

Map<String, dynamic> _$$FileUploadDetailImplToJson(
  _$FileUploadDetailImpl instance,
) => <String, dynamic>{'logid': instance.logid};
