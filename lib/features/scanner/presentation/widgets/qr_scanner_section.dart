import 'dart:math' as math;
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/features/scanner/presentation/manager/register_event_cubit.dart';
import 'package:cis_logistics_app/features/scanner/presentation/manager/register_event_states.dart';
import 'package:cis_logistics_app/features/scanner/presentation/utils/scanner_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerSection extends StatefulWidget {
  const QRScannerSection({super.key, required this.controller});

  final MobileScannerController controller;

  @override
  State<QRScannerSection> createState() => _QRScannerSectionState();
}

class _QRScannerSectionState extends State<QRScannerSection> {
  bool _isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterEventCubit, RegisterEventStates>(
      listener: _handleBlocState,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _buildModrekBackground(),
            _buildScanner(),
            _buildFlashButton(),
            BlocBuilder<RegisterEventCubit, RegisterEventStates>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => _buildLoadingOverlay(),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModrekBackground() {
    return Positioned(
      right: -40,
      top: -90,
      child: Transform.rotate(
        angle: math.pi / 8,
        child: Image.asset(Assets.modrekWelcome, height: 128),
      ),
    );
  }

  Widget _buildScanner() {
    final double width = context.setBasedOnScreenWidth(0.6);
    final double height = context.setBasedOnScreenHeight(0.4);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightGreen, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: MobileScanner(
          controller: widget.controller,
          onDetect: _handleQRScan,
        ),
      ),
    );
  }

  Widget _buildFlashButton() {
    return Positioned(
      right: 16,
      top: 16,
      child: BlocBuilder<RegisterEventCubit, RegisterEventStates>(
        builder: (context, state) {
          final isProcessing = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(25),
            ),
            child: IconButton(
              onPressed: isProcessing ? null : _toggleFlash,
              icon: Icon(
                _isFlashOn ? Icons.flash_on : Icons.flash_off,
                color: _isFlashOn ? AppColors.lightGreen : Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: AppColors.lightGreen),
              SizedBox(height: 16),
              Text(
                'Processing QR Code...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleFlash() {
    setState(() => _isFlashOn = !_isFlashOn);
    widget.controller.toggleTorch().catchError((_) {
      if (mounted) setState(() => _isFlashOn = !_isFlashOn);
    });
  }

  void _handleQRScan(BarcodeCapture capture) {
    final code = capture.barcodes.firstOrNull?.rawValue;
    if (code?.isEmpty ?? true) return;

    ScannerHandler.handleScanResult(
      context,
      code!,
      () => context.read<RegisterEventCubit>().registerEvent(code),
    );
  }

  void _handleBlocState(BuildContext context, RegisterEventStates state) {
    state.when(
      initial: () {},
      loading: () {},
      success: (response) => _handleSuccess(response.message),
      failure: (error) => _handleError(error),
    );
  }

  void _handleSuccess(String message) {
    ScannerHandler.handleSuccess(context, message, () {
      if (mounted) {
        context.read<RegisterEventCubit>().reset();
      }
    });
  }

  void _handleError(String error) {
    ScannerHandler.handleError(context, error, () {
      if (mounted) {
        context.read<RegisterEventCubit>().reset();
      }
    });
  }
}
