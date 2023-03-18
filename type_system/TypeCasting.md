# Topaz Specification - Type system :: Type casting

## Syntax

The type casting syntax is as follows:

```tp
value as Type
```

## Behavior

If the value is a reference, and the type is a reference type `&T` or `&mut T`,
Topaz will treat the memory stored at the address of that reference as `T`.
The compiler should emit an error
