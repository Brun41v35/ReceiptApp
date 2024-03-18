import XCTest
@testable import ReceiptApp

final class ReceiptListPresenterTests: XCTestCase {

    // MARK: - Properties

    private var networkManagerMock: NetworkManagerMock!
    private var adapterMock: ReceiptListAdapterMock!
    private var sut: ReceiptListPresenter!

    // MARK: - LifeCycle

    override func setUp() {
        super.setUp()
        networkManagerMock = NetworkManagerMock()
        adapterMock = ReceiptListAdapterMock()
        sut = ReceiptListPresenter(networkManager: networkManagerMock,
                                   adapter: adapterMock)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    // MARK: - Tests

    func test_loadData_shouldCall_networkManagerFetchDataOnce() {
        sut.loadData()

        XCTAssertEqual(networkManagerMock.fetchDataCallCount, 1)
    }

    func test_loadData_shouldCall_adapterOnce() {
        sut.loadData()

        XCTAssertEqual(adapterMock.receiptDataArgs, [.stub()])
    }
}
