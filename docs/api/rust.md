## Rust API Documentation

### Write rustdoc comments
Use triple slashes above items:
```rust
/// Adds two numbers.
///
/// # Examples
/// ```
/// assert_eq!(my_crate::add(2, 3), 5);
/// ```
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
```

### Generate docs
- From crate root, run: `cargo doc --no-deps`
- Output: `target/doc/<crate_name>/index.html`
- You can set `CARGO_TARGET_DIR=docs/api/generated/rust` to emit under docs

### Tips
- Public items (`pub`) are documented by default
- Use `#[doc(hidden)]` to hide internals