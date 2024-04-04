import 'package:flutter/material.dart';
import 'package:flutter_quizz/settings.dart' as settings;

class AnswerButton extends StatefulWidget {
  final bool isCorrect;
  final String answer;
  final Function processAnswer;

  const AnswerButton({
    super.key,
    required this.isCorrect,
    required this.answer,
    required this.processAnswer,
  });

  @override
  State<AnswerButton> createState() => _MyAnswerButtonState();
}

class _MyAnswerButtonState extends State<AnswerButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Color?> _fillColorAnimation;
  late Animation<Color?> _borderColorAnimation;
  late Animation<double?> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fillColorAnimation = ColorTween(begin: Colors.blue, end: Colors.green)
        .animate(_animController);
    _borderColorAnimation =
        ColorTween(begin: Colors.blue[100], end: Colors.green[100])
            .animate(_animController);

    _fadeAnimation = Tween<double>(begin: 1, end: 0.3).animate(_animController);

    _fillColorAnimation.addListener(() {
      setState(() {});
    });

    _fillColorAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.processAnswer(widget.isCorrect);
        _animController.reset();
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(settings.margin),
      child: GestureDetector(
        onTap: () {
          Color endColor;
          if (widget.isCorrect) {
            endColor = Colors.green;
          } else {
            endColor = Colors.red;
          }

          _fillColorAnimation = ColorTween(begin: Colors.blue, end: endColor)
              .animate(_animController);
          _borderColorAnimation =
              ColorTween(begin: Colors.blue[100], end: endColor)
                  .animate(_animController);

          _animController.forward();
        },
        child: AnimatedBuilder(
          animation: _animController,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value!,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: _fillColorAnimation.value,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1.0,
                    )
                  ],
                  border: Border.all(
                    color: _borderColorAnimation.value ??
                        Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: Opacity(
                  opacity: _fadeAnimation.value!,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: settings.buttonWidth * 0.5,
                      minWidth: settings.buttonWidth,
                      maxWidth: settings.buttonWidth,
                    ),
                    child: Center(
                      child: Text(
                        widget.answer,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
