import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/features/home/presentation/widgets/qr_scanner_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  late MobileScannerController scanController;
  bool isScanning = false;
  bool isInitialized = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeController();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopScanner();
    scanController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        if (isInitialized) {
          _startScanner();
        }
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        _stopScanner();
        break;
    }
  }

  void _initializeController() {
    scanController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
      detectionSpeed: DetectionSpeed.noDuplicates,
      returnImage: false,
    );
    isInitialized = true;
  }

  void startScanner() => _startScanner();
  void stopScanner() => _stopScanner();

  void _startScanner() {
    if (!isScanning && mounted && isInitialized) {
      try {
        scanController.start();
        setState(() {
          isScanning = true;
        });
      } catch (e) {
        print('Error starting scanner: $e');
      }
    }
  }

  void _stopScanner() {
    if (isScanning && mounted) {
      try {
        scanController.stop();
        setState(() {
          isScanning = false;
        });
      } catch (e) {
        print('Error stopping scanner: $e');
      }
    }
  }

  void _onDetect(BarcodeCapture result) {
    final String code = result.barcodes.first.rawValue ?? '';
    if (code.isNotEmpty) {
      // Temporarily stop scanning to prevent multiple detections
      _stopScanner();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Scanned Code: $code'),
          duration: const Duration(seconds: 2),
        ),
      );

      // Restart scanning after a delay
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          _startScanner();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Container(
          width: context.screenWidth,
          padding: const EdgeInsets.all(16.0),
          color: AppColors.lightGreen,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Scan a QR Code',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                },
                child: const Icon(
                  CupertinoIcons.question_circle_fill,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),

        // Scanner Area
        Expanded(
          child: QRScannerSection(
            isScanning: isScanning,
            scanController: scanController,
            onDetect: _onDetect,
            startScanner: startScanner,
            stopScanner: stopScanner,
          ),
        ),
      ],
    );
  }
}
