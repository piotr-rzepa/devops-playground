import pytest


@pytest.mark.parametrize(
    ("input", "expected"),
    [
        (-1 + 0, -1),
        (1 + 2, 3),
        (3 + 4, 7),
        (5 + 6, 11),
        (7 + 8, 15),
    ],
)
def test_simple_arithmetic_operation(input: int, expected: int) -> None:
    assert input == expected
