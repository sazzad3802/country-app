import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../values/app_colors.dart';

class CustomButton extends StatelessWidget {
  String text;
  Color bg;
  Color? textColor;
  Color borderColor;
  Color imageColor;
  Color progressbarColor;
  Function()? tap;
  double width;
  double height;
  double imageWidth;
  double imageHeight;
  bool isLoading;
  String image;
  EdgeInsets margin;
  double textSize;
  FontWeight fontWeight;
  AutoSizeGroup? myGroup;
  TextAlign textAlign;
  double elevation;
  double radius;

  CustomButton(
      {super.key,
      required this.text,
      required this.bg,
      this.textColor,
      this.borderColor = AppColor.textPrimaryColor,
      this.imageColor = AppColor.primary,
      this.progressbarColor = AppColor.white,
      required this.tap,
      required this.width,
      required this.height,
      this.isLoading = false,
      this.image = '',
      this.margin = const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      this.textSize = 22,
      this.fontWeight = FontWeight.bold,
      this.myGroup,
      this.textAlign = TextAlign.center,
      this.elevation = 2,
      this.radius = 5,
      this.imageHeight = 30,
      this.imageWidth = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      child: ElevatedButton(
          onPressed: isLoading ? () {} : tap,
          style: ElevatedButton.styleFrom(
              side: BorderSide(color: borderColor),
              backgroundColor: bg,
              elevation: elevation,
              padding: const EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))),
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: progressbarColor,
                    strokeWidth: 2,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (image.isNotEmpty) ...[
                      5.width,
                      SvgPicture.asset(image,
                          color: imageColor,
                          width: imageWidth,
                          height: imageHeight),
                      5.width,
                    ],
                    if (text.isNotEmpty) ...[
                      Expanded(
                        flex: 8,
                        child: AutoSizeText(
                          text.tr,
                          textAlign: textAlign,
                          group: myGroup,
                          style: TextStyle(
                              color: textColor,
                              fontSize: textSize,
                              fontWeight: fontWeight,
                              overflow: TextOverflow.ellipsis),
                        ),
                      )
                    ]
                  ],
                )),
    );
  }
}
