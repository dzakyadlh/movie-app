import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/the_last_jedi.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: const Color.fromRGBO(0, 0, 0, 0.9),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Column(
                      children: [
                        Text(
                          "Watch movies anytime anywhere",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Explore a vast collection of blockbuster movies, timeless classics, and the latest releases.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                child: const Text("Login"),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                child: const Text("Sign Up"),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ImageSection extends StatelessWidget {
//   const ImageSection({super.key, required this.image});

//   final String image;

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       image,
//       fit: BoxFit.fitWidth,
//     );
//   }
// }
