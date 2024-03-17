import UIKit

protocol ReceiptListViewType where Self: UIView {
    func show(dataSource: UITableViewDataSource,
              delegate: UITableViewDelegate)
}
