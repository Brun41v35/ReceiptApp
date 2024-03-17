import XCTest
@testable import ReceiptApp

final class ReceiptListViewControllerTests: XCTestCase {

    // MARK: - Properties

    private var navigation: UINavigationController!
    private var contentViewSpy: ReceiptListViewSpy!
    private var sut: ReceiptListViewController!

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

    func test_viewDidLoad_setupNavigationTitle_navigationControllerNavigationBarShouldHaveRightTitle() {
        sut.viewDidLoad()
    
        XCTAssertEqual(navigation.title, "Receipt 🧾")
    }

    func test_viewDidLoad_setupNavigationTitle_navigationControllerNavigationBarPrefersLargeTitlesShouldBeTrue() {
        sut.viewDidLoad()

        XCTAssertEqual(navigation.navigationBar.prefersLargeTitles, true)
    }

    func test_viewDidLoad_setupTableViewDataSource_dataSource_shouldCallOnce() {
        sut.viewDidLoad()

        XCTAssertEqual(contentViewSpy.dataSourceArgs.count, 1)
    }

    func test_viewDidLoad_setupTableViewDataSource_delegate_shouldCallOnce() {
        sut.viewDidLoad()

        XCTAssertEqual(contentViewSpy.delegateArgs.count, 1)
    }

    func test_tableView_numberOfRowsInSection_shouldBeRight() {
        let tableView = makeTableView()

        XCTAssertEqual(sut.tableView(tableView, numberOfRowsInSection: 0), 5)
    }

    // MARK: - Helpers

    private func makeSUT() {
        contentViewSpy = ReceiptListViewSpy()
        sut = ReceiptListViewController(contentView: contentViewSpy)
        navigation = UINavigationController(rootViewController: sut)
    }

    private func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "ReceiptListViewCell")
        tableView.dataSource = sut
        tableView.delegate = sut

        return tableView
    }
}
