import UIKit
@testable import ReceiptApp

final class ReceiptListViewSpy: UIView {

    // MARK: - Properties

    private(set) var dataSourceArgs = [UITableViewDataSource]()
    private(set) var delegateArgs = [UITableViewDelegate]()
}

// MARK: - ReceiptListViewType

extension ReceiptListViewSpy: ReceiptListViewType {

    func show(dataSource: UITableViewDataSource,
              delegate: UITableViewDelegate) {
        dataSourceArgs.append(dataSource)
        delegateArgs.append(delegate)
    }
}
