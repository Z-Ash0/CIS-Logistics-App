import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/confirmation_code_bloc_consumer.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/confirmation_code_header.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/otp_text_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmationCodeView extends StatefulWidget {
  final String email;

  const ConfirmationCodeView({super.key, required this.email});

  @override
  State<ConfirmationCodeView> createState() => _ConfirmationCodeViewState();
}

class _ConfirmationCodeViewState extends State<ConfirmationCodeView> {
  static const int _otpLength = 6;

  final List<TextEditingController> _controllers = List.generate(
    _otpLength,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    _otpLength,
    (_) => FocusNode(),
  );

  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes.first.requestFocus();
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged(int index, String value) {
    _clearErrors();

    if (value.length > 1) {
      _handlePaste(value);
    } else if (value.isNotEmpty) {
      _controllers[index].text = value;
      if (index < _otpLength - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
  }

  void _handlePaste(String pastedText) {
    final digits = pastedText.replaceAll(RegExp(r'\D'), '');

    for (final controller in _controllers) {
      controller.clear();
    }

    for (int i = 0; i < digits.length && i < _otpLength; i++) {
      _controllers[i].text = digits[i];
    }

    final nextFocusIndex = digits.length < _otpLength
        ? digits.length
        : _otpLength - 1;
    if (nextFocusIndex < _otpLength) {
      _focusNodes[nextFocusIndex].requestFocus();
    } else {
      _focusNodes[nextFocusIndex].unfocus();
    }
  }

  void _onKeyPressed(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_controllers[index].text.isEmpty && index > 0) {
        _controllers[index - 1].clear();
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

  void _clearErrors() {
    if (_hasError) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
    }
  }

  bool _validateOtp() {
    final isEmpty = _controllers.any((controller) => controller.text.isEmpty);
    if (isEmpty) {
      setState(() {
        _hasError = true;
        _errorMessage = AppStrings.pleaseEnterAllDigits;
      });
      return false;
    }
    return true;
  }

  String _getCompleteOtp() {
    return _controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              _buildBackButton(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.screenHeight * 0.07,
                ),
                child: ConfirmationCodeHeader(),
              ),
              OtpTextBoxes(
                controllers: _controllers,
                focusNodes: _focusNodes,
                onChanged: _onCodeChanged,
                onKeyPressed: _onKeyPressed,
                hasError: _hasError,
                errorMessage: _errorMessage,
              ),
              verticalSpaceScreen(context, 0.05),
              ConfirmationCodeBlocConsumer(
                otpIsValidated: _validateOtp(),
                otpCode: _getCompleteOtp(),
                email: widget.email,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.arrow_back, size: 24, color: AppColors.black),
      ),
    );
  }
}
