import iOSSnapshotTestCase
@testable import ReceiptApp

final class ReceiptListViewCellTests: FBSnapshotTestCase {

    // MARK: - Properties

    private var sut: ReceiptListViewCell!

    override func setUp() {
        super.setUp()
        makeSUT()
    }

    // MARK: - Tests

    func test_show_shouldHaveRightSnapshot() {
        FBSnapshotVerifyView(sut)
    }

    // MARK: - Helper

    private func makeSUT() {
        sut = ReceiptListViewCell()
        sut.show(viewModel: .stub())
        sut.frame.size = CGSize(width: 400, height: 90)
    }
}
