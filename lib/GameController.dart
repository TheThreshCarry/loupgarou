import 'dart:math';

import 'package:loupgarou/data/Roles.dart';

class GameController {
  static Random random = Random();
  static int villagersCount = 0;
  static int wolfCount = 0;
  static bool started = false;
  static int get allCount {
    return villagersCount + wolfCount + roles.length;
  }

  static List<Role> roles = [];

  static bool checkSelected(Role role) {
    return roles.contains(role);
  }

  static void removeRole(Role role) {
    //if (!checkSelected(role)) return;
    roles.remove(role);
  }

  static void addRole(Role role) {
    //if (checkSelected(role)) return;
    roles.add(role);
  }

  static void changeRoleState(role) {
    if (checkSelected(role)) {
      removeRole(role);
    } else {
      addRole(role);
    }
  }

  static void resetGame() {
    wolfCount = 0;
    villagersCount = 0;
    roles.clear();
  }

  static Role getRandomRole() {
    if (allCount > 0) {
      double randomNumber = random.nextDouble();
      double villagersSlice = villagersCount / allCount;
      double wolfSlice = (wolfCount / allCount) + villagersSlice;
      double roleSlice = (roles.length / allCount) + wolfSlice;

      if (randomNumber < villagersSlice) {
        villagersCount--;
        return privateRoles[1];
      } else if (randomNumber < wolfSlice) {
        wolfCount--;
        return privateRoles[0];
      } else {
        int roleNumber = random.nextInt(roles.length);
        Role toGive = roles[roleNumber];
        removeRole(roles[roleNumber]);
        return toGive;
      }
    }
    return privateRoles[0];
  }

  static Role getRoleRole() {
    if (roles.length != 0) {
      int roleNumber = random.nextInt(roles.length);
      Role toGive = roles[roleNumber];
      removeRole(roles[roleNumber]);
      return toGive;
    } else {
      return getRandomRole();
    }
  }
}
