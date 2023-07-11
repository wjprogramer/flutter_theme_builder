num math_utils_signum(n) {
  return 0 > n ? -1 : 0 == n ? 0 : 1;
}

math_utils_sanitizeDegreesInt(degrees) {
  degrees %= 360;
  0 > degrees && (degrees += 360);
  return degrees;
}

math_utils_sanitizeDegreesDouble(degrees) {
  degrees %= 360;
  0 > degrees && (degrees += 360);
  return degrees;
}