import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon});
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
height: 45,
width: 45,
decoration:BoxDecoration(
color: Colors.white.withAlpha(25),
  borderRadius: BorderRadius.circular(16)
),
child: Center(
  child: IconButton(onPressed: (){},icon: Icon( icon,color: Colors.white,size: 28,) ),
),
    );
  }
}