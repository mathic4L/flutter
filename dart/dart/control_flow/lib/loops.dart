/*
for
  for loop
  for-in (aka for-each) loop; works with iterable only
    for-in with destructuring pattern
    forEach() method

while
  while loop
  do while loop

break & continue
 */

class Candidate {
  Candidate(this.name, this.yearsExperience);

  final String name;
  final int yearsExperience;

  String abc() => "abc";
}

void forInWithPattern() {

  final List<Candidate> candidates = [
    Candidate('John', 5),
    Candidate('Jane', 3),
    Candidate('Jack', 8),
    Candidate('Jill', 2),
  ];

  for (final Candidate(:name, :yearsExperience) in candidates) {
    print('$name has $yearsExperience of experience.');
  }
}
