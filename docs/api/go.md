## Go API Documentation

### Doc comments
```go
// Package mathutil provides math helpers.
package mathutil

// Add returns the sum of a and b.
//
// Example:
//  Add(2, 3) // 5
func Add(a, b int) int { return a + b }
```

### Generate/serve docs
- `go doc ./...` prints documentation in the terminal
- Local site with pkgsite: `go install golang.org/x/pkgsite/cmd/pkgsite@latest`
  - `pkgsite -http=:6060` then browse `http://localhost:6060`
- Legacy godoc: `go install golang.org/x/tools/cmd/godoc@latest`
  - `godoc -http=:6060`

### Tips
- Exported identifiers (capitalized) are public and documented
- Keep examples in `_test.go` files with `ExampleXxx` functions to show up in docs