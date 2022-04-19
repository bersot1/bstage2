import 'package:bstage2/ui/themes/theme.dart';
import 'package:flutter/material.dart';

/// ----------------------------------------------
/// [Bstage Colors]
/// ----------------------------------------------
const Color orangeColor = Color(0xFFFF6130);
const Color orangeDarkColor = Color(0xFFb24321);
const Color orangeLightColor = Color(0xFFFF8B37);
const Color whiteColor = Color(0xFFffffff);
const Color lightColor = Color(0xFFf1f1f1);
const Color lightSoftColor = Color(0xFFf0f0f0);
const Color blackColor = Color(0xFF323232);
const Color darkColor = Color(0xFF181818);
const Color successColor = Color(0xFF10dc60);
const Color warningColor = Color(0xFFffce00);
const Color dangerColor = Color(0xFFf04141);
const Color mediumColor = Color(0xFF989aa2);

const Color brownColor = Color(0xFFFFC517);
const Color brownDarkColor = Color(0xFFFF9724);
final Color searchFieldColor = const Color(0xFFE4E7EE).withOpacity(0.5);

/// ----------------------------------------------
/// [Bstage Fonts]
/// ----------------------------------------------
const fontBstage = 'Lato-Regular';
const fontBold = 'Lato-Bold';
const fontLight = 'Lato-Light';

/// ----------------------------------------------
/// [Bstage Neo Style]
/// ----------------------------------------------
final Color kBackgroundColour = const Color(0xffEF3403).withOpacity(.7);
// kBackgroundWhite = Color(0xffEFEEEE);
const Color kOrange = Color(0xffEE8630);
const Color kDarkShadow = Color(0xffbf2902);
// kDarkShadow_forOrange =  #d72e02 | #bf2902 | #a72402 | #8f1f01
// kDarkShadow1 = Color(0xffD8D5D0);
const Color kDarkBackgroundColour = Color(0xff262626);
const Color kDarkBackgroundShadowColour = Color(0xff1E1E1E);
const Color kOutline = Color(0xff2E2E2E);

Offset offMin = -Offset(5, 5), offMax = Offset(4.5, 4.5);
final outerShadow = BoxDecoration(
  border: Border.all(color: Colors.transparent),
  color: kBackgroundColour,
  borderRadius: BorderRadius.circular(80),
  boxShadow: [BoxShadow(blurRadius: 15, offset: offMin, color: whiteColor), BoxShadow(blurRadius: 15, offset: offMax, color: kDarkShadow)],
);

BoxDecoration imageOuterShadow(Color color) => BoxDecoration(
      border: Border.all(color: Colors.transparent),
      color: color,
      borderRadius: BorderRadius.circular(0),
      boxShadow: [
        BoxShadow(blurRadius: 15, offset: offMin, color: kDarkBackgroundColour),
        BoxShadow(
          blurRadius: 15,
          offset: offMax,
          color: kDarkBackgroundColour,
        )
      ],
      gradient: LinearGradient(
        colors: const [
          Colors.transparent,
          orangeDarkColor,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
      // gradient: LinearGradient(
      //   begin: Alignment.topRight,
      //   end: Alignment.bottomLeft,
      //   colors: [
      //     Color(0xFFFF559F),
      //     Color(0xFFCF5CCF),
      //     Color(0xFFFF57AC),
      //     Color(0xFFFF6D91),
      //     Color(0xFFFF8D7E),
      //     Color(0xFFB6BAA6),
      //   ],
      //   stops: [0.05, 0.3, 0.5, 0.55, 0.8, 1],
      // ),
    );

final darkNeumorphicTheme = BstageNeumorphicTheme(
  innerShadowColors: [kDarkBackgroundShadowColour, kOutline],
  borderColor: kOutline,
  buttonColor: kDarkBackgroundColour,
  outerShadow: kDarkBackgroundShadow,
  isDark: true,
);

final lightNeumorphicTheme = BstageNeumorphicTheme(
  innerShadowColors: [kDarkShadow, whiteColor],
  borderColor: Colors.transparent,
  buttonColor: kBackgroundColour,
  outerShadow: kShadow,
);

final kShadow = [
  BoxShadow(blurRadius: 15, offset: -Offset(5, 5), color: whiteColor),
  BoxShadow(blurRadius: 15, offset: Offset(4.5, 4.5), color: kDarkShadow)
];

final kDarkBackgroundShadow = [BoxShadow(blurRadius: 15, offset: Offset(4.5, 4.5), color: Color(0xff1E1E1E))];

/// ----------------------------------------------
/// [Bstage Styled Widgets]
/// ----------------------------------------------
final AutomaticNotchedShape tabsShape = AutomaticNotchedShape(
  RoundedRectangleBorder(
    side: BorderSide(),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(35.0),
      topRight: Radius.circular(35.0),
    ),
  ),
  StadiumBorder(side: BorderSide()),
);

final BoxDecoration testTabsBox = BoxDecoration(
  color: whiteColor,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(35.0),
    topRight: Radius.circular(35.0),
  ),
  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2))],
);

final BoxDecoration kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2))],
);

final valeHeader = Container(
  height: 60.0,
  padding: EdgeInsets.all(16), // EdgeInsets.only(left: 15.0, right: 15.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.person),
        color: Colors.blue,
      ),
      SizedBox(height: 40.0, width: 40.0),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.settings),
        color: orangeColor,
      ),
    ],
  ),
);

final BoxDecoration decListCards = BoxDecoration(
  gradient: linearGrad,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10.0),
    topRight: Radius.circular(10.0),
  ),
);

final LinearGradient linearGrad = LinearGradient(
  colors: const [whiteColor, orangeColor],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final BorderRadius boxRadius50 = BorderRadius.only(
  topLeft: Radius.circular(50.0),
  topRight: Radius.circular(50.0),
  bottomLeft: Radius.circular(50.0),
  bottomRight: Radius.circular(50.0),
);

final LinearGradient gradientLinear = LinearGradient(
  colors: const [Colors.blue, Colors.white],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final BoxDecoration testDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('icons/pngs/bstagepng-icon-orange-circle.png'),
    fit: BoxFit.cover,
  ),
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(100.0),
    bottomRight: Radius.circular(100.0),
  ),
);

final BoxDecoration categoriesBox = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  color: orangeColor,
  boxShadow: [
    BoxShadow(
      color: Color(0xFF333333).withOpacity(1),
      offset: const Offset(0.0, 0.0),
    ),
    BoxShadow(
      color: Color(0xFF333333).withOpacity(0.8),
      offset: const Offset(0.0, 0.0),
      spreadRadius: -12.0,
      blurRadius: 12.0,
    ),
  ],
);

final BoxDecoration boxButtonBar = BoxDecoration(
  color: Colors.transparent,
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      color: Color(0xFFFFFFF).withOpacity(.6),
      offset: const Offset(0.0, 0.0),
      blurRadius: 2,
    ),
  ],
);

final BoxDecoration searchBox = BoxDecoration(
  borderRadius: BorderRadius.circular(30.0),
  color: searchFieldColor,
  boxShadow: [
    // BoxShadow(
    //   color: Color(0xFF333333).withOpacity(1),
    //   offset: const Offset(0.0, 0.0)
    // ),
    BoxShadow(
      color: const Color(0xFF333333).withOpacity(0.8),
      offset: const Offset(0.0, 0.0),
      spreadRadius: -12.0,
      blurRadius: 12.0,
    ),
  ],
);

final BorderRadius border30 = BorderRadius.all(Radius.circular(30.0));

final BoxDecoration userBoxDetails = BoxDecoration(
  borderRadius: BorderRadius.circular(40),
  gradient: LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: const [orangeColor, orangeLightColor],
  ),
);

// -----------------------------------------------------------------------
//    BACKGROUNDS
// -----------------------------------------------------------------------
final BoxDecoration categoriesListDecoration = BoxDecoration(
  // color: Colors.transparent,
  borderRadius: BorderRadius.circular(20.0),
  boxShadow: [
    BoxShadow(
      blurRadius: 55,
      offset: const Offset(0.0, 15.0),
      color: const Color(0xFF9DA3B4).withOpacity(0.16),
    )
  ],
);

final BoxDecoration backgroundLogin = BoxDecoration(
  image: DecorationImage(
    image: const AssetImage("assets/images/backgrounds/eventInit.jpg"),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(darkColor.withOpacity(0.6), BlendMode.darken),
  ),
);

final BoxDecoration backgroundOrange = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: const [
      orangeColor,
      orangeDarkColor,
    ],
  ),
);

final BoxDecoration backgroundCreateAccount = BoxDecoration(
  image: DecorationImage(
    colorFilter: ColorFilter.mode(
      blackColor.withOpacity(0.5),
      BlendMode.darken,
    ),
    image: const AssetImage("assets/images/backgrounds/eventInit.jpg"),
    fit: BoxFit.cover,
  ),
);

final BoxDecoration backgroundWelcome = BoxDecoration(
  image: DecorationImage(
    colorFilter: ColorFilter.mode(
      blackColor.withOpacity(0.5),
      BlendMode.darken,
    ),
    image: AssetImage("assets/images/backgrounds/bg-welcome.jpg"),
    fit: BoxFit.cover,
  ),
);

final BoxDecoration backgroundResetPassword = BoxDecoration(
  image: DecorationImage(
    colorFilter: ColorFilter.mode(
      blackColor.withOpacity(0.5),
      BlendMode.darken,
    ),
    image: AssetImage("assets/images/backgrounds/bg-resetpass.jpg"),
    fit: BoxFit.cover,
  ),
);
