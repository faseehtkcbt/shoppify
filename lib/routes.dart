import 'package:flutter/cupertino.dart';

import 'features/home/presentation/view/picture_of_day_page.dart';

class Routes {
  Routes._();
  static const String pictureDayPage = '/picture-day-page';

  static final dynamic routes = <String, WidgetBuilder>{
    pictureDayPage: (BuildContext context) => PictureDayPage()
  };
}
