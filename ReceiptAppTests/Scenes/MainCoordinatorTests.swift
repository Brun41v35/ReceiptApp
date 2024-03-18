import XCTest
@testable import ReceiptApp

final class MainCoordinatorTests: XCTestCase {

    // MARK: - Properties

    private var navigationControllerMock: NavigationControllerMock!
    private var sut: MainCoordinator!

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

    func test_start_shouldCallReceiptListViewControllerWithPushAnimated() {
        sut.start()

        XCTAssertEqual(navigationControllerMock.pushViewControllerArgsAnimated, [true])
    }

    // MARK: - Helpers

    private func makeSUT() {
        navigationControllerMock = NavigationControllerMock()
        sut = MainCoordinator(navigationController: navigationControllerMock)
    }
}
