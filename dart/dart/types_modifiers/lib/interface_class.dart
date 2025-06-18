void interfaceClass() {
  var pet1 = Pet(10, 10);
  var animal = Animal(10, 10);
}

interface class Animal {
  /*
  interface constructors don't exist to implementers
    despite that, they could be provided
   */
  Animal(this.height, this.weight);

  /*
  adds up getters&setters to the interface
   */
  double height;
  double weight;

  void voice() {
    print('voice');
  }

  void doubleVoice() {
    voice();
    voice();
  }
}

class Pet implements Animal {
  Pet(this.height, this.weight);

  /*
  fields declaration results in implicit getters&setters
  declaration&implementation, that are required by interface class
   */
  @override
  double height;
  @override
  double weight;

  @override
  void doubleVoice() {
    var animal = Pet(1, 1);
  }

  @override
  void voice() {}
}
