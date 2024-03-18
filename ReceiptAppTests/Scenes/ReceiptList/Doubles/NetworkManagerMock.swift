import Foundation
@testable import ReceiptApp

final class NetworkManagerMock: NetworkManagerType {

    // MARK: - Responses

    var fetchReceiptData: Result<ReceiptData, APIError> = {
        return .success(.stub())
    }()

    // MARK: - Private

    private(set) var fetchDataCallCount = 0

    // MARK: - Internal Methods

    func fetchData(completion: @escaping (Result<ReceiptData, APIError>) -> Void) {
        fetchDataCallCount += 1
        completion(fetchReceiptData)
    }
}
