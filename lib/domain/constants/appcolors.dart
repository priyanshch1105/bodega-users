import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF221662);
  static const Color backgroundColor = Colors.white;
  static const Color textPrimary = Colors.black87;
  static const Color cardColor = Color(0xFFF2F1FA);

  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color buttonLight = Color(0xFF221662);
  static const Color inputFieldLight = Color(0xFFE8EBF2);
  static const Color loginSignupBtnLight = Color(0xFF221662);
  static const Color textLight = Color(0xFF544F94);
  static const Color h1text = Color(0xFF000000);
  static const Color profilebg = Color(0xFF221662);
  static const Color person = Color(0xFFFFFFFF);
  static const Color verifyProfileLight = Color(0xFF9BFCB2);
  static const Color whiteLight = Color(0xFFFFFFFF);
  static const Color blackLight = Color(0xFF000000);
  static const Color greyBtnLight = Color(0xFFD8D8D8);
  static const Color toggleBgLight = Color(0xFFFFFFFF);
  static const Color toggleBtnLight = Color(0xFF221662);
  static const Color addBtnLight = Color(0xFFBEBEF2);
  static const Color bottomNavLight = Color(0xFFF0F0F0);
  static const Color trackOrderLight = Color(0xFFEBEBF2);
  static const Color assistantFrameTopLight = Color(0xFFBEBEF2);
  static const Color textTabsLight = Color(0xFF544F94);
  static const Color cardsLight = Color(0xFFFFFFFF);
  static const Color paymentTxtLight = Color(0xFF221662);
  static const Color blackNoChangeLight = Color(0xFF000000);
  static const Color greyCountdownLight = Color(0xFF808080);
  static const Color greyLight = Color(0xFFD8D8D8);
  static const Color buttontextlight = Color(0xFFFFFFFF);

  // 🌚 DARK MODE COLORS
  static const Color backgroundDark = Color(0xFF0E0E0E);
  static const Color buttonDark = Color(0xFFE1E1E1);
  static const Color h1textdark = Color(0xFFFFFFFF);
  static const Color inputFieldDark = Color(0xFF353535);
  static const Color profilebgdark = Color(0xFF6C63FF);
  static const Color persondark = Color(0xFF000000);
  static const Color loginSignupBtnDark = Color(0xFF221662);
  static const Color textDark = Color(0xFFFFFFFF);
  static const Color verifyProfileDark = Color(0xFF9BFCB2);
  static const Color whiteDark = Color(0xFF000000);
  static const Color blackDark = Color(0xFFFFFFFF);
  static const Color greyBtnDark = Color(0xFF353535);
  static const Color toggleBgDark = Color(0xFF0E0E0E);
  static const Color toggleBtnDark = Color(0xFFFFFFFF);
  static const Color addBtnDark = Color(0xFFBEBEF2);
  static const Color bottomNavDark = Color(0xFFF0F0F0);
  static const Color trackOrderDark = Color(0xFFBEBEF2);
  static const Color assistantFrameTopDark = Color(0xFF7D7D7D);
  static const Color textTabsDark = Color(0xFF353535);
  static const Color cardsDark = Color(0xFF595959);
  static const Color paymentTxtDark = Color(0xFF221662);
  static const Color blackNoChangeDark = Color(0xFF000000);
  static const Color greyCountdownDark = Color(0xFF808080);
  static const Color greyDark = Color(0xFF353535);
  static const Color buttontextdark = Color(0xFF000000);


  // 🎨 DYNAMIC GETTERS
  static Color background(BuildContext context) =>
      _isDark(context) ? backgroundDark : backgroundLight;

  static Color button(BuildContext context) =>
      _isDark(context) ? buttonDark : buttonLight;

  static Color buttontext(BuildContext context) =>
      _isDark(context) ? buttontextdark : buttontextlight;

  static Color profileb(BuildContext context) =>
      _isDark(context) ? profilebgdark : profilebg;

  static Color icon(BuildContext context) =>
      _isDark(context) ? persondark : person;

  static Color inputField(BuildContext context) =>
      _isDark(context) ? inputFieldDark : inputFieldLight;

  static Color loginSignupBtn(BuildContext context) =>
      _isDark(context) ? loginSignupBtnDark : loginSignupBtnLight;

  static Color text(BuildContext context) =>
      _isDark(context) ? textDark : textLight;

  static Color text1(BuildContext context) =>
      _isDark(context) ? h1textdark : h1text;

  static Color verifyProfile(BuildContext context) =>
      _isDark(context) ? verifyProfileDark : verifyProfileLight;

  static Color card(BuildContext context) =>
      _isDark(context) ? cardsDark : cardsLight;

  static Color grey(BuildContext context) =>
      _isDark(context) ? greyBtnDark : greyBtnLight;

  static Color toggleBtn(BuildContext context) =>
      _isDark(context) ? toggleBtnDark : toggleBtnLight;

  static Color paymentTxt(BuildContext context) =>
      _isDark(context) ? paymentTxtDark : paymentTxtLight;

  static Color bottomNav(BuildContext context) =>
      _isDark(context) ? bottomNavDark : bottomNavLight;

  static Color trackOrder(BuildContext context) =>
      _isDark(context) ? trackOrderDark : trackOrderLight;

  // ⚙️ Helper
  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
