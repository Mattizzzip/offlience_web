import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/core/feature_curves_painter.dart';
import 'package:offlience_website/features/hero/core/mouse_tracker.dart';
import 'package:offlience_website/features/hero/core/particle_simulation.dart';
import 'package:offlience_website/features/hero/widgets/blurred_background.dart';
import 'package:offlience_website/features/hero/widgets/discover_button.dart';
import 'package:offlience_website/features/hero/widgets/feature_point.dart';
import 'package:offlience_website/features/hero/widgets/hero_headline.dart';
import 'package:offlience_website/features/hero/widgets/particle_layer.dart';
import 'package:offlience_website/features/hero/widgets/photon_tracks.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key, this.onDiscoverMore});

  final VoidCallback? onDiscoverMore;

  @override
  State<HeroSection> createState() => HeroSectionState();
}

class HeroSectionState extends State<HeroSection> with TickerProviderStateMixin {
  late final AnimationController _particleController;
  late final AnimationController _photonController;
  final ParticleSimulation _simulation = ParticleSimulation();
  final MouseTracker _mouseTracker = MouseTracker();

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    _photonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat();
  }

  @override
  void dispose() {
    _particleController.dispose();
    _photonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isCompact = width < 720;
        final height = isCompact
            ? math.max(520.0, width * 1.15).clamp(520.0, 640.0)
            : math.max(580.0, width * 0.48).clamp(580.0, 720.0);
        final insetX = width * 0.14;
        final insetY = height * 0.2;

        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppColors.heroBorder),
            boxShadow: [
              BoxShadow(
                color: AppColors.midnight.withValues(alpha: 0.08),
                blurRadius: 48,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: MouseRegion(
            onHover: (event) {
              setState(() => _mouseTracker.track(event.localPosition));
            },
            onExit: (_) {
              setState(() => _mouseTracker.reset());
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                const BlurredBackground(),
                ParticleLayer(
                  size: Size(width, height),
                  simulation: _simulation,
                  mouseTracker: _mouseTracker,
                  controller: _particleController,
                ),
                if (!isCompact) ...[
                  Positioned.fill(
                    child: CustomPaint(
                      painter: FeatureCurvesPainter(
                        insetX: insetX,
                        insetY: insetY,
                      ),
                    ),
                  ),
                  Positioned(
                    top: insetY,
                    left: insetX,
                    child: const FeaturePoint(
                      title: 'On-Device AI',
                      subtitle: 'Local Inference',
                      alignRight: false,
                    ),
                  ),
                  Positioned(
                    bottom: insetY,
                    left: insetX,
                    child: const FeaturePoint(
                      title: 'Offline-First',
                      subtitle: 'Zero-Latency',
                      alignRight: false,
                    ),
                  ),
                  Positioned(
                    top: insetY,
                    right: insetX,
                    child: const FeaturePoint(
                      title: 'Smart Sync',
                      subtitle: 'Conflict-Free',
                      alignRight: true,
                    ),
                  ),
                  Positioned(
                    bottom: insetY,
                    right: insetX,
                    child: const FeaturePoint(
                      title: 'Secure Core',
                      subtitle: 'End-to-End',
                      alignRight: true,
                    ),
                  ),
                ],
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: isCompact ? 16 : 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HeroHeadline(isCompact: isCompact),
                        SizedBox(height: isCompact ? 24 : 32),
                        DiscoverButton(
                          onPressed: widget.onDiscoverMore ?? _noop,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: isCompact
                        ? 72
                        : MediaQuery.sizeOf(context).width * 0.15,
                    child: PhotonTracks(controller: _photonController),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void _noop() {}
}
