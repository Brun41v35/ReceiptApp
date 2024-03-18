import XCTest
@testable import ReceiptApp

final class ReceiptListPresenterTests: XCTestCase {

    // MARK: - Properties

    private var networkMock: NetworkMock!
    private var adapterMock: ReceiptListAdapterMock!
    private var sut: ReceiptListPresenter!

    // MARK: - LifeCycle

    override func setUp() {
        super.setUp()
        networkMock = NetworkMock()
        adapterMock = ReceiptListAdapterMock()
        sut = ReceiptListPresenter(networkManager: networkMock,
                                   adapter: adapterMock)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    // MARK: - Tests

    func test_loadData_shouldCall_networkManagerEnvironmentOnce() {
        sut.loadData()

        XCTAssertEqual(networkMock.environmentCallCount, 1)
    }

    func test_loadData_shouldCall_adapterOnce() {
        sut.loadData()

        XCTAssertEqual(adapterMock.receiptDataArgs, [.stub()])
    }
}
