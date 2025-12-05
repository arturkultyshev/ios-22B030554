import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)

        let moviesVC = FavoritesListViewController(
            section: .movies,
            title: "Movies",
            tabBarImageName: "film"
        )

        let musicVC = FavoritesListViewController(
            section: .music,
            title: "Music",
            tabBarImageName: "music.note"
        )

        let booksVC = FavoritesListViewController(
            section: .books,
            title: "Books",
            tabBarImageName: "book.closed"
        )

        let coursesVC = FavoritesListViewController(
            section: .courses,
            title: "Courses",
            tabBarImageName: "graduationcap"
        )

        let moviesNav = UINavigationController(rootViewController: moviesVC)
        let musicNav = UINavigationController(rootViewController: musicVC)
        let booksNav = UINavigationController(rootViewController: booksVC)
        let coursesNav = UINavigationController(rootViewController: coursesVC)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [moviesNav, musicNav, booksNav, coursesNav]
        tabBarController.tabBar.tintColor = .systemBlue

        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
}
