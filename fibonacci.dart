int fibonacci(int n) {
  return n < 2 ? n : fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  int i = 1000;

  print(fibonacci(i));
}