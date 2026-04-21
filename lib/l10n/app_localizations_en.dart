// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'DeliveryPapa';

  @override
  String get signin => '로그인';

  @override
  String get signup => '회원가입';

  @override
  String get cancel => '취소';

  @override
  String get ok => '확인';

  @override
  String get popup_signin_confirm => '로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?';

  @override
  String get rms2_tab_home => 'Home';

  @override
  String get rms2_tab_work => 'Work';

  @override
  String get rms2_tab_safety => 'Safety';

  @override
  String get rms2_tab_alarm => 'Alarm';

  @override
  String get rms2_tab_my => 'My';
}
