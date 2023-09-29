import 'package:equatable/equatable.dart';

const kPromptPrefix = "Generate a summary for this paragraph:";

class GptRequestBodyModel extends Equatable {
  final String? model;
  final String? prompt;
  final int? maxTokens;

  const GptRequestBodyModel({this.model, this.prompt, this.maxTokens});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model'] = model;
    data['prompt'] = "$kPromptPrefix $prompt";
    data['max_tokens'] = maxTokens;
    return data;
  }

  @override
  List<Object?> get props => [model, prompt, maxTokens];
}
