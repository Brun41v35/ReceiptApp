import Foundation

protocol NetworkManagerType {
    func fetchData(completion: @escaping (Result<ReceiptData, APIError>) -> Void)
}

protocol URLSessionType {
    func dataTask(with url: URL, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

protocol NetworkingType {
    func environment() -> NetworkManagerType
}
