import UIKit

final class MainCoordinator: MainCoordinatorType {

    // MARK: - Internal Properties

    var childCoordinators = [MainCoordinatorType]()
    var navigationController: UINavigationController

    // MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Internal Methods

    func start() {
        showReceiptListViewController()
    }

    // MARK: - Private Methods

    private func showReceiptListViewController() {
        let networking = Networking(factoryNetworking: FactoryNetworking())
        let presenter = ReceiptListPresenter(networkManager: networking)
        let controller = ReceiptListViewController(presenter: presenter)
        controller.delegate = self
        presenter.viewController = controller

        navigationController.pushViewController(controller, animated: true)
    }

    private func showReceiptViewController(with informations: Informations) {
        let presenter = ReceiptPresenter(informations: informations)
        let controller = ReceiptViewController(presenter: presenter)
        presenter.viewController = controller

        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: - ReceiptListViewControllerDelegate

extension MainCoordinator: ReceiptListViewControllerDelegate {

    func showReceipt(with informations: Informations) {
        showReceiptViewController(with: informations)
    }
}
