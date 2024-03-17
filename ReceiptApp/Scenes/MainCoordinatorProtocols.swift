import UIKit

protocol MainCoordinatorType {
    var childCoordinators: [MainCoordinatorType] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
