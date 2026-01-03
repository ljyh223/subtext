import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload_response.freezed.dart';
part 'file_upload_response.g.dart';

@freezed
class FileUploadResponse with _$FileUploadResponse {
  const factory FileUploadResponse({
    required int code,
    required FileUploadData? data,
    required String msg,
    FileUploadDetail? detail,
  }) = _FileUploadResponse;

  factory FileUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$FileUploadResponseFromJson(json);
}

@freezed
class FileUploadData with _$FileUploadData {
  const factory FileUploadData({
    required int bytes,
    @JsonKey(name: 'created_at') required int createdAt,
    @JsonKey(name: 'file_name') required String fileName,
    required String id,
  }) = _FileUploadData;

  factory FileUploadData.fromJson(Map<String, dynamic> json) =>
      _$FileUploadDataFromJson(json);
}

@freezed
class FileUploadDetail with _$FileUploadDetail {
  const factory FileUploadDetail({required String logid}) = _FileUploadDetail;

  factory FileUploadDetail.fromJson(Map<String, dynamic> json) =>
      _$FileUploadDetailFromJson(json);
}
