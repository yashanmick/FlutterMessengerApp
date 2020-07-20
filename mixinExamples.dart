void main() {
  //Fish().move();
  //Bird().move();
}

class Animal {
  void move() {
    print('changed position');
  }
}

class Fish extends Animal with CanSwim {

}


class Bird extends Animal with CanFly {

}


mixin CanSwim {
  void swim(){
    print('Changing position by swimming');
  }
}

mixin CanFly {
  void fly(){
    print('Changing position by flying');
  }
}


// class Duck extends Animal with CanSwim, CanFly {

// }

class Airplane with CanFly {

}