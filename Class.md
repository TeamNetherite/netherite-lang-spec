# Topaz Specification - Syntax :: Classes & Structures

## Classes

## `Struct`s

A `struct` is basically a class with a constructor generated for all its' fields, even private ones. You could override
this behavior by writing an `init` block yourself, but then you could just write a class instead.

Example `struct`:
```tp
public struct Human {
    public age: int;
}

func main() {
    val example_human = Human(age = 
}
```
