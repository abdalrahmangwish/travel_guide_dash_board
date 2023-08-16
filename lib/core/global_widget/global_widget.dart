import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.type,
    required this.prefix,
    required this.controllerName,
    required this.label,
    required this.validate,
    required this.width,
  });
  final Function validate;
  final String label;
  final Icon prefix;
  final double width;
  final TextEditingController controllerName;
  final TextInputType type;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: width,
      child: TextFormField(
        controller: controllerName,
        keyboardType: type,
        validator: (val) {
          return validate(val);
        },
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          prefixIcon: prefix,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottom extends StatelessWidget {
  final Color buttonColor;
  final double? height;
  final double? width;
  final String text;
  final Function onPress;
  final Color borderColor;
  final TextStyle textStyleForButton;
  const CustomBottom({
    super.key,
    required this.text,
    this.width,
    this.height,
    required this.buttonColor,
    required this.onPress,
    required this.borderColor,
    required this.textStyleForButton,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPress();
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: textStyleForButton,
              )),
        ));
  }
}

class DrawerListTitle extends StatelessWidget {
  const DrawerListTitle({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        weight: 16,
      ),
      title: Text(title),
    );
  }
}

class BlockCustomBottom extends StatelessWidget {
  final double height;
  final double? width;
  final String text;
  final Function onPress;
  final Color borderColor;
  final TextStyle textStyleForButton;
  final Color color;
  const BlockCustomBottom({
    super.key,
    required this.text,
    required this.height,
    this.width,
    required this.onPress,
    required this.borderColor,
    required this.textStyleForButton,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: () {
          onPress();
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 0),
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
              child: Text(
            text,
            style: textStyleForButton,
          )),
        ));
  }
}

class NewCustomBottom extends StatelessWidget {
  final double height;
  final double? width;
  final String text;
  final Function onPress;
  final Color borderColor;
  final TextStyle textStyleForButton;
  const NewCustomBottom({
    super.key,
    required this.text,
    required this.height,
    this.width,
    required this.onPress,
    required this.borderColor,
    required this.textStyleForButton,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: () {
          onPress();
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 0),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.lightBlueAccent,
                Colors.blueAccent,
              ],
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
              child: Text(
            text,
            style: textStyleForButton,
          )),
        ));
  }
}

class CustomAddTextField extends StatelessWidget {
  const CustomAddTextField({
    super.key,
    required this.type,
    required this.color,
    required this.controllerName,
    required this.label,
    required this.valedate,
  });
  final Color color;
  final Function valedate;
  final String label;
  final TextEditingController controllerName;
  final TextInputType type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: StylesText.newDefaultTextStyle.copyWith(color: Colors.black),
      cursorColor: Colors.blue,
      controller: controllerName,
      keyboardType: type,
      validator: (val) {
        return valedate(val);
      },
      decoration: InputDecoration(
        errorStyle: StylesText.newDefaultTextStyle.copyWith(color: Colors.red),
        filled: true,
        hintText: label,
        border: InputBorder.none,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black38,
            width: 0,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 0,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 0,
          ),
        ),
        hintStyle: StylesText.newDefaultTextStyle.copyWith(color: Colors.grey),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black38,
            width: 1,
          ),
        ),
      ),
    );
  }
}

class CustomDescriptionTextField extends StatelessWidget {
  const CustomDescriptionTextField({
    super.key,
    required this.type,
    required this.color,
    required this.controllerName,
    required this.label,
    required this.valedate,
  });
  final Color color;
  final Function valedate;
  final String label;
  final TextEditingController controllerName;
  final TextInputType type;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TextFormField(
        style: StylesText.newDefaultTextStyle.copyWith(color: Colors.black),

        expands: true,
        maxLines: null,
        textAlignVertical:
            TextAlignVertical.top, // Set the vertical alignment to top
        cursorColor: Colors.blue,
        controller: controllerName,
        keyboardType: type,
        validator: (val) {
          return valedate(val);
        },
        decoration: InputDecoration(
          errorStyle:
              StylesText.newDefaultTextStyle.copyWith(color: Colors.red),
          filled: true,
          hintText: label,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black38,
              width: 0,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 0,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 0,
            ),
          ),
          hintStyle:
              StylesText.newDefaultTextStyle.copyWith(color: Colors.grey),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black38,
              width: 1,
            ),
          ),
        ),
        cursorHeight: 24.0, // Set the desired cursor height
      ),
    );
  }
}

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 90.h),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: const SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              BannerPlaceholder(),
              TitlePlaceholder(width: double.infinity),
              SizedBox(height: 16.0),
              ContentPlaceholder(
                lineType: ContentLineType.threeLines,
              ),
              SizedBox(height: 16.0),
              TitlePlaceholder(width: 200.0),
              SizedBox(height: 16.0),
              ContentPlaceholder(
                lineType: ContentLineType.twoLines,
              ),
              SizedBox(height: 16.0),
              TitlePlaceholder(width: 200.0),
              SizedBox(height: 16.0),
              ContentPlaceholder(
                lineType: ContentLineType.twoLines,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BannerPlaceholder extends StatelessWidget {
  const BannerPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
    );
  }
}

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 12.0,
            color: Colors.white,
          ),
          const SizedBox(height: 8.0),
          Container(
            width: width,
            height: 12.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;

  const ContentPlaceholder({
    Key? key,
    required this.lineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 96.0,
            height: 72.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                if (lineType == ContentLineType.threeLines)
                  Container(
                    width: double.infinity,
                    height: 10.0,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                Container(
                  width: 100.0,
                  height: 10.0,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
