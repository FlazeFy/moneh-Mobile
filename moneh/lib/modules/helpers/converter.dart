String getMessageResponseFromObject(val, type) {
  var res = "";

  if (val is String) {
    return val;
  } else {
    if (type == "login") {
      if (val.containsKey('username') != null) {
        var usernameErr = val['username'];

        if (usernameErr != null) {
          res += "${usernameErr.join('\n')}";
        }
      }
      if (val.containsKey('password')) {
        var passErr = val['password'];
        if (passErr != null) {
          res += "${passErr.join('\n')}";
        }
      }
    }

    return res;
  }
}

String numberToPrice(int val) {
  try {
    if (val >= 1000) {
      final res = (val / 1000).toStringAsFixed(0);
      return '$res K';
    } else {
      return val.toString();
    }
  } catch (error) {
    rethrow;
  }
}
