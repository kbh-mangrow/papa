import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'택배아빠'**
  String get title;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'로그인'**
  String get signin;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'회원가입'**
  String get signup;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'취소'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'확인'**
  String get ok;

  /// No description provided for @count.
  ///
  /// In en, this message translates to:
  /// **'건'**
  String get count;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'보기'**
  String get show;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'모두보기'**
  String get more;

  /// No description provided for @join.
  ///
  /// In en, this message translates to:
  /// **'참여하기'**
  String get join;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'다음'**
  String get next;

  /// No description provided for @prev.
  ///
  /// In en, this message translates to:
  /// **'이전'**
  String get prev;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'가입'**
  String get complete;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'더보기'**
  String get view;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'오늘'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'어제'**
  String get yesterday;

  /// No description provided for @signin_welcome.
  ///
  /// In en, this message translates to:
  /// **' 에\n오신 것을 환영합니다! 👋'**
  String get signin_welcome;

  /// No description provided for @signin_id.
  ///
  /// In en, this message translates to:
  /// **'아이디'**
  String get signin_id;

  /// No description provided for @signin_id_hint.
  ///
  /// In en, this message translates to:
  /// **'아이디를 입력해 주세요.'**
  String get signin_id_hint;

  /// No description provided for @signin_password.
  ///
  /// In en, this message translates to:
  /// **'비밀번호'**
  String get signin_password;

  /// No description provided for @signin_password_hint.
  ///
  /// In en, this message translates to:
  /// **'비밀번호를 입력해 주세요.'**
  String get signin_password_hint;

  /// No description provided for @signin_id_save.
  ///
  /// In en, this message translates to:
  /// **'아이디 저장하기'**
  String get signin_id_save;

  /// No description provided for @signin_forgot.
  ///
  /// In en, this message translates to:
  /// **'기억나지 않으신가요?'**
  String get signin_forgot;

  /// No description provided for @signin_social.
  ///
  /// In en, this message translates to:
  /// **'소셜 로그인'**
  String get signin_social;

  /// No description provided for @signin_first.
  ///
  /// In en, this message translates to:
  /// **'첫 방문이신가요?'**
  String get signin_first;

  /// No description provided for @signin_signup.
  ///
  /// In en, this message translates to:
  /// **'지금 가입하기'**
  String get signin_signup;

  /// No description provided for @signin_forgot_id.
  ///
  /// In en, this message translates to:
  /// **'아이디 찾기'**
  String get signin_forgot_id;

  /// No description provided for @signin_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'비밀번호 찾기'**
  String get signin_forgot_password;

  /// No description provided for @social_apple.
  ///
  /// In en, this message translates to:
  /// **'Apple로 로그인'**
  String get social_apple;

  /// No description provided for @social_kakao.
  ///
  /// In en, this message translates to:
  /// **'카카오 로그인'**
  String get social_kakao;

  /// No description provided for @social_google.
  ///
  /// In en, this message translates to:
  /// **'Google로 로그인'**
  String get social_google;

  /// No description provided for @signup_title.
  ///
  /// In en, this message translates to:
  /// **'회원가입'**
  String get signup_title;

  /// No description provided for @signup_id.
  ///
  /// In en, this message translates to:
  /// **'아이디'**
  String get signup_id;

  /// No description provided for @signup_id_hint.
  ///
  /// In en, this message translates to:
  /// **'사용할 아이디를 입력해 주세요.'**
  String get signup_id_hint;

  /// No description provided for @signup_id_error.
  ///
  /// In en, this message translates to:
  /// **'아이디 형식오류. (영문/숫자 6자 이상 ~ 30자 미만)'**
  String get signup_id_error;

  /// No description provided for @signup_password.
  ///
  /// In en, this message translates to:
  /// **'비밀번호'**
  String get signup_password;

  /// No description provided for @signup_password_hint.
  ///
  /// In en, this message translates to:
  /// **'사용할 비밀번호를 입력해 주세요.'**
  String get signup_password_hint;

  /// No description provided for @signup_password_re.
  ///
  /// In en, this message translates to:
  /// **'비밀번호 확인'**
  String get signup_password_re;

  /// No description provided for @signup_password_re_hint.
  ///
  /// In en, this message translates to:
  /// **'비밀번호를 다시 입력해 주세요.'**
  String get signup_password_re_hint;

  /// No description provided for @signup_password_error.
  ///
  /// In en, this message translates to:
  /// **'비밀번호 형식오류. (영문/숫자 포함 8자 이상 ~ 30자 미만)'**
  String get signup_password_error;

  /// No description provided for @signup_password_re_error.
  ///
  /// In en, this message translates to:
  /// **'비밀번호가 일치하지 않습니다.'**
  String get signup_password_re_error;

  /// No description provided for @signup_auth_code_guide.
  ///
  /// In en, this message translates to:
  /// **'입력하신 번호로 인증번호가 발송되었습니다.'**
  String get signup_auth_code_guide;

  /// No description provided for @signup_retry.
  ///
  /// In en, this message translates to:
  /// **'재전송'**
  String get signup_retry;

  /// No description provided for @signup_remain_time.
  ///
  /// In en, this message translates to:
  /// **'남은 시간'**
  String get signup_remain_time;

  /// No description provided for @signup_auth_code.
  ///
  /// In en, this message translates to:
  /// **'인증번호'**
  String get signup_auth_code;

  /// No description provided for @signup_auth_code_error.
  ///
  /// In en, this message translates to:
  /// **'인증번호가 올바르지 않습니다.'**
  String get signup_auth_code_error;

  /// No description provided for @signup_complete.
  ///
  /// In en, this message translates to:
  /// **'가입 완료'**
  String get signup_complete;

  /// No description provided for @signup_complete_welcome.
  ///
  /// In en, this message translates to:
  /// **'택배아빠에 오신 것을 환영합니다!'**
  String get signup_complete_welcome;

  /// No description provided for @signup_complete_home.
  ///
  /// In en, this message translates to:
  /// **'홈으로'**
  String get signup_complete_home;

  /// No description provided for @forgot_id_title.
  ///
  /// In en, this message translates to:
  /// **'아이디 찾기'**
  String get forgot_id_title;

  /// No description provided for @forgot_id_result.
  ///
  /// In en, this message translates to:
  /// **' 님이 가입하신 아이디는\n{id} 입니다.'**
  String forgot_id_result(Object id);

  /// No description provided for @forgot_id_result_guide.
  ///
  /// In en, this message translates to:
  /// **'개인정보 보호를 위해 아이디의 일부만 보여집니다.'**
  String get forgot_id_result_guide;

  /// No description provided for @forgot_id_result_none.
  ///
  /// In en, this message translates to:
  /// **'가입 내역이 없습니다.'**
  String get forgot_id_result_none;

  /// No description provided for @forgot_id_signin.
  ///
  /// In en, this message translates to:
  /// **'로그인하기'**
  String get forgot_id_signin;

  /// No description provided for @forgot_id_signup.
  ///
  /// In en, this message translates to:
  /// **'가입하기'**
  String get forgot_id_signup;

  /// No description provided for @forgot_pwd_title.
  ///
  /// In en, this message translates to:
  /// **'비밀번호 찾기'**
  String get forgot_pwd_title;

  /// No description provided for @forgot_pwd_result.
  ///
  /// In en, this message translates to:
  /// **'임시 비밀번호가 발급되었습니다.'**
  String get forgot_pwd_result;

  /// No description provided for @forgot_pwd_result_guide.
  ///
  /// In en, this message translates to:
  /// **'임시 비밀번호는 로그인 후,\n마이에서 비밀번호를 변경하신 후 이용해 주세요.'**
  String get forgot_pwd_result_guide;

  /// No description provided for @forgot_pwd_temp.
  ///
  /// In en, this message translates to:
  /// **'임시비빌번호'**
  String get forgot_pwd_temp;

  /// No description provided for @forgot_pwd_signin.
  ///
  /// In en, this message translates to:
  /// **'로그인하기'**
  String get forgot_pwd_signin;

  /// No description provided for @forgot_pwd_signup.
  ///
  /// In en, this message translates to:
  /// **'가입하기'**
  String get forgot_pwd_signup;

  /// No description provided for @forgot_pwd_copy.
  ///
  /// In en, this message translates to:
  /// **'클립보드에 복사되었습니다.'**
  String get forgot_pwd_copy;

  /// No description provided for @popup_signin_confirm.
  ///
  /// In en, this message translates to:
  /// **'로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?'**
  String get popup_signin_confirm;

  /// No description provided for @papa_tab_home.
  ///
  /// In en, this message translates to:
  /// **'홈'**
  String get papa_tab_home;

  /// No description provided for @papa_tab_prod.
  ///
  /// In en, this message translates to:
  /// **'혜택'**
  String get papa_tab_prod;

  /// No description provided for @papa_tab_alarm.
  ///
  /// In en, this message translates to:
  /// **'알림'**
  String get papa_tab_alarm;

  /// No description provided for @papa_tab_my.
  ///
  /// In en, this message translates to:
  /// **'마이'**
  String get papa_tab_my;

  /// No description provided for @papa_home_welcome.
  ///
  /// In en, this message translates to:
  /// **'환영합니다!'**
  String get papa_home_welcome;

  /// No description provided for @papa_home_login.
  ///
  /// In en, this message translates to:
  /// **'지금 로그인해보세요.'**
  String get papa_home_login;

  /// No description provided for @papa_home_hello.
  ///
  /// In en, this message translates to:
  /// **'안녕하세요,'**
  String get papa_home_hello;

  /// No description provided for @papa_home_name.
  ///
  /// In en, this message translates to:
  /// **'님!'**
  String get papa_home_name;

  /// No description provided for @papa_home_rms2_alarm_format1.
  ///
  /// In en, this message translates to:
  /// **'미확인 알림이 '**
  String get papa_home_rms2_alarm_format1;

  /// No description provided for @papa_home_rms2_alarm_format2.
  ///
  /// In en, this message translates to:
  /// **' 있습니다.'**
  String get papa_home_rms2_alarm_format2;

  /// No description provided for @papa_home_use_service.
  ///
  /// In en, this message translates to:
  /// **'이용중인 서비스'**
  String get papa_home_use_service;

  /// No description provided for @papa_home_use_service_descr.
  ///
  /// In en, this message translates to:
  /// **'님이 이용중인 택배아빠 서비스'**
  String get papa_home_use_service_descr;

  /// No description provided for @papa_home_recommend_prod.
  ///
  /// In en, this message translates to:
  /// **'추천 금융 상품'**
  String get papa_home_recommend_prod;

  /// No description provided for @papa_home_recommend_prod_descr.
  ///
  /// In en, this message translates to:
  /// **'기사님만을 위한 추천 상품'**
  String get papa_home_recommend_prod_descr;

  /// No description provided for @papa_home_partner_prod.
  ///
  /// In en, this message translates to:
  /// **'파트너 제휴 혜택'**
  String get papa_home_partner_prod;

  /// No description provided for @papa_home_partner_prod_descr.
  ///
  /// In en, this message translates to:
  /// **'택배아빠가 엄선한 제휴 혜택'**
  String get papa_home_partner_prod_descr;

  /// No description provided for @papa_home_event.
  ///
  /// In en, this message translates to:
  /// **'이벤트'**
  String get papa_home_event;

  /// No description provided for @papa_home_event_descr.
  ///
  /// In en, this message translates to:
  /// **'택배아빠와 함께하는 깜짝 이벤트'**
  String get papa_home_event_descr;

  /// No description provided for @papa_alarm_title.
  ///
  /// In en, this message translates to:
  /// **'알림'**
  String get papa_alarm_title;

  /// No description provided for @papa_alarm_none.
  ///
  /// In en, this message translates to:
  /// **'알림 내역이 없습니다'**
  String get papa_alarm_none;

  /// No description provided for @papa_prod_title.
  ///
  /// In en, this message translates to:
  /// **'혜택'**
  String get papa_prod_title;

  /// No description provided for @papa_prod_finance.
  ///
  /// In en, this message translates to:
  /// **'금융 상품'**
  String get papa_prod_finance;

  /// No description provided for @papa_prod_finance_descr.
  ///
  /// In en, this message translates to:
  /// **'오직 택배아빠에서만 가능한 금융 상품'**
  String get papa_prod_finance_descr;

  /// No description provided for @papa_prod_partner.
  ///
  /// In en, this message translates to:
  /// **'파트너 제휴 혜택'**
  String get papa_prod_partner;

  /// No description provided for @papa_prod_partner_descr.
  ///
  /// In en, this message translates to:
  /// **'택배아빠가 엄선한 제휴 혜택'**
  String get papa_prod_partner_descr;

  /// No description provided for @papa_prod_event.
  ///
  /// In en, this message translates to:
  /// **'이벤트'**
  String get papa_prod_event;

  /// No description provided for @papa_prod_event_descr.
  ///
  /// In en, this message translates to:
  /// **'택배아빠와 함께하는 깜짝 이벤트'**
  String get papa_prod_event_descr;

  /// No description provided for @papa_my_hello.
  ///
  /// In en, this message translates to:
  /// **'안녕하세요.'**
  String get papa_my_hello;

  /// No description provided for @papa_my_name.
  ///
  /// In en, this message translates to:
  /// **'님'**
  String get papa_my_name;

  /// No description provided for @papa_my_navi_delivery_status.
  ///
  /// In en, this message translates to:
  /// **'현재 RMS II 가 시작 화면으로 설정되어 있습니다.'**
  String get papa_my_navi_delivery_status;

  /// No description provided for @papa_my_navi_delivery.
  ///
  /// In en, this message translates to:
  /// **'택배아빠를 시작 화면으로 설정하기'**
  String get papa_my_navi_delivery;

  /// No description provided for @papa_my_use_service.
  ///
  /// In en, this message translates to:
  /// **'이용중인 서비스'**
  String get papa_my_use_service;

  /// No description provided for @papa_my_settings.
  ///
  /// In en, this message translates to:
  /// **'설정'**
  String get papa_my_settings;

  /// No description provided for @papa_my_settings_informaion.
  ///
  /// In en, this message translates to:
  /// **'내 정보 상세'**
  String get papa_my_settings_informaion;

  /// No description provided for @papa_my_settings_alarm.
  ///
  /// In en, this message translates to:
  /// **'알림 설정'**
  String get papa_my_settings_alarm;

  /// No description provided for @papa_my_settings_change_password.
  ///
  /// In en, this message translates to:
  /// **'비밀번호 변경'**
  String get papa_my_settings_change_password;

  /// No description provided for @papa_my_settings_terms.
  ///
  /// In en, this message translates to:
  /// **'가입 약관 및 정책'**
  String get papa_my_settings_terms;

  /// No description provided for @papa_my_settings_signout.
  ///
  /// In en, this message translates to:
  /// **'로그아웃'**
  String get papa_my_settings_signout;

  /// No description provided for @papa_my_info_type.
  ///
  /// In en, this message translates to:
  /// **'유형'**
  String get papa_my_info_type;

  /// No description provided for @papa_my_info_id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get papa_my_info_id;

  /// No description provided for @papa_my_info_name.
  ///
  /// In en, this message translates to:
  /// **'이름'**
  String get papa_my_info_name;

  /// No description provided for @papa_my_info_email.
  ///
  /// In en, this message translates to:
  /// **'이메일'**
  String get papa_my_info_email;

  /// No description provided for @papa_my_info_phone.
  ///
  /// In en, this message translates to:
  /// **'전화번호'**
  String get papa_my_info_phone;

  /// No description provided for @papa_my_info_withdraw.
  ///
  /// In en, this message translates to:
  /// **'회원 탈퇴'**
  String get papa_my_info_withdraw;

  /// No description provided for @papa_alarm_allow.
  ///
  /// In en, this message translates to:
  /// **'알림 허용'**
  String get papa_alarm_allow;

  /// No description provided for @papa_alarm_prod.
  ///
  /// In en, this message translates to:
  /// **'혜택 알림'**
  String get papa_alarm_prod;

  /// No description provided for @papa_alarm_prod_descr.
  ///
  /// In en, this message translates to:
  /// **'보험, 금융 상품 등의 알림'**
  String get papa_alarm_prod_descr;

  /// No description provided for @papa_alarm_notice.
  ///
  /// In en, this message translates to:
  /// **'새소식 알림'**
  String get papa_alarm_notice;

  /// No description provided for @papa_alarm_notice_descr.
  ///
  /// In en, this message translates to:
  /// **'마케팅, 이벤트 등의 알림'**
  String get papa_alarm_notice_descr;

  /// No description provided for @papa_alarm_etc.
  ///
  /// In en, this message translates to:
  /// **'기타 알림'**
  String get papa_alarm_etc;

  /// No description provided for @papa_alarm_etc_descr.
  ///
  /// In en, this message translates to:
  /// **'보험 약관 업데이트, 공지 등의 알림'**
  String get papa_alarm_etc_descr;

  /// No description provided for @rms2_tab_home.
  ///
  /// In en, this message translates to:
  /// **'홈'**
  String get rms2_tab_home;

  /// No description provided for @rms2_tab_work.
  ///
  /// In en, this message translates to:
  /// **'근무'**
  String get rms2_tab_work;

  /// No description provided for @rms2_tab_safety.
  ///
  /// In en, this message translates to:
  /// **'안전'**
  String get rms2_tab_safety;

  /// No description provided for @rms2_tab_alarm.
  ///
  /// In en, this message translates to:
  /// **'알림'**
  String get rms2_tab_alarm;

  /// No description provided for @rms2_tab_my.
  ///
  /// In en, this message translates to:
  /// **'마이'**
  String get rms2_tab_my;

  /// No description provided for @rms2_title_full.
  ///
  /// In en, this message translates to:
  /// **'RMS II 안전관리'**
  String get rms2_title_full;

  /// No description provided for @rms2_title_descr.
  ///
  /// In en, this message translates to:
  /// **'안전관리 스마트 케어 서비스'**
  String get rms2_title_descr;

  /// No description provided for @rms2_work_status_onduty.
  ///
  /// In en, this message translates to:
  /// **'근무중'**
  String get rms2_work_status_onduty;

  /// No description provided for @rms2_work_status_not_onduty.
  ///
  /// In en, this message translates to:
  /// **'출근전'**
  String get rms2_work_status_not_onduty;

  /// No description provided for @rms2_work_status_offwork.
  ///
  /// In en, this message translates to:
  /// **'퇴근'**
  String get rms2_work_status_offwork;

  /// No description provided for @rms2_work_status_dayoff.
  ///
  /// In en, this message translates to:
  /// **'휴가'**
  String get rms2_work_status_dayoff;

  /// No description provided for @terms_agree_all.
  ///
  /// In en, this message translates to:
  /// **'모두 동의합니다.'**
  String get terms_agree_all;

  /// No description provided for @terms_group.
  ///
  /// In en, this message translates to:
  /// **'[필수] 단체운영 규약서'**
  String get terms_group;

  /// No description provided for @terms_privacy.
  ///
  /// In en, this message translates to:
  /// **'[필수] 개인정보처리방침'**
  String get terms_privacy;

  /// No description provided for @terms_service.
  ///
  /// In en, this message translates to:
  /// **'[필수] 서비스 이용 약관'**
  String get terms_service;

  /// No description provided for @terms_information.
  ///
  /// In en, this message translates to:
  /// **'[필수] 개인정보 수집 이용 동의'**
  String get terms_information;

  /// No description provided for @terms_provision.
  ///
  /// In en, this message translates to:
  /// **'[필수] 개인정보 3자제공 동의'**
  String get terms_provision;

  /// No description provided for @terms_marketing.
  ///
  /// In en, this message translates to:
  /// **'[선택] 마케팅 정보 수신 동의'**
  String get terms_marketing;

  /// No description provided for @terms_ads.
  ///
  /// In en, this message translates to:
  /// **'[선택] 채널 추가 및 광고성 정보 수신 동의'**
  String get terms_ads;

  /// No description provided for @common_company_name.
  ///
  /// In en, this message translates to:
  /// **'주식회사 에스엠티에이아이'**
  String get common_company_name;

  /// No description provided for @common_label_business_registration_number.
  ///
  /// In en, this message translates to:
  /// **'사업자등록번호'**
  String get common_label_business_registration_number;

  /// No description provided for @common_value_business_registration_number.
  ///
  /// In en, this message translates to:
  /// **'782-81-03388'**
  String get common_value_business_registration_number;

  /// No description provided for @common_label_ecommerce_registration_number.
  ///
  /// In en, this message translates to:
  /// **'통신판매신고번호'**
  String get common_label_ecommerce_registration_number;

  /// No description provided for @common_value_ecommerce_registration_number.
  ///
  /// In en, this message translates to:
  /// **'제 2026-서울강남-00904호'**
  String get common_value_ecommerce_registration_number;

  /// No description provided for @common_label_ceo_name.
  ///
  /// In en, this message translates to:
  /// **'대표자명'**
  String get common_label_ceo_name;

  /// No description provided for @common_value_ceo_name.
  ///
  /// In en, this message translates to:
  /// **'최홍범'**
  String get common_value_ceo_name;

  /// No description provided for @common_label_phone_number.
  ///
  /// In en, this message translates to:
  /// **'대표번호'**
  String get common_label_phone_number;

  /// No description provided for @common_value_phone_number.
  ///
  /// In en, this message translates to:
  /// **'02-567-0096'**
  String get common_value_phone_number;

  /// No description provided for @common_label_address.
  ///
  /// In en, this message translates to:
  /// **'주소'**
  String get common_label_address;

  /// No description provided for @common_value_address.
  ///
  /// In en, this message translates to:
  /// **'서울특별시 강남구 봉은사로 129, 2층 201호'**
  String get common_value_address;

  /// No description provided for @common_name.
  ///
  /// In en, this message translates to:
  /// **'이름'**
  String get common_name;

  /// No description provided for @common_name_hint.
  ///
  /// In en, this message translates to:
  /// **'이름을 입력해주세요.'**
  String get common_name_hint;

  /// No description provided for @common_birth.
  ///
  /// In en, this message translates to:
  /// **'주민등록변호 앞 7자리 (생년월일/성별)'**
  String get common_birth;

  /// No description provided for @common_mobile.
  ///
  /// In en, this message translates to:
  /// **'휴대전화 번호'**
  String get common_mobile;

  /// No description provided for @common_mobile_hint.
  ///
  /// In en, this message translates to:
  /// **'휴대전화 번호를 입력해주세요.'**
  String get common_mobile_hint;

  /// No description provided for @common_mobile_error.
  ///
  /// In en, this message translates to:
  /// **'전화번호 형식이 올바르지 않습니다.'**
  String get common_mobile_error;

  /// No description provided for @common_skt.
  ///
  /// In en, this message translates to:
  /// **'SKT'**
  String get common_skt;

  /// No description provided for @common_kt.
  ///
  /// In en, this message translates to:
  /// **'KT'**
  String get common_kt;

  /// No description provided for @common_lg.
  ///
  /// In en, this message translates to:
  /// **'LG U+'**
  String get common_lg;

  /// No description provided for @common_skt_lite.
  ///
  /// In en, this message translates to:
  /// **'SKT 알뜰폰'**
  String get common_skt_lite;

  /// No description provided for @common_kt_lite.
  ///
  /// In en, this message translates to:
  /// **'KT 알뜰폰'**
  String get common_kt_lite;

  /// No description provided for @common_lg_lite.
  ///
  /// In en, this message translates to:
  /// **'LG U+ 알뜰폰'**
  String get common_lg_lite;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ko': return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
