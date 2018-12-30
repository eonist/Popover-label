import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
      return true
   }
}
extension AppDelegate{
   /**
    * TabBarController
    */
   func createTBC(){
      self.window = UIWindow(frame: UIScreen.main.bounds)
      
      let nav1:UINavigationController = {
         let nav = UINavigationController()
         let vc = FirstViewController(nibName: nil, bundle: nil)
         vc.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)//,more,favorites,featured,topRated,recents,contacts,history,bookmarks,search,downloads,mostRecent,mostViewed
         nav.viewControllers = [vc]
         return nav
      }()
      let nav2:UINavigationController = {
         let nav:UINavigationController = .init()
         let vc = SecondViewController(nibName: nil, bundle: nil)
         vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
         nav.viewControllers = [vc]
         return nav
      }()
      let nav3:UINavigationController = {
         let nav:UINavigationController = .init()
         let vc = ThirdViewController(nibName: nil, bundle: nil)
         vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
         nav.viewControllers = [vc]
         return nav
      }()
      let tabBar:UITabBarController = {
         let tbc = UITabBarController()
         tbc.tabBar.tintColor = .black
         tbc.tabBar.barTintColor = .white
         tbc.viewControllers = [nav1, nav2, nav3]
         return tbc
      }()
      
      self.window?.rootViewController = tabBar
      self.window?.makeKeyAndVisible()
   }
}

class FirstViewController:UIViewController{
   override func viewDidLoad() {
      super.viewDidLoad()
      self.title = "First"
      view.backgroundColor = .white
   }
}
class SecondViewController:UIViewController{
   override func viewDidLoad() {
      super.viewDidLoad()
      self.title = "Second"
      view.backgroundColor = .white
   }
}
class ThirdViewController:UIViewController{
   override func viewDidLoad() {
      super.viewDidLoad()
      self.title = "Third"
      view.backgroundColor = .white
   }
}
