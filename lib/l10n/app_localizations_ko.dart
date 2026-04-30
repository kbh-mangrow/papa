// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get title => '택배아빠';

  @override
  String get signin => '로그인';

  @override
  String get signup => '회원가입';

  @override
  String get cancel => '취소';

  @override
  String get ok => '확인';

  @override
  String get count => '건';

  @override
  String get show => '보기';

  @override
  String get more => '모두보기';

  @override
  String get join => '참여하기';

  @override
  String get next => '다음';

  @override
  String get prev => '이전';

  @override
  String get complete => '가입';

  @override
  String get sun => '일';

  @override
  String get mon => '월';

  @override
  String get tue => '화';

  @override
  String get wed => '수';

  @override
  String get thu => '목';

  @override
  String get fri => '금';

  @override
  String get sat => '토';

  @override
  String get signin_welcome => ' 에\n오신 것을 환영합니다! 👋';

  @override
  String get signin_id => '아이디';

  @override
  String get signin_id_hint => '아이디를 입력해 주세요.';

  @override
  String get signin_password => '비밀번호';

  @override
  String get signin_password_hint => '비밀번호를 입력해 주세요.';

  @override
  String get signin_id_save => '아이디 저장하기';

  @override
  String get signin_forgot => '기억나지 않으신가요?';

  @override
  String get signin_social => '소셜 로그인';

  @override
  String get signin_first => '첫 방문이신가요?';

  @override
  String get signin_signup => '지금 가입하기';

  @override
  String get signin_forgot_id => '아이디 찾기';

  @override
  String get signin_forgot_password => '비밀번호 찾기';

  @override
  String get social_apple => 'Apple로 로그인';

  @override
  String get social_kakao => '카카오 로그인';

  @override
  String get social_google => 'Google로 로그인';

  @override
  String get signup_title => '회원가입';

  @override
  String get signup_id => '아이디';

  @override
  String get signup_id_hint => '사용할 아이디를 입력해 주세요.';

  @override
  String get signup_id_error => '아이디 형식오류. (영문/숫자 6자 이상 ~ 30자 미만)';

  @override
  String get signup_password => '비밀번호';

  @override
  String get signup_password_hint => '사용할 비밀번호를 입력해 주세요.';

  @override
  String get signup_password_re => '비밀번호 확인';

  @override
  String get signup_password_re_hint => '비밀번호를 다시 입력해 주세요.';

  @override
  String get signup_password_error => '비밀번호 형식오류. (영문/숫자 포함 8자 이상 ~ 30자 미만)';

  @override
  String get signup_password_re_error => '비밀번호가 일치하지 않습니다.';

  @override
  String get signup_auth_code_guide => '입력하신 번호로 인증번호가 발송되었습니다.';

  @override
  String get signup_retry => '재전송';

  @override
  String get signup_remain_time => '남은 시간';

  @override
  String get signup_auth_code => '인증번호';

  @override
  String get signup_auth_code_error => '인증번호가 올바르지 않습니다.';

  @override
  String get signup_complete => '가입 완료';

  @override
  String get signup_complete_welcome => '택배아빠에 오신 것을 환영합니다!';

  @override
  String get signup_complete_home => '홈으로';

  @override
  String get forgot_id_title => '아이디 찾기';

  @override
  String forgot_id_result(Object id) {
    return ' 님이 가입하신 아이디는\n$id 입니다.';
  }

  @override
  String get forgot_id_result_guide => '개인정보 보호를 위해 아이디의 일부만 보여집니다.';

  @override
  String get forgot_id_result_none => '가입 내역이 없습니다.';

  @override
  String get forgot_id_signin => '로그인하기';

  @override
  String get forgot_id_signup => '가입하기';

  @override
  String get forgot_pwd_title => '비밀번호 찾기';

  @override
  String get forgot_pwd_result => '임시 비밀번호가 발급되었습니다.';

  @override
  String get forgot_pwd_result_guide => '임시 비밀번호는 로그인 후,\n마이에서 비밀번호를 변경하신 후 이용해 주세요.';

  @override
  String get forgot_pwd_temp => '임시비빌번호';

  @override
  String get forgot_pwd_signin => '로그인하기';

  @override
  String get forgot_pwd_signup => '가입하기';

  @override
  String get forgot_pwd_copy => '클립보드에 복사되었습니다.';

  @override
  String get popup_signin_confirm => '로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?';

  @override
  String get papa_tab_home => '홈';

  @override
  String get papa_tab_prod => '혜택';

  @override
  String get papa_tab_alarm => '알림';

  @override
  String get papa_tab_my => '마이';

  @override
  String get papa_home_welcome => '환영합니다!';

  @override
  String get papa_home_login => '지금 로그인해보세요.';

  @override
  String get papa_home_hello => '안녕하세요,';

  @override
  String get papa_home_name => '님!';

  @override
  String get papa_home_rms2_alarm_format1 => '미확인 알림이 ';

  @override
  String get papa_home_rms2_alarm_format2 => ' 있습니다.';

  @override
  String get papa_home_use_service => '이용중인 서비스';

  @override
  String get papa_home_use_service_descr => '님이 이용중인 택배아빠 서비스';

  @override
  String get papa_home_recommend_prod => '추천 금융 상품';

  @override
  String get papa_home_recommend_prod_descr => '기사님만을 위한 추천 상품';

  @override
  String get papa_home_partner_prod => '파트너 제휴 혜택';

  @override
  String get papa_home_partner_prod_descr => '택배아빠가 엄선한 제휴 혜택';

  @override
  String get papa_home_event => '이벤트';

  @override
  String get papa_home_event_descr => '택배아빠와 함께하는 깜짝 이벤트';

  @override
  String get rms2_tab_home => '홈';

  @override
  String get rms2_tab_work => '근무';

  @override
  String get rms2_tab_safety => '안전';

  @override
  String get rms2_tab_alarm => '알림';

  @override
  String get rms2_tab_my => '마이';

  @override
  String get rms2_title_full => 'RMS II 안전관리';

  @override
  String get rms2_title_descr => '안전관리 스마트 케어 서비스';

  @override
  String get rms2_work_status_onduty => '근무중';

  @override
  String get rms2_work_status_not_onduty => '출근전';

  @override
  String get rms2_work_status_offwork => '퇴근';

  @override
  String get rms2_work_status_dayoff => '휴가';

  @override
  String get terms_agree_all => '모두 동의합니다.';

  @override
  String get terms_group => '[필수] 단체운영 규약서';

  @override
  String get terms_privacy => '[필수] 개인정보처리방침';

  @override
  String get terms_service => '[필수] 서비스 이용 약관';

  @override
  String get terms_information => '[필수] 개인정보 수집 이용 동의';

  @override
  String get terms_provision => '[필수] 개인정보 3자제공 동의';

  @override
  String get terms_marketing => '[선택] 마케팅 정보 수신 동의';

  @override
  String get terms_ads => '[선택] 채널 추가 및 광고성 정보 수신 동의';

  @override
  String get common_company_name => '주식회사 에스엠티에이아이';

  @override
  String get common_label_business_registration_number => '사업자등록번호';

  @override
  String get common_value_business_registration_number => '782-81-03388';

  @override
  String get common_label_ecommerce_registration_number => '통신판매신고번호';

  @override
  String get common_value_ecommerce_registration_number => '제 2026-서울강남-00904호';

  @override
  String get common_label_ceo_name => '대표자명';

  @override
  String get common_value_ceo_name => '최홍범';

  @override
  String get common_label_phone_number => '대표번호';

  @override
  String get common_value_phone_number => '02-567-0096';

  @override
  String get common_label_address => '주소';

  @override
  String get common_value_address => '서울특별시 강남구 봉은사로 129, 2층 201호';

  @override
  String get common_name => '이름';

  @override
  String get common_name_hint => '이름을 입력해주세요.';

  @override
  String get common_birth => '주민등록변호 앞 7자리 (생년월일/성별)';

  @override
  String get common_mobile => '휴대전화 번호';

  @override
  String get common_mobile_hint => '휴대전화 번호를 입력해주세요.';

  @override
  String get common_mobile_error => '전화번호 형식이 올바르지 않습니다.';

  @override
  String get common_skt => 'SKT';

  @override
  String get common_kt => 'KT';

  @override
  String get common_lg => 'LG U+';

  @override
  String get common_skt_lite => 'SKT 알뜰폰';

  @override
  String get common_kt_lite => 'KT 알뜰폰';

  @override
  String get common_lg_lite => 'LG U+ 알뜰폰';
}
