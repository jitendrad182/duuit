import 'package:duuit/const/string_const.dart';

class ImageConst {
  static String avatarImageConst(int avatarNumber) {
    return 'assets/avatars/avatar$avatarNumber.png';
  }

  static String goalCategoryImageConst(String goalCategoryName) {
    switch (goalCategoryName) {
      case StringConst.reading:
        return readingIcon;
      case StringConst.meditate:
        return meditateIcon;
      case StringConst.workout:
        return workoutIcon;
      case StringConst.misc:
        return miscIcon;
      default:
        return miscIcon;
    }
  }

  static const String appLogo = 'assets/images/app_logo.png';

  static const String logo = 'assets/images/logo.png';
  static const String duuit = 'assets/images/duuit.png';

  static const String g1 = 'assets/images/g1.jpg';
  static const String g2 = 'assets/images/g2.jpg';
  static const String g3 = 'assets/images/g3.jpg';
  static const String g4 = 'assets/images/g4.jpg';

  static const String reading = 'assets/images/reading.png';
  static const String meditate = 'assets/images/meditate.png';
  static const String workout = 'assets/images/workout.png';
  static const String misc = 'assets/images/misc.png';

  static const String readingIcon = 'assets/images/reading_icon.png';
  static const String meditateIcon = 'assets/images/meditate_icon.png';
  static const String workoutIcon = 'assets/images/workout_icon.png';
  static const String miscIcon = 'assets/images/misc_icon.png';

  static const String google = 'assets/images/google.png';
  static const String fb = 'assets/images/fb.png';

  static const String buddie = 'assets/images/buddie.png';
  static const String goal = 'assets/images/goal.png';
}
