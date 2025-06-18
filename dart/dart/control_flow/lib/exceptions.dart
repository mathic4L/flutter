/*
throw <exc>

rethrow
  rethrows
  available in handling clause only

on <type>
  available inside 'try' only

catch (<exception var>, <stacktrace var>)
  provides handling clause with exception and stacktrace instance
  available inside 'try' only

try
  works for both sync and async environments

finally
  works anyway and after all catch clauses

 */

void exceptions() {
  try {
    breedMoreLlamas();
  } on OutOfLlamasException {
    // A specific exception
    buyMoreLlamas();
  } on Exception catch (e) {
    // Anything else that is an exception
    print('Unknown exception: $e');
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
  }
}