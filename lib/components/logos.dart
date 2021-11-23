import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logos extends StatelessWidget {
  final String logo;
  const Logos({Key? key, this.logo = "valorant.svg"}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset(
      "assets/logos/$logo",
      semanticsLabel: 'Logo',
      width: 20,
    );
    return svg;
  }
}
