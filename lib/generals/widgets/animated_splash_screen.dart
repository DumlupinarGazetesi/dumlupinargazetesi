import 'package:flutter/material.dart';
import 'package:alp_animated_splashscreen/src/dimensions.dart';
import 'package:alp_animated_splashscreen/src/textwidget.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedSplashScreen extends StatefulWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String logo;
  final String brandName;
  final Color brandNameColor;
  final String companyName;
  final Widget child; // Child widget to navigate to

  const AnimatedSplashScreen({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.logo,
    required this.brandName,
    this.brandNameColor = Colors.black,
    this.companyName = '',
    required this.child,
  });

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterAnimation();
  }

  void _navigateAfterAnimation() async {
    await Future.delayed(5.seconds); // Adjust delay to match animation length
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.child),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 130),
                    child: CircleAvatar(
                      backgroundColor: widget.foregroundColor,
                    )
                        .animate()
                        .slideY(begin: -0.5, end: 0.2, duration: 0.5.seconds)
                        .then(delay: 1.milliseconds)
                        .slideY(end: -0.3, duration: 0.5.seconds)
                        .then(delay: 1.milliseconds)
                        .slideY(end: 0.1, duration: 0.5.seconds)
                        .then(delay: 0.1.seconds)
                        .scaleXY(end: 20, duration: 2.seconds)
                        .then(delay: 2.seconds),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: Di.container115,
                        child: Image(image: AssetImage(widget.logo))
                            .animate()
                            .fadeIn(delay: 2.seconds, duration: 900.milliseconds)
                            .slideX(begin: 3, duration: 0.5.seconds),
                      ),
                      const SizedBox(height: 20),
                      buildtext(
                              text: widget.brandName,
                              fontsize: Di.fontSize18,
                              fontweight: FontWeight.bold,
                              fontcolor: widget.brandNameColor)
                          .animate()
                          .fadeIn(
                            delay: 3.seconds,
                            duration: 900.milliseconds,
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(children: [
              widget.companyName == ''
                  ? buildtext(text: '')
                  : buildtext(
                      text: 'Powered By',
                      fontsize: Di.smallPrintFontSize,
                      fontcolor: Colors.white,
                    ).animate().fadeIn(delay: 2.5.seconds, duration: 900.milliseconds),
              buildtext(
                text: widget.companyName,
                fontweight: FontWeight.bold,
                fontcolor: Colors.white,
              ).animate().fadeIn(delay: 2.5.seconds, duration: 900.milliseconds),
            ]),
          ),
        ],
      ),
    );
  }
}
