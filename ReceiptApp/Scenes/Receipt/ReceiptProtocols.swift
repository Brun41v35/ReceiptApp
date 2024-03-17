import UIKit

protocol ReceiptViewType where Self: UIView {
    func show(viewModel: Informations)
}
