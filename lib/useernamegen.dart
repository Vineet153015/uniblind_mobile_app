
import 'dart:math';


class UsernameGenerator {
  final Set<String> _generatedUsernames = {};

  String generateUniqueUsername() {
    String username;
    do {
      username = _generateUsername();
    } while (_generatedUsernames.contains(username));
    _generatedUsernames.add(username);
    return username;
  }

  String _generateUsername() {
    // Define a list of prefixes and suffixes to choose from
    List<String> prefixes = [
      'user', 'username', 'customer', 'client', 'email', 'signup', 'join', 'your',
      'id', 'query', 'hjk', 'login', 'password', 'mail', 'birthday', 'visibility',
      'contact', 'xprofile', 'zprofile', 'account', 'social', 'lastname', 'baby',
      'profile', 'chat', 'messaging', 'notification', 'settings', 'privacy', 'terms',
      'conditions', 'support', 'feedback', 'rating', 'review', 'security',
      'preferences', 'updates', 'subscriptions', 'verification', 'authentication',
      'registration', 'recovery', 'forgotpassword', 'recoveryemail', 'recoveryphone',
      'signin', 'signout', 'logout', 'welcome', 'greeting', 'dashboard',
      'profilesettings', 'userprofile', 'useraccount', 'userdetails', 'accountsettings',
      'accountinfo', 'personalinfo', 'notificationsettings', 'securitysettings',
      'privacysettings', 'billinginfo', 'paymentmethods', 'manageaccount',
      'manageprofile', 'editprofile', 'updateprofile', 'changepassword', 'resetpassword',
      'forgotusername', 'accountrecovery', 'createaccount', 'newaccount', 'verifyemail',
      'verifyphone', 'activateaccount', 'confirmemail', 'confirmphone', 'emailverification',
      'phoneverification', 'two-factorauthentication', 'passwordrecovery', 'accountactivation',
      'register', 'loginsuccess', 'loginfailure', 'accountcreated', 'accountupdated',
      'passwordchanged', 'emailverified', 'phoneverified', 'accountactivated',
      'notificationreceived', 'notificationpreferences'
    ];

    List<String> suffixes = [
      '234', '123', '466', '890', '567', '901', '345', '678', '543', '219',
      '876', '432', '987', '654', '321', '135', '246', '357', '468', '579',
      '680', '791', '802', '913', '914', '915', '916', '917', '918', '919',
      '920', '921', '922', '923', '924', '925', '926', '927', '928', '929',
      '930', '931', '932', '933', '934', '935', '936', '937', '938', '939',
      '940', '941', '942', '943', '944', '945', '946', '947', '948', '949',
      '950', '951', '952', '953', '954', '955', '956', '957', '958', '959',
      '960', '961', '962', '963', '964', '965', '966', '967', '968', '969',
      '970', '971', '972', '973', '974', '975', '976', '977', '978', '979',
      '980', '981', '982', '983', '984', '985', '986', '987', '988', '989',
      '990'
    ];

    // Generate a random number for prefix and suffix
    Random random = Random();
    int prefixIndex = random.nextInt(prefixes.length);
    int suffixIndex = random.nextInt(suffixes.length);

    // Combine the prefix and suffix to create the username
    String username = '${prefixes[prefixIndex]}_${suffixes[suffixIndex]}';

    return username;
  }
}

final usernameGenerator = UsernameGenerator();


