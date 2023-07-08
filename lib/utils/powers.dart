// Copy https://github.com/james-alex/powers/blob/master/lib/src/powers.dart
import 'dart:math' as math;

/// Adds methods to get the square root of a `num` and to
/// determine if a `num` is square.
extension Powers on num {
  /// Returns the value of `this` squared.
  num squared() => this * this;

  /// Returns the square root of `this`.
  double sqrt() => root(2);

  /// Returns `true` if `this` equals a whole integer squared.
  bool get isSquare => isPowerOf(2);

  /// Returns the value of `this` cubed.
  num cubed() => this * this * this;

  /// Returns the cube root of `this`.
  double cbrt() => root(3);

  /// Returns `true` if `this` is equal to a whole integer cubed.
  bool get isCube => isPowerOf(3);

  /// Returns `this` to the power of [exponent].
  num pow(num exponent) => math.pow(this, exponent);

  /// Returns the root of `this` factored by [factor].
  ///
  /// __Note:__ The calculated value is multipled by `1000000000`, rounded,
  /// and divided by `1000000000` to account for rounding errors.
  double root(num factor) =>
      (math.pow(this, 1 / factor) * 1000000000).round() / 1000000000;

  /// Returns `true` if `this` is a valid power of [factor].
  bool isPowerOf(num factor) {
    final root = this.root(factor);
    return root > 0.0 && root.isValidInteger;
  }
}

/// Adds a getter to `double` that checks if it's a valid integer.
extension IsValidInteger on double {
  /// Returns `true` if `this` is a valid integer.
  bool get isValidInteger => remainder(truncate()) == 0;
}

/// Adds methods to return the root of a value as an `int`.
///
/// The methods will only work if `this` is the power of a valid integer.
extension RootToInt on int {
  /// Returns the square root of `this` as an `int`, but only if `this` is
  /// a valid square, otherwise throws an [InvalidPowerException].
  int sqrtToInt() {
    final sqrt = this.sqrt();

    if (!sqrt.isValidInteger) {
      throw (InvalidPowerException(2, this));
    }

    return sqrt.toInt();
  }

  /// Returns the cube root of `this` as an `int`, but only if `this` is
  /// a valid cube, otherwise throws an [InvalidPowerException].
  int cbrtToInt() {
    final cbrt = this.cbrt();

    if (!cbrt.isValidInteger) {
      throw (InvalidPowerException(3, this));
    }

    return cbrt.toInt();
  }

  /// Returns the root of `this` factored by [factor] as an `int`, but
  /// only if `this` is a valid power of [factor], otherwise throws an
  /// [InvalidPowerException].
  int rootToInt(num factor) {
    final root = this.root(factor);

    if (!root.isValidInteger) {
      throw (InvalidPowerException(factor, this));
    }

    return root.toInt();
  }
}

/// An exception thrown when the number being rooted isn't a
/// valid power of the value it's being factored by.
class InvalidPowerException implements Exception {
  const InvalidPowerException(num powerOf, num power)
      : message = '$power isn\'t a valid power of $powerOf.';

  /// A message describing the error.
  final String message;
}