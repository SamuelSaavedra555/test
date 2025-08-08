## JavaScript / TypeScript API Documentation

### Write documentation comments
Use TSDoc/JSDoc comments directly in your source:
```ts
/**
 * Compute the sum of two numbers.
 * @example
 * sum(2, 3) // => 5
 */
export function sum(a: number, b: number): number {
  return a + b;
}
```

For JavaScript (no types):
```js
/**
 * @param {number} a
 * @param {number} b
 * @returns {number}
 * @example
 * sum(2, 3) // => 5
 */
export function sum(a, b) {
  return a + b;
}
```

### Generate docs with TypeDoc
- Install: `npm i -D typedoc typedoc-plugin-markdown` (Markdown) or just `typedoc` (HTML)
- Add `typedoc.json`:
```json
{
  "entryPoints": ["src/index.ts"],
  "out": "docs/api/generated/ts",
  "plugin": ["typedoc-plugin-markdown"],
  "excludePrivate": true,
  "excludeProtected": true
}
```
- Run: `npx typedoc`

If using JavaScript, set `--entryPoints` to your JS files and enable `--allowJs` in `tsconfig.json`.

### Usage examples in docs
- Prefer `@example` blocks inside comments
- Add separate `docs/examples/*.md` with runnable snippets

### Tips
- Export only public API from package entry (`src/index.ts`) to keep docs focused
- Use `@public`/`@internal` tags (supported by TypeDoc via visibility options)