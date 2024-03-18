@testable import ReceiptApp

final class NetworkMock: NetworkingType {

    // MARK: - Internal Properties

    var environmentReturn: NetworkManagerType = NetworkManagerMock()

    // MARK: - Private Properties

    private(set) var environmentCallCount = 0

    // MARK: - Internal Methods

    func environment() -> NetworkManagerType {
        environmentCallCount += 1
        return environmentReturn
    }
}
