import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/features/home/data/model/section.dart';
import 'package:cis_logistics_app/features/home/presentation/widgets/instruction_card.dart';
import 'package:flutter/material.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({super.key});

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image.asset(
              Assets.cisLogo,
              height: context.setBasedOnScreenHeight(0.1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Logistics instructions',
                style: AppTextStyles.bold24,
                textAlign: TextAlign.center,
              ),
            ),
            ...allSections.map(
              (section) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InstructionCard(section: section),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
