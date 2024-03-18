import Foundation

enum Environment {
    case mock
    case real
}

struct FactoryNetworking: FactoryNetworkingType {

    func build(with environment: Environment) -> NetworkManagerType {
        switch environment {
        case .mock:
            return NetworkManagerMock()
        case .real:
            return NetworkManager()
        }
    }
}
