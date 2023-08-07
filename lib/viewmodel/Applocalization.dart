import 'package:flutter/material.dart';

class AppLocalizations2 {
  AppLocalizations2(this.locale);

  final Locale locale;

  static AppLocalizations2? of(BuildContext context) {
    return Localizations.of<AppLocalizations2>(context, AppLocalizations2);
  }

  static Map<String, Map<String, String>> _localizedValues = {
   /* 'en': {
      'title': 'Kheloo',
      // Add other translations for English here
    },*/
    'en':{
      'wt':'Live Withdraw',
    'reg':'Register',
      'sp':'Support',
      'spr':'Sports',
      'ca':'Live Casino',
      'sm':'Show More',
      'pl':'Most Popular',
      'lg':'Login',
      'gm':'Games',
      'hd':'Hide',
      'title':'Kheloo'
    },

    'hi': {
      'wt': 'लाइव निकासी',
      'reg': 'पंजीकरण करवाना',
      'sp': 'सहायता',
      'spr': 'खेल',
      'ca': 'लाइव कैसीनो',
      'sm': 'और दिखाओ',
      'pl': 'सबसे लोकप्रिय',
      'lg': 'लॉग इन करें',
      'gm':'खेल',
      'hd':'छिपाना',
      'title':'खेलू'
      // Add other translations for French here
    },
    // Add translations for other languages here
  };

  String? get getcash {
    return _localizedValues[locale.languageCode]?['wt'];
  }
String? get getsuprt {
    return _localizedValues[locale.languageCode]?['sp'];
}
String? get getsp{
  return _localizedValues[locale.languageCode]?['spr'];
}
  String? get getcasino{
    return _localizedValues[locale.languageCode]?['ca'];
  }
  String? get getreg{
    return _localizedValues[locale.languageCode]?['reg'];
  }
  String? get getlogin{
    return _localizedValues[locale.languageCode]?['lg'];
  }
  String? get getmore{
    return _localizedValues[locale.languageCode]?['sm'];
  }
  String? get getGms{
    return _localizedValues[locale.languageCode]?['gm'];
  }
  String? get getMostpl{
    return _localizedValues[locale.languageCode]?['pl'];
  }
  String? get gethide{
    return _localizedValues[locale.languageCode]?['hd'];
  }
  String? get gettitle{
    return _localizedValues[locale.languageCode]?['title'];
  }
// Add other getter methods for your translations
}
