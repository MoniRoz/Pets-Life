import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Avatar extends StatelessWidget {
  final String path;
  final double size;

  Avatar({@required this.path, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Hero(
        tag: path,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.all(Radius.circular(size / 2)),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: ClipOval(child: SvgPicture.asset(path)),
        ),
      ),
    );
  }
}
