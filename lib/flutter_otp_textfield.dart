import 'package:acra_client/extensions/theme/themedata_ext.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ACRAOTPTextField extends ConsumerStatefulWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChange;
  final double boxWidth;
  final double boxHeight;
  final double spacing;
  final double? centerSpacing;

  final TextStyle textStyle;

  const ACRAOTPTextField({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.textStyle,
    this.onCompleted,
    this.onChange,
    this.boxWidth = 40,
    this.boxHeight = 50,
    this.spacing = 8,
    this.centerSpacing,
  }) : assert(
         controllers.length == focusNodes.length,
         'Controllers and FocusNodes must have the same length',
       );

  @override
  ConsumerState<ACRAOTPTextField> createState() => _ACRAOTPTextFieldState();
}

class _ACRAOTPTextFieldState extends ConsumerState<ACRAOTPTextField> {
  void _onTextChanged(int index, String text) {
    // 값이 변경될 때마다 onChange 콜백 호출
    if (widget.onChange != null) {
      final fullText = widget.controllers.map((c) => c.text).join();
      widget.onChange!(fullText);
    }

    // 모든 필드가 채워졌는지 확인
    final otp = widget.controllers.map((c) => c.text).join();
    final isAllFilled = otp.length == widget.controllers.length;

    if (text.isNotEmpty) {
      // 모든 필드가 채워졌으면 완료 콜백 호출
      if (isAllFilled) {
        if (widget.onCompleted != null) {
          widget.onCompleted!(otp);
        }
        // 마지막 필드면 포커스 해제
        if (index == widget.controllers.length - 1) {
          widget.focusNodes[index].unfocus();
        }
      } else {
        // 아직 다 안 채워졌으면 다음 빈 필드로 포커스 이동
        if (index < widget.controllers.length - 1) {
          widget.focusNodes[index + 1].requestFocus();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.controllers.length, (index) {
        // 3번째와 4번째 사이(인덱스 3)에 추가 간격
        final isMiddleGap = index == 3;
        final leftMargin = isMiddleGap
            ? widget.centerSpacing ?? widget.spacing * 1.5
            : widget.spacing / 2;

        return Container(
          margin: EdgeInsets.only(left: leftMargin, right: widget.spacing / 2),
          width: widget.boxWidth,
          height: widget.boxHeight,
          child: Focus(
            onKeyEvent: (node, event) {
              // 키가 눌렸을 때만 처리 (released는 무시)
              if (event is KeyDownEvent) {
                final controller = widget.controllers[index];

                // 백스페이스 처리
                if (event.logicalKey == LogicalKeyboardKey.backspace) {
                  if (controller.text.isEmpty && index > 0) {
                    // 현재 필드가 비어있고 첫 번째가 아니면 이전 필드로 이동
                    widget.focusNodes[index - 1].requestFocus();
                    widget.controllers[index - 1].clear();
                    return KeyEventResult.handled;
                  }
                }
                // 왼쪽 화살표: 무조건 이전 필드로 이동
                else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                  if (index > 0) {
                    widget.focusNodes[index - 1].requestFocus();
                    // 커서를 맨 끝으로
                    widget.controllers[index - 1].selection =
                        TextSelection.fromPosition(
                          TextPosition(
                            offset: widget.controllers[index - 1].text.length,
                          ),
                        );
                    return KeyEventResult.handled;
                  }
                }
                // 오른쪽 화살표: 무조건 다음 필드로 이동
                else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                  if (index < widget.controllers.length - 1) {
                    widget.focusNodes[index + 1].requestFocus();
                    // 커서를 맨 끝으로
                    widget.controllers[index + 1].selection =
                        TextSelection.fromPosition(
                          TextPosition(
                            offset: widget.controllers[index + 1].text.length,
                          ),
                        );
                    return KeyEventResult.handled;
                  }
                }
              }
              return KeyEventResult.ignored;
            },
            child: TextField(
              controller: widget.controllers[index],
              focusNode: widget.focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: widget.textStyle,
              decoration: InputDecoration(
                counterText: '', // maxLength 카운터 숨김
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: ref.theme.color.border,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: ref.theme.color.primary,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: ref.theme.color.border,
                    width: 1.5,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // 숫자만 입력
                LengthLimitingTextInputFormatter(1), // 1글자만
              ],
              onChanged: (value) {
                _onTextChanged(index, value);
              },
              onTap: () {
                // 탭할 때 커서를 맨 끝으로
                widget
                    .controllers[index]
                    .selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controllers[index].text.length),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
