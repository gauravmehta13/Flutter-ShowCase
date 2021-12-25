import 'package:flutter_showcase_nullsafety/flutter_showcase.dart';
import 'package:flutter_showcase_nullsafety/src/templates/simple_template.dart';

class Templates {
  static Template get simple => SimpleTemplate();
  static Template get simpleReverse => SimpleTemplate(reverse: true);
}
