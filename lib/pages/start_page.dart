import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../animations/fade_animation.dart';
import 'home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });
    _animationController.forward().then(
          (_) => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const HomePage(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/starter-image.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FadeAnimation(
                    delay: .5,
                    child: Text(
                      'Taking Order for Faster Delivery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const FadeAnimation(
                    delay: 1,
                    child: Text(
                      'See restuarants nearby by \nadding location',
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.4,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  FadeAnimation(
                    delay: 1.2,
                    child: ScaleTransition(
                      scale: _animation,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.yellow,
                              Colors.orange,
                            ],
                          ),
                        ),
                        child: AnimatedOpacity(
                          opacity: _textVisible ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 50),
                          child: MaterialButton(
                            onPressed: _onTap,
                            minWidth: double.infinity,
                            child: const Text(
                              'Start',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    delay: 1.4,
                    child: AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 50),
                      child: const Align(
                        child: Text(
                          'Now Deliver To Your Door 24/7',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
