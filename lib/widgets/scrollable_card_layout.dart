import 'package:flutter/material.dart';

class ScrollableCardLayout extends StatelessWidget {
  static const double _sidePadding = 15.0;
  static const double _bottomPadding = 20.0;
  static const double _topBorderRadius = 20.0;

  final double primaryChildHeight;
  final Widget primaryWidget;
  final Widget secondaryWidget;
  final double gapScreenPercentage;

  const ScrollableCardLayout({
    @required this.primaryChildHeight,
    @required this.primaryWidget,
    @required this.gapScreenPercentage,
    this.secondaryWidget,
    Key key,
  })  : assert(
          gapScreenPercentage >= 0 && gapScreenPercentage <= 1,
          "gapScreenPercentage must be in range [0,1]",
        ),
        super(key: key);

  double _getTopPadding(BuildContext context) {
    try {
      final scaffold = Scaffold.of(context);
      return scaffold.hasAppBar ? scaffold.appBarMaxHeight : 0.0;
    } catch (_) {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double gapScreen = size.height * gapScreenPercentage;
    final double availableHeight = size.height - _getTopPadding(context);

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: size.width,
            minHeight: availableHeight,
          ),
          child: Container(
            margin: EdgeInsets.only(top: gapScreen),
            padding: EdgeInsets.only(
              bottom: _bottomPadding,
              left: _sidePadding,
              right: _sidePadding,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_topBorderRadius),
                topRight: Radius.circular(_topBorderRadius),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -primaryChildHeight / 2,
                  width: size.width - 2 * _sidePadding,
                  height: primaryChildHeight,
                  child: primaryWidget,
                ),
                Padding(
                  padding: EdgeInsets.only(top: primaryChildHeight / 2),
                  child: secondaryWidget != null ? secondaryWidget : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
