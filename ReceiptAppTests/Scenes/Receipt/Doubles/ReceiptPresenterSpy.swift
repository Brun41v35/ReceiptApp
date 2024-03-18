@testable import ReceiptApp

final class ReceiptPresenterSpy: ReceiptPresenterType {

    // MARK: - Internal Properties

    var viewController: ReceiptViewControllerType?

    // MARK: - Private

    private(set) var loadDataCallCount = 0

    // MARK: Methods

    func loadData() {
        loadDataCallCount += 1
    }
}
