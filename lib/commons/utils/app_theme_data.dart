import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class AppThemeData {
  static const String apiKey = "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";
  static const String doFinderKey = "c5456aca633a8844ba2b7d5b94533def56b503b8";

  static const appNameTextStyle = TextStyle(
      color: ColorName.cardinal, //Color(0xFFFFFFFF),
      fontWeight: FontWeight.w500, //"Poppins Medium",
      fontSize: 22);

  static const unselectedLabelStyle = TextStyle(
      color: ColorName.gray410, fontWeight: FontWeight.w500, fontSize: 12);

  static const selectedLabelStyle = TextStyle(
      color: ColorName.white, fontWeight: FontWeight.w500, fontSize: 12);

  static const headTextStyle = TextStyle(
      color: ColorName.black, fontWeight: FontWeight.w700, fontSize: 24);

  static const primaryBtnTextStyle = TextStyle(
      color: ColorName.black, fontWeight: FontWeight.w600, fontSize: 18);

  static const hintTextStyle = TextStyle(
      color: ColorName.black, fontWeight: FontWeight.w400, fontSize: 16);

  static final actualPriceTextStyle = GoogleFonts.roboto(
      decoration: TextDecoration.lineThrough,
      color: ColorName.gray,
      fontWeight: FontWeight.w600,
      fontSize: 14);

  static const profileTextStyle = TextStyle(
      color: ColorName.black, fontWeight: FontWeight.w400, fontSize: 16);
  static const searchBarHintTxt = TextStyle(
      color: ColorName.silver, fontWeight: FontWeight.w400, fontSize: 16);

  static const shopByCategoryTxtStl = TextStyle(
      color: ColorName.cardinal, fontWeight: FontWeight.w600, fontSize: 18);

  static const shopCategoryTitleStl = TextStyle(
      fontFamily: "SF Pro Rounded",
      color: ColorName.cardinal,
      fontWeight: FontWeight.w500,
      fontSize: 16);

  // SF PRO 400 FONT 12
  static const sf400Font12 = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Rounded',
      fontSize: 13,
      color: ColorName.black);

  // SF PRO 500 FONT 12
  static const sf500Font12 = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'SF Pro Rounded',
      fontSize: 13,
      color: ColorName.black);

  // SF PRO 400 FONT 12 white
  static const sf400Font12White = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      fontFamily: 'SF Pro Rounded',
      color: ColorName.white);

  static const sf400Font15White = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      fontFamily: 'SF Pro Rounded',
      color: ColorName.white);

  static const sf500Font16White = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontFamily: 'SF Pro Rounded',
      color: ColorName.white);

  // SF PRO 400 FONT 12
  static const sf500Font12Red = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'SF Pro Rounded',
      fontSize: 12,
      color: ColorName.cardinal);

  // SF PRO 500 FONT 16
  static const sf500Font16 = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'SF Pro Rounded',
      fontSize: 16,
      color: ColorName.cardinal);

  // SF PRO 500 FONT 16
  static const sf500Font16Gray = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'SF Pro Rounded',
      fontSize: 16,
      color: ColorName.gray);

  // SF PRO 500 FONT 16
  static const sf600Font16Gray = TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'SF Pro Rounded',
      fontSize: 16,
      color: ColorName.gray);

  static const sf400Font15Gray = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Rounded',
      fontSize: 15,
      color: ColorName.gray);

  static const sf400Font14Gray = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Rounded',
      fontSize: 14,
      color: ColorName.gray);

  // SF PRO 500 FONT 16 BLACK
  static const sf500Font16Black = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'SF Pro Rounded',
      fontSize: 16,
      color: ColorName.black);

  static const sf500Font14Black = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'SF Pro Rounded',
      fontSize: 14,
      color: ColorName.black);

  static final discountTextStyle = GoogleFonts.roboto(
      color: ColorName.white, fontWeight: FontWeight.w600, fontSize: 10);

  static final productPriceStyle = GoogleFonts.roboto(
      color: ColorName.cardinal, fontWeight: FontWeight.w600, fontSize: 16);

  static final appBarTextStyle = GoogleFonts.playfairDisplay(
      color: ColorName.cardinal, fontWeight: FontWeight.w400, fontSize: 18);
  static const subCategoryItems = TextStyle(
      color: ColorName.silver, fontWeight: FontWeight.w400, fontSize: 16);

  static final productTitleTextStyle = GoogleFonts.roboto(
    color: ColorName.black,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  static const addToCartTextStyle = TextStyle(
      color: ColorName.white, fontWeight: FontWeight.w700, fontSize: 15);

  static const weight400Font15 = TextStyle(
      color: ColorName.gray, fontWeight: FontWeight.w400, fontSize: 15);

  static final productDescription = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w400, fontSize: 16);

  static const font12Weight400 = TextStyle(
      color: ColorName.emperor, fontWeight: FontWeight.w400, fontSize: 12);

  static final selectSizeStyle = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w600, fontSize: 16);

  static final capecitySelectTextStyle = GoogleFonts.roboto(
      color: ColorName.white, fontWeight: FontWeight.w400, fontSize: 16);

  static final font14Weight400 = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w400, fontSize: 14);

  static final font16Weight600Playfair = GoogleFonts.playfairDisplay(
      color: ColorName.black, fontWeight: FontWeight.w600, fontSize: 16);

  static final font14Weight700 = GoogleFonts.roboto(
      color: ColorName.white, fontWeight: FontWeight.w700, fontSize: 14);

  static final font16Weight400 = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w400, fontSize: 16);

  static final font12Weight700 = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w700, fontSize: 12);

  // SF 400 FONT 12
  static const sf400Font12Black = TextStyle(
      color: ColorName.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Rounded');

  // SF 400 FONT 12
  static final sf400Font16Black = TextStyle(
      color: ColorName.black.withOpacity(0.6),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF Pro Rounded');

  // SF 500 FONT 18
  static const sf500Font18Black = TextStyle(
      color: ColorName.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF Pro Rounded');

  static final homeActualPrice = GoogleFonts.roboto(
      color: ColorName.cardinal, fontWeight: FontWeight.w700, fontSize: 12);

  // SF 500 FONT 12
  static const sf500Font12Black = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'SF Pro Rounded',
      fontSize: 12,
      color: ColorName.gray);

  static final homeDescPrice = GoogleFonts.roboto(
      decoration: TextDecoration.lineThrough,
      color: ColorName.gray,
      fontWeight: FontWeight.w700,
      fontSize: 12);

  static final loginButton = GoogleFonts.roboto(
      color: ColorName.white, fontWeight: FontWeight.w600, fontSize: 14);

  static final font14Weight400Gray = GoogleFonts.roboto(
      color: ColorName.gray, fontWeight: FontWeight.w400, fontSize: 14);

  static final font12Weight400Gray = GoogleFonts.roboto(
      color: ColorName.gray, fontWeight: FontWeight.w400, fontSize: 12);
  static final font12Weight400Jewel = GoogleFonts.roboto(
      color: ColorName.jewel, fontWeight: FontWeight.w400, fontSize: 12);
  static final font12Weight400Cardinal = GoogleFonts.roboto(
      color: ColorName.cardinal, fontWeight: FontWeight.w400, fontSize: 12);

  static final font14Weight600Cardinal = GoogleFonts.roboto(
      color: ColorName.cardinal, fontWeight: FontWeight.w600, fontSize: 14);
  static final font14Weight600Black = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w600, fontSize: 14);
  static final font14Weight600GrayUnderline = GoogleFonts.roboto(
      decoration: TextDecoration.underline,
      color: ColorName.gray,
      fontWeight: FontWeight.w600,
      fontSize: 14);
  static final font12Weight400Black = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w400, fontSize: 12);
  static final font12Weight400green = GoogleFonts.roboto(
      color: Color(0XFF2D8424), fontWeight: FontWeight.w400, fontSize: 12);

  // FONT 12 GRAY 400
  static const font12Gray400 = TextStyle(
      color: ColorName.gray,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: "SF Pro Rounded");

  static final font14Weight600Gray = GoogleFonts.roboto(
      color: ColorName.gray, fontWeight: FontWeight.w600, fontSize: 14);

  static final font14Weight600Jewel = GoogleFonts.roboto(
      color: ColorName.jewel, fontWeight: FontWeight.w600, fontSize: 14);

  static final font16Weight400PlayfairDisplay = GoogleFonts.playfairDisplay(
      color: ColorName.black, fontWeight: FontWeight.w400, fontSize: 16);

  static final homeProductPrice = GoogleFonts.roboto(
      color: ColorName.gray, fontWeight: FontWeight.w700, fontSize: 12);

  static final font16Weight600PlayfairCardinal = GoogleFonts.playfairDisplay(
      color: ColorName.cardinal, fontWeight: FontWeight.w600, fontSize: 16);

  static final font24Weight600PlayfairCardinal = GoogleFonts.playfairDisplay(
      color: ColorName.cardinal, fontWeight: FontWeight.w600, fontSize: 24);

  static final font20Weight700White = GoogleFonts.roboto(
      color: ColorName.white, fontWeight: FontWeight.w700, fontSize: 20);

  static final font16Weight600PlayfairBlack = GoogleFonts.playfairDisplay(
      color: ColorName.black, fontWeight: FontWeight.w600, fontSize: 16);

  static final font10Weight400Black = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w400, fontSize: 10);
  static final font10Weight600Black = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w600, fontSize: 10);
  static final font14Weight300Black = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w300, fontSize: 14);
  static final font16Weight700 = GoogleFonts.roboto(
    color: ColorName.black,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static final font16Weight600 = GoogleFonts.roboto(
      color: ColorName.black, fontWeight: FontWeight.w600, fontSize: 16);

  static const font20Weight500Gray = TextStyle(
      fontSize: 20.0,
      fontFamily: 'SF Pro Rounded',
      color: ColorName.gray,
      fontWeight: FontWeight.w500);

  static const sf600Font16Black = TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'SF Pro Rounded',
      fontSize: 16,
      color: ColorName.black);
}
