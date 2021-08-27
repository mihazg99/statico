import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 140,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Statico",
                style: TextStyle(
                  color: Color(
                    0xff131829,
                  ),
                  fontSize: 46,
                  fontWeight: FontWeight.w500,
                  fontFamily: "IBM Plex Sans",
                  letterSpacing: 1.25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 100,),
            Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.black12),),)
          ],
        ),
      ),
    );
  }
}
