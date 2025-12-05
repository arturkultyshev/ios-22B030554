import UIKit

final class FavoritesListViewController: UIViewController {

    private let section: FavoriteSection  
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)

    init(section: FavoriteSection, title: String, tabBarImageName: String) {
        self.section = section
        super.init(nibName: nil, bundle: nil)

        self.title = title
        self.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: tabBarImageName),
            tag: section.rawValue
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTableView()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension FavoritesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return FavoritesData.items(for: section).count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FavoriteCell.reuseID,
            for: indexPath
        ) as? FavoriteCell else {
            return UITableViewCell()
        }

        let item = FavoritesData.items(for: section)[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}


extension FavoritesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let item = FavoritesData.items(for: section)[indexPath.row]
        let detailVC = FavoriteDetailViewController(item: item)
        navigationController?.pushViewController(detailVC, animated: true)
    }

    // Простой заголовок секции с названием категории
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection sectionIndex: Int) -> String? {
        return section.title
    }
}
