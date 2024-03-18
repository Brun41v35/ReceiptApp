import XCTest
@testable import ReceiptApp

final class ReceiptPresenterTests: XCTestCase {

    private var viewControllerSpy: ReceiptViewControllerSpy!
    private var sut: ReceiptPresenter!
    
    override func setUp() {
        super.setUp()
        makeSUT()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_loadData_shouldCallViewControllerWithRightViewModel() {
        sut.loadData()

        XCTAssertEqual(viewControllerSpy.showViewModelArgs, [.stub()])
    }

    private func makeSUT() {
        viewControllerSpy = ReceiptViewControllerSpy()
        sut = ReceiptPresenter(informations: .stub())
        sut.viewController = viewControllerSpy
    }
}
