import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 300,
                  child: CustomPaint(
                    painter: RPSCustomPainter(),
                  ),
                ),
              ),
              Expanded(
                child: Container(

                  height: 300,
                  child: CustomPaint(
                    painter: RCustomPainter(),
                  ),
                ),
              ),

            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage("assets/images/brid.png",
                ),
                fit: BoxFit.cover,
              )
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 300,
                  child: CustomPaint(
                    painter: RPSCustomPainter(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 300,
                  child: CustomPaint(
                    painter: RCustomPainter(),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}

// class LinePainter  extends CustomPainter{
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..strokeCap;
//     final path = Path();
//     path.moveTo(0, size.height*.8);
//     path.lineTo(0, size.height*.5);
//     path.lineTo(size.width*.2, size.height*.2);
//     path.lineTo(size.width*0.3, size.height*.4);
//     path.close();
//     canvas.drawPath(path, paint);
//
//
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return false;
//   }
// }
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 0, 89, 171)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * -0.0012500, size.height * 0.7940000);
    path0.lineTo(0, size.height * 0.5980000);
    path0.quadraticBezierTo(size.width * 0.7165625, size.height * 0.2480000,
        size.width * 0.8121875, size.height * 0.1930000);
    path0.cubicTo(
        size.width * 0.9216375,
        size.height * 0.1561200,
        size.width * 0.9792250,
        size.height * 0.2742600,
        size.width * 0.8468750,
        size.height * 0.3730000);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 0, 89, 171)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 1.0028125, size.height * 0.4720000);
    path0.lineTo(size.width * 1.0028125, size.height * 0.3965000);
    path0.quadraticBezierTo(size.width * 0.5538250, size.height * 0.3918800,
        size.width * 0.5515625, size.height * 0.7245000);
    path0.quadraticBezierTo(size.width * 0.6257000, size.height * 0.5157600,
        size.width * 1.0028125, size.height * 0.4720000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
