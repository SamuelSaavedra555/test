## Python API Documentation

### Write docstrings
Use Google-style or NumPy-style docstrings:
```python
def add(a: int, b: int) -> int:
    """Add two integers.

    Args:
        a: First integer.
        b: Second integer.

    Returns:
        Sum of a and b.

    Examples:
        >>> add(2, 3)
        5
    """
    return a + b
```

### Quick generation with pdoc
- Install: `python -m pip install pdoc`
- Generate HTML: `pdoc -o docs/api/generated/python <your_package_or_module>`
- Or serve locally: `pdoc -p 8080 <your_package_or_module>`

### Sphinx (larger projects)
- `python -m pip install sphinx sphinx-autodoc-typehints`
- `sphinx-quickstart docs/sphinx`
- Enable `extensions = ['sphinx.ext.autodoc', 'sphinx_autodoc_typehints']`
- `sphinx-apidoc -o docs/sphinx/source <package_root>`
- `sphinx-build -b html docs/sphinx docs/api/generated/python`

### Tips
- Keep public APIs in `__all__` to control what gets documented
- Prefer type hints for clearer docs