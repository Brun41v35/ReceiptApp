import iOSSnapshotTestCase
@testable import ReceiptApp

final class ReceiptViewTests: FBSnapshotTestCase {

    // MARK: - Properties

    private var sut: ReceiptView!

    // MARK: - LifeCycle

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
        sut = ReceiptView()
        sut.show(viewModel: .stub())
        sut.frame.size = CGSize(width: 400, height: 400)
    }
}
