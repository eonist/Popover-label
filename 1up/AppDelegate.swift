import UIKit
import With
import Spatial

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      /*Add to root*/
      self.window?.rootViewController = createTBC()
      self.window?.makeKeyAndVisible()
      
      return true
   }
}
