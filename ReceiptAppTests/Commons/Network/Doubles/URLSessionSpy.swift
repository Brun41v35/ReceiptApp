import Foundation
@testable import ReceiptApp

final class URLSessionSpy: URLSessionType {

    // MARK: - Private Properties

    private(set) var dataTaskURL: URL?
    private(set) var dataTaskWasCalled: Bool = false
    private(set) var dataTaskCount: Int = 0
    private var urlSessionData: URLSessionDataDummy

    // MARK: - Init

    init(urlSessionData: URLSessionDataDummy) {
        self.urlSessionData = urlSessionData
    }

    // MARK: - Internal

    var dataReturned: Data?
    var responseReturned: URLResponse?
    var errorReturned: Error?
    var result: (Result<Data, Error>)?

    func dataTask(with url: URL, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskURL = url
        dataTaskWasCalled = true
        dataTaskCount += 1
        
        completionHandler(dataReturned, responseReturned, errorReturned)

        return urlSessionData
    }
}
