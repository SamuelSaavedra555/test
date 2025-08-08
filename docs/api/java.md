## Java API Documentation

### Javadoc comments
```java
/**
 * Utilities for math operations.
 */
public final class MathUtil {
  private MathUtil() {}

  /**
   * Adds two integers.
   * @param a first integer
   * @param b second integer
   * @return sum of a and b
   * @example
   * // MathUtil.add(2, 3) => 5
   */
  public static int add(int a, int b) { return a + b; }
}
```

### Generate docs
- Typical Maven project: `mvn javadoc:javadoc` (outputs to `target/site/apidocs`)
- Gradle: `./gradlew javadoc` (outputs to `build/docs/javadoc`)
- Plain Java: `javadoc -d docs/api/generated/java -sourcepath src/main/java -subpackages your.base.package`

### Tips
- Keep public API small and cohesive
- Use `@since`, `@deprecated`, and `@throws` tags