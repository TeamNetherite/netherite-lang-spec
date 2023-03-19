# Topaz Specification — Attributes

Attributes are like Procedural Macros in Rust, the only difference is - Topaz Attributes are a lot more powerful.

Attributes are divided into two types:

- Compiler Attributes
- Procedural Macros (TODO)

## Compiler Attributes

Compiler Attributes are attributes that are handled by the compiler, and do something that procedural macros can't.

An example of a Compiler Attribute, here generating fields on Enum variants, and another one, putting the variant's name
into `full_name`, and another one, generating a `VALUES` constant, containing all the variants:

```tp
@values
enum Gamemode {
    @let short_code = "s";
    @let short_num = 0;
    Human
}

impl Gamemode {
    @enum_name
    let full_name: String;
    let short_code: String;
    let short_num: byte;
}
```
