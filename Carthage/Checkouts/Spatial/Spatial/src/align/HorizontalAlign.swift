import Foundation
/**
 * NOTE: use .rawValue if you want to get the string "topLeft"
 */
public enum HorizontalAlign:String{
   case left
   case right
   case centerX  /*use centerX or else .dot syntax fails*/
}
