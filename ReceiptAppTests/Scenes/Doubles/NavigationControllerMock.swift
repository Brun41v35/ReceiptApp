import UIKit
@testable import ReceiptApp

final class NavigationControllerMock: UINavigationController {

    // MARK: - Private

    private(set) var pushViewControllerArgsAnimated = [Bool]()
    private(set) var pushViewControllerArgs = [UIViewController]()

    // MARK: - Methods

    override func pushViewController(_ viewController: UIViewController,
                                     animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushViewControllerArgs.append(viewController)
        pushViewControllerArgsAnimated.append(animated)
    }
}
