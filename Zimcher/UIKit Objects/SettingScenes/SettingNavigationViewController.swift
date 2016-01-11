
import UIKit

class SettingNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(UIImage.imageFromColorAndSize(COLORSCHEME.SETTINGS.NAVIGATION_BAR_BG, size: CGSize(width: 1, height: 1)), forBarMetrics: .Default)
        
        navigationBar.translucent = false
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = COLORSCHEME.NAVIGATION_BAR.TINT
        navigationBar.titleTextAttributes?[NSFontAttributeName] = FONTS.SF_MEDIUM.fontWithSize(20)
    }
}
