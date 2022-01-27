@testable import StringDash
import XCTest

final class StringDashTests: XCTestCase {
    func testCamelCase() throws {
        XCTAssertEqual(StringDash.camelCase("foo bar"), "fooBar")
        XCTAssertEqual(StringDash.camelCase("foo bar", "sunday monday"), "fooBarSundayMonday")
        XCTAssertEqual(StringDash.camelCase("Foo Bar"), "fooBar")
        XCTAssertEqual(StringDash.camelCase("foo", "bar"), "fooBar")
        XCTAssertEqual(StringDash.camelCase("--foo-bar--"), "fooBar")
        XCTAssertEqual(StringDash.camelCase("__FOO_BAR__"), "fooBar")
    }

    func testCapitalize() throws {
        XCTAssertEqual(StringDash.capitalize("foo bar"), "Foo Bar")
        XCTAssertEqual(StringDash.capitalize("FOO BAR"), "Foo Bar")
        XCTAssertEqual(StringDash.capitalize("foo", "BAR"), "FooBar")
    }

    func testEndsWith() throws {
        XCTAssertEqual(StringDash.endsWith("abc", suffix: "c"), true)
        XCTAssertEqual(StringDash.endsWith("abc123", suffix: "c", position: 2), true)
        XCTAssertEqual(StringDash.endsWith("abc123", suffix: "c", position: 100), false)
    }

    func testEscape() throws {
        XCTAssertEqual(StringDash.escape("abc"), "abc")
        XCTAssertEqual(StringDash.escape("a&b"), "a&amp;b")
        XCTAssertEqual(StringDash.escape("a<b"), "a&lt;b")
        XCTAssertEqual(StringDash.escape("a>b"), "a&gt;b")
        XCTAssertEqual(StringDash.escape(#"have a "good time""#), "have a &quot;good time&quot;")
        XCTAssertEqual(StringDash.escape(#"have a 'good time'"#), "have a &apos;good time&apos;")
    }

    func testUnescape() throws {
        XCTAssertEqual(StringDash.unescape("abc"), "abc")
        XCTAssertEqual(StringDash.unescape("a&amp;b"), "a&b")
        XCTAssertEqual(StringDash.unescape("a&lt;b"), "a<b")
        XCTAssertEqual(StringDash.unescape("a&gt;b"), "a>b")
        XCTAssertEqual(StringDash.unescape(#"have a &quot;good time&quot;"#), #"have a "good time""#)
        XCTAssertEqual(StringDash.unescape(#"have a &apos;good time&apos;"#), #"have a 'good time'"#)
    }

    func testEscapeRegEx() throws {
        XCTAssertEqual(StringDash.escapeRegEx("abc"), "abc")
        XCTAssertEqual(StringDash.escapeRegEx("[lodash](https://lodash.com/)"), #"\[lodash]\(https:\/\/lodash\.com\/\)"#)
    }

    func testKebabCase() throws {
        XCTAssertEqual(StringDash.kebabCase("fooBar"), "foo-bar")
        XCTAssertEqual(StringDash.kebabCase("Foo Bar"), "foo-bar")
        XCTAssertEqual(StringDash.kebabCase("foo-bar"), "foo-bar")
        XCTAssertEqual(StringDash.kebabCase("__FOO_BAR__"), "foo-bar")
    }

    func testLowercase() throws {
        XCTAssertEqual(StringDash.lowerCase("foo-bar"), "foo bar")
        XCTAssertEqual(StringDash.lowerCase("--Foo-Bar--"), "foo bar")
        XCTAssertEqual(StringDash.lowerCase("__FOO_BAR__"), "foo bar")
    }

    func testLowerFirst() throws {
        XCTAssertEqual(StringDash.lowerFirst("Fred"), "fred")
        XCTAssertEqual(StringDash.lowerFirst("FRED"), "fRED")
    }

    func testPad() throws {
        XCTAssertEqual(StringDash.pad("abc", length: 1), "abc")
        XCTAssertEqual(StringDash.pad("abc", length: 9), "   abc   ")

        XCTAssertEqual(StringDash.pad("abc", length: 7, padding: "_-"), "_-abc_-")
        XCTAssertEqual(StringDash.pad("abc", length: 8, padding: "_-"), "_-abc_-_")
        XCTAssertEqual(StringDash.pad("abc", length: 9, padding: "_-"), "_-_-abc_-")
        XCTAssertEqual(StringDash.pad("abc", length: 10, padding: "_-"), "_-_-abc_-_")
        XCTAssertEqual(StringDash.pad("abc", length: 11, padding: "_-"), "_-_-abc_-_-")
    }

    func testPadEnd() throws {
        XCTAssertEqual(StringDash.padEnd("abc", length: 1), "abc")
        XCTAssertEqual(StringDash.padEnd("abc", length: 9), "abc      ")

        XCTAssertEqual(StringDash.padEnd("abc", length: 7, padding: "_-"), "abc_-_-")
        XCTAssertEqual(StringDash.padEnd("abc", length: 8, padding: "_-"), "abc_-_-_")
    }

    func testPadStart() throws {
        XCTAssertEqual(StringDash.padStart("abc", length: 1), "abc")
        XCTAssertEqual(StringDash.padStart("abc", length: 9), "      abc")

        XCTAssertEqual(StringDash.padStart("abc", length: 7, padding: "_-"), "_-_-abc")
        XCTAssertEqual(StringDash.padStart("abc", length: 8, padding: "_-"), "_-_-_abc")
    }

    func testSnakeCase() throws {
        XCTAssertEqual(StringDash.snakeCase("fooBar"), "foo_bar")
        XCTAssertEqual(StringDash.snakeCase("Foo Bar"), "foo_bar")
        XCTAssertEqual(StringDash.snakeCase("foo-bar"), "foo_bar")
        XCTAssertEqual(StringDash.snakeCase("__FOO_BAR__"), "foo_bar")
    }

    func testSplit() throws {
        XCTAssertEqual(StringDash.split("a-b-c", separator: "x"), ["a-b-c"])
        XCTAssertEqual(StringDash.split("a-b-c", separator: "a"), ["-b-c"])
        XCTAssertEqual(StringDash.split("a-b-c", separator: "a", limit: 1), ["-b-c"])
        XCTAssertEqual(StringDash.split("a-b-c", separator: "-"), ["a", "b", "c"])
        XCTAssertEqual(StringDash.split("a-b-c", separator: "-", limit: 2), ["a", "b"])
    }

    func testStartCase() throws {
        XCTAssertEqual(StringDash.startCase("fooBar"), "Foobar")
        XCTAssertEqual(StringDash.startCase("--foo-bar--"), "Foo Bar")
        XCTAssertEqual(StringDash.startCase("__FOO_BAR__"), "FOO BAR")
    }

    func testTrim() throws {
        XCTAssertEqual(StringDash.trim("fooBar   "), "fooBar")
        XCTAssertEqual(StringDash.trim("   fooBar   "), "fooBar")
    }

    func testUppercase() throws {
        XCTAssertEqual(StringDash.upperCase("foo-bar"), "FOO BAR")
        XCTAssertEqual(StringDash.upperCase("--Foo-Bar--"), "FOO BAR")
        XCTAssertEqual(StringDash.upperCase("__FOO_BAR__"), "FOO BAR")
    }

    func testUpperFirst() throws {
        XCTAssertEqual(StringDash.upperFirst("fred"), "Fred")
        XCTAssertEqual(StringDash.upperFirst("FRED"), "FRED")
    }
}
