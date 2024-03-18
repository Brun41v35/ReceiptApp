import XCTest
@testable import ReceiptApp

final class ReceiptViewControllerTests: XCTestCase {

    // MARK: - Properties

    private var contentViewSpy: ReceiptViewSpy!
    private var presenterSpy: ReceiptPresenterSpy!
    private var sut: ReceiptViewController!

    // MARK: - LifeCycle

    override func setUp() {
        super.setUp()
        makeSUT()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    // MARK: - Tests

    func test_viewDidLoad_shouldCallPresenterLoadDataOnce() {
        sut.viewDidLoad()

        XCTAssertEqual(presenterSpy.loadDataCallCount, 1)
    }

    func test_show_shouldCallContentViewWithRightInformations() {
        sut.show(viewModel: .stub())

        XCTAssertEqual(contentViewSpy.showViewModelArgs, [.stub()])
    }

    // MARK: - Helpers

    private func makeSUT() {
        contentViewSpy = ReceiptViewSpy()
        presenterSpy = ReceiptPresenterSpy()
        sut = ReceiptViewController(contentView: contentViewSpy,
                                    presenter: presenterSpy)
    }
}
