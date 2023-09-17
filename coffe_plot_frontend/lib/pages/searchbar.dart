import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('lib/svgs/searchbar.svg', width: 250, height: 60),
        Padding(
          padding: EdgeInsets.only(left: 37.0),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 16,
                fontFamily: 'GraphikLCG-Regular',
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
