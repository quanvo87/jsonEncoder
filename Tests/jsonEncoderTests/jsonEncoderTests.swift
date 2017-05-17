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

            let encodedUser: Data = try JSONEncoder().encode(originalUser)
            print("encoded user: \(String(data: encodedUser, encoding: .utf8) ?? "ERROR")\n")

            let decodedUser: User = try JSONDecoder().decode(User.self, from: encodedUser)
            print("decoded user: \(decodedUser)\n")

            XCTAssertEqual(originalUser, decodedUser)

            print("decoded id: \(decodedUser.id)")
            print("decoded name: \(decodedUser.name)")
            print("decoded address: \(decodedUser.address)")
            print("decoded registered: \(decodedUser.registered)\n")

            /*
             Accomplishes:
             - Don't have to do this: https://developer.apple.com/swift/blog/?id=37
             - Limit need for SwiftyJSON

             Limitations/Bugs:
             - Runtime crash when struct has an array property
             - If arrays are not allowed/implemented yet, then possible compile bug
             */
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
