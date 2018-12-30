import UIKit
import With
import Spatial

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      createTBC()
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
         tbc.createPopoverTag()
         return tbc
      }()
      
      self.window?.rootViewController = tabBar
      self.window?.makeKeyAndVisible()
   }
}
extension UITabBarController {
   /**
    * Creates a popover tag
    */
   func createPopoverTag(){
      //      let arrowHeight:CGFloat = PopoverTag.defaultStyle.arrow.height
      //      let size:CGSize = .init(width:64,height:22)
      let tagView:PopoverTag = .init(text:"♥ 4",style:PopoverTag.defaultStyle,alignment:.bottom)
      self.view.addSubview(tagView)
      tagView.activateConstraint { view in
         let offset:CGFloat = self.tabBar.frame.height
         let a = Constraint.anchor(view, to: self.view, align: .bottomCenter, alignTo: .bottomCenter, offset:.init(x:0,y:-offset-UIApplication.shared.statusBarFrame.height))
         //         let s = Constraint.size(view, size: .init(width:0,height:22+arrowHeight))
         //         let h = Constraint.height(view, height: 22+arrowHeight)
         return [a.x,a.y]//(a,s)
      }
      //      Swift.print("tagView.transform:  \(tagView.transform)")
      /*tagView.transform = */
      
      tagView.hide()
      tagView.intro()
      //      tagView.hide()
      //      tagView.show()
      //tagView.backgroundColor = .lightGray/*Debug*/
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
