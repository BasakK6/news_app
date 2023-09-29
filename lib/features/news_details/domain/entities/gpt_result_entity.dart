import 'package:equatable/equatable.dart';

class GptResultEntity extends Equatable {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final List<ChoicesEntity>? choices;
  final UsageEntity? usage;

  const GptResultEntity(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.choices,
      this.usage});

  @override
  List<Object?> get props => [id, object, created, model, choices, usage];
}

class ChoicesEntity extends Equatable {
  final String? text;
  final int? index;
  final String? finishReason;

  const ChoicesEntity({this.text, this.index, this.finishReason});

  @override
  List<Object?> get props => [text, index, finishReason];
}

class UsageEntity extends Equatable {
  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;

  const UsageEntity(
      {this.promptTokens, this.completionTokens, this.totalTokens});

  @override
  List<Object?> get props => [promptTokens, completionTokens, totalTokens];
}
