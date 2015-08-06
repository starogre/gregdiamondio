//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  printAlert() {
    for (var i = 0; i < age; i++) {
      alert(`Person ${this.name}: ${this.age}!`);
    }
  }
}


function testFunction() {
  let testVar = new Person("Gary", 3);

  testVar.printAlert();
}
