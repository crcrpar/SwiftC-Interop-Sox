import XCTest
import sox
@testable import SwiftSox

final class SwiftSoxTests: XCTestCase {

    fileprivate let packageRootPath = URL(fileURLWithPath: #file).pathComponents
        .prefix(while: { $0 != "Tests" }).joined(separator: "/").dropFirst()
    fileprivate let testSoundPath = packageRootPath + "/sounds/beep-01a.mp3"

    func testRead() {
        InitSox()
        let fd = sox_open_read(testSoundPath!, nil, nil, nil).pointee
        let sig = fd.signal
        XCTAssertEqual(sig.rate, 44100.0)
        XCTAssertEqual(sig.precision, 15)
        XCTAssertEqual(sig.channels, 1)
        XCTAssert(sig.length > 0)
    }

    func testReadSwift() {
        let fd = ReadSoxAudio(testSoundPath!)
        let sig = fd.pointee.signal
        XCTAssertEqual(sig.rate, 44100)
        XCTAssertEqual(sig.precision, 16)
        XCTAssertEqual(sig.channels, 1)
        XCTAssert(sig.length > 0)
    }

    static var allTests = [
        ("testRead", testRead),
        ("testReadSwift", testReadSwift),
    ]
}
