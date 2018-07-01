import 'dart:async';
import 'dart:math' deferred as math;

Future<double> doStuff({
  x = 0,
  y = 0,
}) async {
  /** BUG: https://github.com/dart-lang/sdk/issues/33118 */
  await math.loadLibrary();

  return await math.sqrt(math.pow(x, 2) + math.pow(y, 2));
}

void main() async {
  var a = await doStuff(x: 4, y: 2);

  print(a);
}