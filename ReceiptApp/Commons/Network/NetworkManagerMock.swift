import Foundation

final class NetworkManagerMock: NetworkManagerType {

    func fetchData(completion: @escaping (Result<ReceiptData, APIError>) -> Void) {}
}
