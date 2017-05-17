// https://swift.org/download/#snapshots
// https://github.com/apple/swift-evolution/blob/master/proposals/0166-swift-archival-serialization.md
// https://github.com/apple/swift-evolution/blob/master/proposals/0167-swift-encoders.md

#if os(macOS) && swift(>=4)
    import Foundation

    struct User: Codable {
        let id: String
        let name: String
        let address: Address
        let registered: Bool
    }

    struct Address: Codable {
        let number: Int
        let street: String
        let type: AddressType
    }

    enum AddressType: String, Codable {
        case home
        case apartment
        case business
    }

    // MARK: - Extensions
    extension User: Equatable {
        static func ==(lhs: User, rhs: User) -> Bool {
            return  lhs.id          == rhs.id &&
                    lhs.name        == rhs.name &&
                    lhs.address     == rhs.address &&
                    lhs.registered  == rhs.registered
        }
    }

    extension Address: Equatable {
        static func ==(lhs: Address, rhs: Address) -> Bool {
            return  lhs.number  == rhs.number &&
                    lhs.street  == rhs.street &&
                    lhs.type    == rhs.type
        }
    }
#endif
