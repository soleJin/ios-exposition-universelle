import UIKit

class KoreaWorksDetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!

    var koreaWorksInfo: KoreaWorks?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = koreaWorksInfo?.name
        updateUI()
    }
    
    func updateUI() {
        if let koreaWorksInfo = self.koreaWorksInfo {
            imgView.image = koreaWorksInfo.image
            descriptionLabel.text = koreaWorksInfo.description
        }
    }
}



