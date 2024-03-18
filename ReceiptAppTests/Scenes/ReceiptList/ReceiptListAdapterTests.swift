import XCTest
@testable import ReceiptApp

final class ReceiptListAdapterTests: XCTestCase {

    // MARK: - Properties

    private var sut: ReceiptListAdapter!

    // MARK: - LifeCycle

    override func setUp() {
        super.setUp()
        sut = ReceiptListAdapter()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    // MARK: - Tests

    func test_adapt_shouldAdaptCorrect() {
        let capturedValue = sut.adapt(with: .stub())
        let expectedValue = [ReceiptListViewModelCell.stub()]

        XCTAssertEqual(capturedValue, expectedValue)
    }
}
