@testable import ReceiptApp

final class ReceiptListPresenterSpy: ReceiptListPresenterType {

    // MARK: - Internal Properties

    var viewController: ReceiptListViewControllerType?

    // MARK: - Private

    private(set) var loadDataCallCount = 0

    // MARK: Methods

    func loadData() {
        loadDataCallCount += 1
    }
}
