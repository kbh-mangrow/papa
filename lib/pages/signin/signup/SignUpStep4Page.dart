
import 'package:flutter/material.dart' hide VoidCallback;
import 'package:papa/PapaComm.dart';
import '../../../../Storage.dart';
import '../../../../l10n/app_localizations.dart';

//====================================================
final String tag = 'SignUpStep4Page.dart';
//====================================================

class SignUpStep4Page extends StatefulWidget {
  const SignUpStep4Page({super.key, });

  @override
  State<SignUpStep4Page> createState() => SignUpStep4PageState();
}

class SignUpStep4PageState extends State<SignUpStep4Page> {
  bool isAgreeAll = false;
  bool isGroup = false;
  bool isPrivacy = false;
  bool isService = false;
  bool isInformation = false;
  bool isProvision = false;
  bool isMarketing = false;
  bool isAds = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 0,
      ),
      child: Column(
        children: [
          SizedBox(height: 32,),
          SizedBox(
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.signup_title,
              style: const TextStyle(
                color: Color(0xff1B2028),
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 26,),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                setState(() {
                  isAds = isMarketing = isInformation = isPrivacy = isProvision = isService = isGroup = isAgreeAll = !isAgreeAll;
                });
              },
              child: Container(
                height: 40,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      isAgreeAll ?
                      'image/check_on.png' : 'image/check_off.png',
                      width: 28,
                      height: 28,
                    ),
                    SizedBox(width: 8,),
                    Text(
                      AppLocalizations.of(context)!.terms_agree_all,
                      style: const TextStyle(
                        color: Color(0xff1B2028),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 5,),
                  ],),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Color(0xffE5E8EF),
          ),
          SizedBox(height: 20,),
          Material(
            color: const Color(0xffF7FAFF),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() {
                  isGroup = !isGroup;
                  if (isGroup) {
                    if (isAds && isMarketing && isInformation && isPrivacy && isProvision && isService && isGroup) {
                      isAgreeAll = true;
                    }
                  }
                  else {
                    isAgreeAll = false;
                  }
                });
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Image.asset(
                      (isGroup || isAgreeAll)
                          ? 'image/check_on.png'
                          : 'image/check_off.png',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(
                        AppLocalizations.of(context)!.terms_group,
                        style: const TextStyle(
                          color: Color(0xff1B2028),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: Image.asset('image/arrow_right.png'),
                          ),
                        )
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          Material(
            color: const Color(0xffF7FAFF),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() {
                  isPrivacy = !isPrivacy;
                  if (isPrivacy) {
                    if (isAds && isMarketing && isInformation && isPrivacy && isProvision && isService && isGroup) {
                      isAgreeAll = true;
                    }
                  }
                  else {
                    isAgreeAll = false;
                  }
                });
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Image.asset(
                      (isPrivacy || isAgreeAll)
                          ? 'image/check_on.png'
                          : 'image/check_off.png',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(
                      AppLocalizations.of(context)!.terms_privacy,
                      style: const TextStyle(
                        color: Color(0xff1B2028),
                        fontSize: 16,
                      ),
                    ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset('image/arrow_right.png'),
                            ),
                          )
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          Material(
            color: const Color(0xffF7FAFF),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() {
                  isService = !isService;
                  if (isService) {
                    if (isAds && isMarketing && isInformation && isPrivacy && isProvision && isService && isGroup) {
                      isAgreeAll = true;
                    }
                  }
                  else {
                    isAgreeAll = false;
                  }
                });
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Image.asset(
                      (isService || isAgreeAll)
                          ? 'image/check_on.png'
                          : 'image/check_off.png',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(
                      AppLocalizations.of(context)!.terms_service,
                      style: const TextStyle(
                        color: Color(0xff1B2028),
                        fontSize: 16,
                      ),
                    ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset('image/arrow_right.png'),
                            ),
                          )
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          Material(
            color: const Color(0xffF7FAFF),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() {
                  isInformation = !isInformation;
                  if (isInformation) {
                    if (isAds && isMarketing && isInformation && isPrivacy && isProvision && isService && isGroup) {
                      isAgreeAll = true;
                    }
                  }
                  else {
                    isAgreeAll = false;
                  }
                });
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Image.asset(
                      (isInformation || isAgreeAll)
                          ? 'image/check_on.png'
                          : 'image/check_off.png',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(
                      AppLocalizations.of(context)!.terms_information,
                      style: const TextStyle(
                        color: Color(0xff1B2028),
                        fontSize: 16,
                      ),
                    ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset('image/arrow_right.png'),
                            ),
                          )
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          Material(
            color: const Color(0xffF7FAFF),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() {
                  isProvision = !isProvision;
                  if (isProvision) {
                    if (isAds && isMarketing && isInformation && isPrivacy && isProvision && isService && isGroup) {
                      isAgreeAll = true;
                    }
                  }
                  else {
                    isAgreeAll = false;
                  }
                });
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Image.asset(
                      (isProvision || isAgreeAll)
                          ? 'image/check_on.png'
                          : 'image/check_off.png',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(
                      AppLocalizations.of(context)!.terms_provision,
                      style: const TextStyle(
                        color: Color(0xff1B2028),
                        fontSize: 16,
                      ),
                    ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset('image/arrow_right.png'),
                            ),
                          )
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          Material(
            color: const Color(0xffF7FAFF),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() {
                  isMarketing = !isMarketing;
                  if (isMarketing) {
                    if (isAds && isMarketing && isInformation && isPrivacy && isProvision && isService && isGroup) {
                      isAgreeAll = true;
                    }
                  }
                  else {
                    isAgreeAll = false;
                  }
                });
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Image.asset(
                      (isMarketing || isAgreeAll)
                          ? 'image/check_on.png'
                          : 'image/check_off.png',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(
                      AppLocalizations.of(context)!.terms_marketing,
                      style: const TextStyle(
                        color: Color(0xff1B2028),
                        fontSize: 16,
                      ),
                    ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset('image/arrow_right.png'),
                            ),
                          )
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          Material(
            color: const Color(0xffF7FAFF),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() {
                  isAds = !isAds;
                  if (isAds) {
                    if (isAds && isMarketing && isInformation && isPrivacy && isProvision && isService && isGroup) {
                      isAgreeAll = true;
                    }
                  }
                  else {
                    isAgreeAll = false;
                  }
                });
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Image.asset(
                      (isAds || isAgreeAll)
                          ? 'image/check_on.png'
                          : 'image/check_off.png',
                      width: 28,
                      height: 28,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(
                      AppLocalizations.of(context)!.terms_ads,
                      style: const TextStyle(
                        color: Color(0xff1B2028),
                        fontSize: 16,
                      ),
                    ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: Image.asset('image/arrow_right.png'),
                            ),
                          )
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );

  }

}
