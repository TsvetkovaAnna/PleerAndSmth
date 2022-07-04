import UIKit

class TabBarControllerBuilder {
    static func build() -> UITabBarController {
        let mainTabBarController = UITabBarController()
        let pleerNavigationController = UINavigationController(rootViewController: PleerViewController())
        let segmentNavigationController = UINavigationController(rootViewController: SegmentViewController())
//        let loginNavigationController = UINavigationController(rootViewController: LogInViewController())
        
        pleerNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "newspaper.circle"), tag: 0)
        segmentNavigationController.tabBarItem = UITabBarItem(title: "Person", image: UIImage(systemName: "person.circle.fill"), tag: 1)
//        loginNavigationController.tabBarItem = UITabBarItem(title: "Person", image: UIImage(systemName: "person.circle.fill"), tag: 1)
        
        mainTabBarController.setViewControllers([pleerNavigationController, segmentNavigationController], animated: false)
        return mainTabBarController
    }
}
