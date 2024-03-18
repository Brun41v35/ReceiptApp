import XCTest
@testable import ReceiptApp

final class NetworkManagerTests: XCTestCase {

    // MARK: - Private Properties

    private var sessionDataDummy: URLSessionDataDummy!
    private var urlSessionSpy: URLSessionSpy!
    private var sut: NetworkManager!

    // MARK: - LifeCycle

    override func setUp() {
        super.setUp()
        sessionDataDummy = URLSessionDataDummy()
        urlSessionSpy = URLSessionSpy(urlSessionData: sessionDataDummy)
        sut = NetworkManager(session: urlSessionSpy)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    // MARK: - Tests

    func test_fetchData_wasCalled() {
        sut.fetchData { _ in }
        
        XCTAssertTrue(urlSessionSpy.dataTaskWasCalled)
    }

    func test_fetchData_networkSessionWasCalledOnlyOnce() {
        sut.fetchData { _ in }

        XCTAssertEqual(urlSessionSpy.dataTaskCount, 1)
    }
}

extension Data {
    static func fixtureData() -> Self? {
        """
            {
                author: Teste
            }
        """.data(using: .utf8)
    }
}

extension URL {
    static func fixtureURL() -> Self {
        .init(string: "https://www.some.com")!
    }
}

extension ReceiptData {
    static func stub() -> Self {
        return ReceiptData(data: .stub())
    }

    static func stubData() -> Data {
        """
        {
            "data": {
                "receipts": [
                    {
                        "title": "Transferência",
                        "receiptId": "112312",
                        "name": "Débora dos Santos",
                        "receiverName": "João da Silva",
                        "amount": "R$ 5.000,00",
                        "control": "HDUS36217367127DS",
                        "date": "qua, 27 de abril de 2022"
                    }
                ]
            }
        }
        """.data(using: .utf8)!
    }
}

extension Receipts {

    static func stub() -> Self {
        return Receipts(receipts: [.stub()])
    }
}

extension Informations {

    static func stub(title: String = "Transferência",
                     receiptId: String = "112312",
                     name: String = "Débora dos Santos",
                     receiverName: String = "João da Silva",
                     amount: String = "R$ 5.000,00",
                     control: String = "HDUS36217367127DS",
                     date: String = "qua, 27 de abril de 2022") -> Self {

        Informations(title: title,
                     receiptId: receiptId,
                     name: name,
                     receiverName: receiverName,
                     amount: amount,
                     control: control,
                     date: date)
    }
}
