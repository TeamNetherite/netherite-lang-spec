# Topaz Specification - Syntax :: Classes & Structures

## Classes

## `Struct`s

A `struct` is basically a class with a constructor generated for all its' fields, even private ones. You could override
this behavior by writing an `init` block yourself, but then you could just write a class instead.

Example `@struct`:
```tp
@struct
public class Human {
    public let age: int;
    
    func question_existence(&mut this) {}
} // ==
public class Human {
    public let age: int;
    init(age: int) {
        this.age = age;
    }
    
    func question_existence(&mut this) {}
}

func main() {
    let example_human = Human(age = 0);
}
```
