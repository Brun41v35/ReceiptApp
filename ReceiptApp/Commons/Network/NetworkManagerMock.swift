import Foundation

final class NetworkManagerMock: NetworkManagerType {

    func fetchData(completion: @escaping (Result<ReceiptData, APIError>) -> Void) {

        guard let path = Bundle.main.path(forResource: "receiptData", ofType: "json") else { return }
        let url = URL(filePath: path)

        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let response = try decoder.decode(ReceiptData.self, from: data)
            completion(.success(response))
        } catch {
            completion(.failure(.invalidData))
        }
    }
}
