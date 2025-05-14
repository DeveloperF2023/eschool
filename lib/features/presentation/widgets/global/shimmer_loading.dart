part of 'widgets_imports.dart';

class CustomShimmer extends StatefulWidget {
  final Widget child;

  const CustomShimmer({required this.child});

  @override
  _CustomShimmerState createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300
              ],
              stops: const [0.1, 0.5, 0.9],
              begin: Alignment(-1.0 - 2 * _controller.value, 0),
              end: Alignment(1.0 + 2 * _controller.value, 0),
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
