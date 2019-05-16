import XCTest
import sox
@testable import SwiftSox

final class SwiftSoxTests: XCTestCase {


    func testRead() {
        InitSox()
        // let fd = sox_open_read("sounds/beep-01a.mp3", nil, nil, nil).pointee
        let packageRootPath = URL(fileURLWithPath: #file).pathComponents
            .prefix(while: { $0 != "Tests" }).joined(separator: "/").dropFirst()
        let testSoundPath = packageRootPath + "/sounds/beep-01a.mp3"

        let soundPath = String(testSoundPath)
        let fd = sox_open_read(soundPath, nil, nil, nil).pointee
        let sig = fd.signal
        XCTAssertEqual(sig.rate, 44100.0)
        XCTAssertEqual(sig.precision, 16)
        XCTAssertEqual(sig.channels, 1)
        XCTAssert(sig.length > 0)
    }

    func testReadSwift() {
        let packageRootPath = URL(fileURLWithPath: #file).pathComponents
            .prefix(while: { $0 != "Tests" }).joined(separator: "/").dropFirst()
        let testSoundPath = packageRootPath + "/sounds/beep-01a.mp3"

        let soundPath = String(testSoundPath)
        let fd = ReadSoxAudio(soundPath)
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
