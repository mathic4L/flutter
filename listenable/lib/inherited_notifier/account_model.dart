import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AccountInheritedNotifier extends InheritedNotifier<AccountModel> {
  const AccountInheritedNotifier(
      {super.key, required super.notifier, required super.child});

  @override
  bool updateShouldNotify(covariant AccountInheritedNotifier oldWidget) {
    var output = notifier != oldWidget.notifier;
    if (kDebugMode) {
      print(output);
    }
    return output;
  }
}

class AccountModel extends ValueNotifier<AccountData> {
  AccountModel(super._value);

  void changeAvatar(IconData value) =>
      this.value = this.value.copyWith(avatar: value);
}

class AccountData {
  final String name;
  final String surname;
  final String nickname;
  final IconData avatar;

  const AccountData(this.name, this.surname, this.nickname, this.avatar);

  AccountData copyWith(
          {String? name,
          String? surname,
          String? nickname,
          IconData? avatar}) =>
      AccountData(name ?? this.name, surname ?? this.surname,
          nickname ?? this.nickname, avatar ?? this.avatar);
}
