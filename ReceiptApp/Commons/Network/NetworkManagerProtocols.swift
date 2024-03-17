import Foundation

protocol NetworkManagerType {
    func fetchData(completion: @escaping (Result<ReceiptData, APIError>) -> Void)
}
