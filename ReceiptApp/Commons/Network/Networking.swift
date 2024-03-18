import Foundation

final class Networking {

    // MARK: - Private Properties

    private let factory: FactoryNetworkingType

    // MARK: - Init
    
    init(factoryNetworking: FactoryNetworkingType) {
        self.factory = factoryNetworking
    }
}

// MARK: - NetworkManagerType

extension Networking: NetworkingType {

    func environment() -> NetworkManagerType {
        
        guard let isMocked = ProcessInfo.processInfo.environment["Mocked"] else {
            return factory.build(with: .real)
        }
        
        return isMocked == "true" ? factory.build(with: .mock) : factory.build(with: .real)
    }
}
