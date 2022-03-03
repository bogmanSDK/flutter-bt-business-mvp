import 'package:bt_business/presentation/styling/dimension.dart';
import 'package:bt_business/presentation/styling/image.dart';
import 'package:bt_business/presentation/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BTHeader extends StatelessWidget {
  final String? title;
  final VoidCallback onBackPressed;

  const BTHeader({
    Key? key,
    this.title,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: BTDimensions.appBarHeight,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: BTDimensions.medium,
        ),
        child: InkWell(
          onTap: onBackPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                BTImages.back,
                color: Theme.of(context).splashColor,
                height: BTDimensions.medium,
                width: BTDimensions.medium,
              ),
              horizontalSpacing(BTDimensions.normal),
              Text(
                title ?? '',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
