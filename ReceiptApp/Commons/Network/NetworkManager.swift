import Foundation

final class NetworkManager {

    // MARK: - Private Properties

    private let url = "https://jsonplaceholder.typicode.com/"
    private var session: URLSessionType

    // MARK: - init

    init(session: URLSessionType = URLSession.shared) {
        self.session = session
    }
}

// MARK: - NetworkManager

extension NetworkManager: NetworkManagerType {

    func fetchData(completion: @escaping (Result<ReceiptData, APIError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let _ = error else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(ReceiptData.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}

extension URLSession: URLSessionType {}
