"""Tests for the hello module."""
import hello
import pytest


def test_get_message():
    actual = hello.get_message()
    expected = "I ♡ templates"
    assert expected == actual


def test_main(capsys):
    hello.main()

    # Get captured stdout, remove whitespace and split on newline
    actual = capsys.readouterr().out.strip().split("\n")
    expected = ["I ♡ templates", "I ♡ templates"]
    assert expected == actual


@pytest.mark.skip()
def test_new_function():
    actual = hello.new_function(15)
    expected = 32
    assert expected == actual
