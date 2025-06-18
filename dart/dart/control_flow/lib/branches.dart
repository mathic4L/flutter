/*
branches
  if statements and elements
  if-case statements and elements
  switch statements and expressions
 */

/*
if-case statements and elements

if (<value> case <pattern>) {...}
allows to match against SINGLE pattern
 */
void ifCase() {
  final personalInformation = {
    (name: 'john smith', age: 25),
    (name: 'jane doe', age: 30),
    (name: 'jack doe', age: 35),
  };

  personalInformation.forEach((personalInformation) {
    if (personalInformation.name case 'doe') {
      print('${personalInformation.name} has \'doe\' surname');
    }
  });
}

/*
switch statements

switch (<expression>) {
  case <patternA>: ...;
  case <patternB>: ...;
}
allows to match against MULTIPLE patterns

Non-empty case clauses jump to the end of the switch after completion;
  they do not require 'break'
Empty cases fall through to the next case, allowing cases to share a body
For an empty case that does not fall through, use break for its body
  For non-sequential fall-through, you can use 'continue' and a label
You can use logical-or patterns to allow cases to share a body or a guard
 */
void switchCase() {
  var command = 'OPEN';
  switch (command) {
    case 'OPEN':
      print('executeOpen');
      continue newCase; // Continues executing at the newCase label.

    case 'DENIED': // Empty case falls through.
    case 'CLOSED':
      print('executeClosed'); // Runs for both DENIED and CLOSED,

    newCase:
    case 'PENDING':
      print('executeNowClosed'); // Runs for both OPEN and PENDING.
  }
}

/*
switch expressions

 */
