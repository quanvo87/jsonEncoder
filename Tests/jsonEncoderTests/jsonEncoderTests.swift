#if os(macOS) && swift(>=4)
    import XCTest
    import Foundation
    @testable import jsonEncoder

    class jsonEncoderTests: XCTestCase {
        func testExample() throws {

            let originalUser = User(id: UUID().uuidString,
                            name: "Mario",
                            address: Address(number: 123,
                                             street: "Mushroom St",
                                             type: .apartment),
                            registered: true)

            print("original user: \(originalUser)\n")

            let encodedUser = try JSONEncoder().encode(originalUser)
            print("encoded user: \(String(data: encodedUser, encoding: .utf8) ?? "ERROR")\n")

            let decodedUser = try JSONDecoder().decode(User.self, from: encodedUser)
            print("decoded user: \(decodedUser)\n")

            XCTAssertEqual(originalUser, decodedUser)

            // Limitations: Runtime crash on arrays
        }
    }

    extension jsonEncoderTests {
        override func setUp() {
            print("\nTEST START\n")
        }

        override func tearDown() {
            print("TEST END\n")
        }
    }
#endif
