import 'package:flutter/material.dart';

void main() => runApp(AnimatedSwitcherStar());

class AnimatedSwitcherStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedSwitcher',
      debugShowCheckedModeBanner: false,
      home: StarSwitcherPage(),
    );
  }
}

class StarSwitcherPage extends StatefulWidget {
  @override
  _StarSwitcherPageState createState() => _StarSwitcherPageState();
}

class _StarSwitcherPageState extends State<StarSwitcherPage> {
  bool showStar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF7FD), // Light lavender background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('AnimatedSwitcher'),
        centerTitle: false,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedSwitcher with a smoother fade + scale effect
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500), // Property 1: duration
              switchInCurve: Curves.easeInOut, // Property 3: switchInCurve
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                ); // smoother fade+scale animation
              }, // Property 2: transitionBuilder
              child: Icon(
                showStar ? Icons.star : Icons.favorite,
                key: ValueKey<bool>(showStar),
                color: showStar ? Colors.green : Colors.red,
                size: 180, // Increased size
              ),
            ),
            const SizedBox(height: 60), // More spacing below the icon
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showStar = !showStar;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF1EAFE),
                foregroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: StadiumBorder(),
              ),
              child: Text("Switch Widget"),
            ),
          ],
        ),
      ),
    );
  }
}
