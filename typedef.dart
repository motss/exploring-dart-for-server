typedef Compare = int Function(Object a, Object b);
typedef CompareWithTypes<T> = int Function(T a, T b);

class SortedCollection {
  Compare compare;

  SortedCollection(this.compare);
}

int sort(Object a, Object b) => 0;
int sortInteger(int a, int b) => a - b;

void main() {
  SortedCollection coll = SortedCollection(sort);

  print(coll.compare is Function);
  print(coll.compare is Compare);

  print(sortInteger is CompareWithTypes<int>);
}