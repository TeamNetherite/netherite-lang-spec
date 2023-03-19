# Topaz Specification - Gemstone

A Gemstone, in the Topaz ecosystem, is like a `crate` in Rust. It is either a binary gemstone, or a library gemstone.

A Gemstone itself is a `mod`ule and could contain [Items](./Items.md), like functions, or other `mod`ules; it could also
depend on other Gemstones, by statically/dynamically linking them to your Gemstone or by using Lapis.
