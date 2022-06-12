import UIKit

class TabBarControllerBuilder {
    static func build() -> UITabBarController {
        let mainTabBarController = UITabBarController()
        let pleerNavigationController = UINavigationController(rootViewController: PleerViewController())
//        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())
//        let loginNavigationController = UINavigationController(rootViewController: LogInViewController())
        
        pleerNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "newspaper.circle"), tag: 0)
//        loginNavigationController.tabBarItem = UITabBarItem(title: "Person", image: UIImage(systemName: "person.circle.fill"), tag: 1)
        
        mainTabBarController.setViewControllers([pleerNavigationController], animated: false)
        return mainTabBarController
    }
}
