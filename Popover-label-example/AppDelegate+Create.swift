import UIKit
import With
/**
 * Create
 */
extension AppDelegate{
   /**
    * TabBarController
    */
   func createTBC() -> UITabBarController{
      self.window = UIWindow(frame: UIScreen.main.bounds)
      /*Create NavControllers*/
      let nav1:UINavigationController = with(.init()){
         let vc = FirstViewController(nibName: nil, bundle: nil)
         vc.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)//,more,favorites,featured,topRated,recents,contacts,history,bookmarks,search,downloads,mostRecent,mostViewed
         $0.viewControllers = [vc]
      }
      let nav2:UINavigationController = with(.init()){
         let vc = SecondViewController(nibName: nil, bundle: nil)
         vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
         $0.viewControllers = [vc]
      }
      let nav3:UINavigationController = with(.init()){
         let vc = ThirdViewController(nibName: nil, bundle: nil)
         vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
         $0.viewControllers = [vc]
      }
      /*Create TabBarController*/
      return with(.init()){
         $0.tabBar.tintColor = .black
         $0.tabBar.barTintColor = .white
         $0.viewControllers = [nav1, nav2, nav3]
         $0.createPopoverTag()
      }
   }
}
/*Dummy ViewControllers*/
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
