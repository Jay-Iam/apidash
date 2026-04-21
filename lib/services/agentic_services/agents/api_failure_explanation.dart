import 'package:apidash/services/agentic_services/api_testing/api_testing_ai.dart';
import 'package:apidash/templates/templates.dart';
import 'package:apidash_core/apidash_core.dart';

class ApiFailureExplanationAgent extends AIAgent {
  @override
  String get agentName => 'API_FAILURE_EXPLANATION';

  @override
  String getSystemPrompt() {
    return kPromptApiFailureExplanation;
  }

  @override
  Future<bool> validator(String aiResponse) async {
    try {
      ApiTestingAiParser.parseFailureExplanation(aiResponse);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<dynamic> outputFormatter(String validatedResponse) async {
    final explanation = ApiTestingAiParser.parseFailureExplanation(
      validatedResponse,
    );
    return {'FAILURE_EXPLANATION': explanation.toJson()};
  }
}
