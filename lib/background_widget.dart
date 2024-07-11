import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  
  const BackgroundWidget({required this.child, super.key});
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://asset.kompas.com/crops/gRvGc7fhVZhqlWG1wVdwNGRfF1E=/0x0:1650x1100/750x500/data/photo/2022/11/01/6360a637c9906.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.5), // Overlay gelap dengan opacity 0.5
        ),
        child,
      ],
    );
  }
}
