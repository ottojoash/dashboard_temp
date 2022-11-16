import 'package:dashboard_temp/profile.dart';
import 'package:dashboard_temp/home.dart';
import 'package:dashboard_temp/schedules.dart';
import 'package:dashboard_temp/settings.dart';
import 'package:dashboard_temp/notifications.dart';
import 'package:dashboard_temp/stats.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<Profile>(() => Profile());
    register<Notifications>(() => Notifications());
    register<Stats>(() => Stats());
    register<Schedules>(() => Schedules());
    register<Settings>(() => Settings());
  }

  static dynamic fromString(String type) {
    return _constructors[type]!();
  }
}