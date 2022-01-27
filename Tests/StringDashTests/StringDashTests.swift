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
}
