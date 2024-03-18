import iOSSnapshotTestCase
@testable import ReceiptApp

final class ReceiptListViewCellTests: FBSnapshotTestCase {

    // MARK: - Properties

    private var sut: ReceiptListViewCell!

    // MARK: - LifeCycle

    override func setUp() {
        super.setUp()
        makeSUT()
    }

    // MARK: - Tests

    func test_show_shouldHaveRightSnapshot() {
        FBSnapshotVerifyView(sut)
    }

    func test_init_shouldHaveRightAccessibilityTraits() {
        XCTAssertEqual(sut.accessibilityTraits, .button)
    }

    func test_init_shouldHaveRightAccessibilityLabel() {
        XCTAssertEqual(sut.accessibilityLabel, "Transferência")
    }

    func test_init_shouldHaveRightAccessibilityValue() {
        XCTAssertEqual(sut.accessibilityValue, "Débora dos Santos, qua, 27 de abril de 2022, R$ 5.000,00")
    }

    // MARK: - Helper

    private func makeSUT() {
        sut = ReceiptListViewCell()
        sut.show(viewModel: .stub())
        sut.frame.size = CGSize(width: 400, height: 90)
    }
}
