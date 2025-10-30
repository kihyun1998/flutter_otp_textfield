import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'otp_provider.g.dart';

/// Model for OTP provider parameters
class OtpParams {
  final String exampleId;
  final int fieldCount;

  const OtpParams({
    required this.exampleId,
    required this.fieldCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtpParams &&
          runtimeType == other.runtimeType &&
          exampleId == other.exampleId &&
          fieldCount == other.fieldCount;

  @override
  int get hashCode => exampleId.hashCode ^ fieldCount.hashCode;
}

/// Provider for OTP controllers - each example has its own controllers
@riverpod
class OtpControllers extends _$OtpControllers {
  @override
  List<TextEditingController> build(OtpParams params) {
    final controllers =
        List.generate(params.fieldCount, (_) => TextEditingController());

    // Dispose controllers when provider is disposed
    ref.onDispose(() {
      for (final controller in controllers) {
        controller.dispose();
      }
    });

    return controllers;
  }

  /// Clear all OTP fields
  void clear() {
    for (final controller in state) {
      controller.clear();
    }
  }

  /// Set OTP value
  void setValue(String value) {
    final chars = value.split('');
    for (var i = 0; i < state.length && i < chars.length; i++) {
      state[i].text = chars[i];
    }
  }

  /// Get current OTP value
  String getValue() {
    return state.map((c) => c.text).join();
  }
}

/// Provider for OTP focus nodes - each example has its own focus nodes
@riverpod
class OtpFocusNodes extends _$OtpFocusNodes {
  @override
  List<FocusNode> build(OtpParams params) {
    final focusNodes =
        List.generate(params.fieldCount, (_) => FocusNode());

    // Dispose focus nodes when provider is disposed
    ref.onDispose(() {
      for (final node in focusNodes) {
        node.dispose();
      }
    });

    return focusNodes;
  }
}

/// Provider for current OTP value
@riverpod
class CurrentOtp extends _$CurrentOtp {
  @override
  String build(String exampleId) {
    return '';
  }

  void update(String value) {
    state = value;
  }

  void clear() {
    state = '';
  }
}

/// Provider for error state
@riverpod
class OtpHasError extends _$OtpHasError {
  @override
  bool build(String exampleId) {
    return false;
  }

  void setError(bool hasError) {
    state = hasError;
  }
}
