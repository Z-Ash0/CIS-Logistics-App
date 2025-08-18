import 'package:cis_logistics_app/features/home/data/model/section.dart';
import 'package:flutter/material.dart';

class InstructionCard extends StatefulWidget {
  const InstructionCard({super.key, required this.section});
  final Section section;

  @override
  State<InstructionCard> createState() => _InstructionCardState();
}

class _InstructionCardState extends State<InstructionCard>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool _expanded = false;
  late AnimationController _animationController;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = _animationController.drive(
      CurveTween(curve: Curves.easeInOut),
    );
    if (_expanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _expanded = !_expanded;
    });
    if (_expanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final s = widget.section;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: _handleTap,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: s.color.withValues(alpha: .12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Icon(s.icon, color: s.color),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        s.title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    AnimatedRotation(
                      turns: _expanded ? 0.0 : 0.5,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.expand_less),
                    ),
                  ],
                ),
              ),
            ),
            SizeTransition(
              sizeFactor: _heightFactor,
              axisAlignment: -1.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: _buildBulletList(
                  context,
                  items: s.items,
                  color: s.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Column _buildBulletList(
  BuildContext context, {
  required List<String> items,
  required Color color,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      for (int i = 0; i < items.length; i++) ...[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• ', style: TextStyle(height: 1.4, color: color)),
            Expanded(
              child: Text(
                items[i],
                textAlign: TextAlign.start,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(height: 1.4),
              ),
            ),
          ],
        ),
        if (i < items.length - 1) const SizedBox(height: 8),
      ],
    ],
  );
}
