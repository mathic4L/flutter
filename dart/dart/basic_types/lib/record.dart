void positionalAndNamedFields() {
  /*
  named fields
    listed inside {}
      that follows positional ones
  */
  (String, String, {String named}) basic = ("hello", "world", named: "!");

  /*
  positional fields' names only go to docs
   */
  (String fst, String snd, {String named}) note =
      ("hello", "world", named: "!");
}

void instantiation() {
  /*
  named fields could be assigned at any position
  - positional ones gotta have corresponding position of assigment,
  relative to each other, as if excluding named ones
  */
  (String, String, {String namedA, String namedB}) instantiation =
      ("hello", namedA: " ", "world", namedB: "!");
}

void fieldAccessors() {
  (String fst, String snd, {String named}) record =
      ("fst", "scd", named: "named");
  print("the 'record' is (${record.$1}; ${record.$2}; ${record.named})");
}

void emptyRecord() {
  () emptyRecord = ();
}

void destructuring() {
  (String fst, String snd, {String named}) record =
      ("fst", "scd", named: "named");
  var (fst, snd, named: recordsNamed) = record;

  /*
  simpler destructuring named fields
  only corresponding record's named fields' names allowed in ':<name>'
   */
  var (a, b, :named) = record;
}
