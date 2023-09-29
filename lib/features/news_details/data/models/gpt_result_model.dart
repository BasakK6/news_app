import 'package:news_app/features/news_details/domain/entities/gpt_result_entity.dart';

class GptResultModel extends GptResultEntity {
  const GptResultModel(
      {super.id,
      super.object,
      super.created,
      super.model,
      super.choices,
      super.usage});

  factory GptResultModel.fromJson(Map<String, dynamic> json) {
    List<ChoicesModel>? choices;
    if (json['choices'] != null) {
      choices = <ChoicesModel>[];
      json['choices'].forEach((v) {
        choices!.add(ChoicesModel.fromJson(v));
      });
    }
    return GptResultModel(
      id: json['id'],
      object: json['object'],
      created: json['created'],
      model: json['model'],
      choices: choices,
      usage: json['usage'] != null ? UsageModel.fromJson(json['usage']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['model'] = model;
    if (choices != null) {
      data['choices'] =
          choices!.map((v) => (v as ChoicesModel).toJson()).toList();
    }
    if (usage != null) {
      data['usage'] = (usage! as UsageModel).toJson();
    }
    return data;
  }
}

class ChoicesModel extends ChoicesEntity {
  const ChoicesModel({
    super.text,
    super.index,
    super.finishReason,
  });

  factory ChoicesModel.fromJson(Map<String, dynamic> json) {
    return ChoicesModel(
      text: json['text'],
      index: json['index'],
      finishReason: json['finish_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['index'] = index;
    data['finish_reason'] = finishReason;
    return data;
  }
}

class UsageModel extends UsageEntity {
  const UsageModel(
      {super.promptTokens, super.completionTokens, super.totalTokens});

  factory UsageModel.fromJson(Map<String, dynamic> json) {
    return UsageModel(
      promptTokens: json['prompt_tokens'],
      completionTokens: json['completion_tokens'],
      totalTokens: json['total_tokens'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prompt_tokens'] = promptTokens;
    data['completion_tokens'] = completionTokens;
    data['total_tokens'] = totalTokens;
    return data;
  }
}
