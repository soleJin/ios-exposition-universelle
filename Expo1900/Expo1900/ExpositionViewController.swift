import UIKit

class ExpositionViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpositionData()
        updateExpositionInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
        let backBarButtonItem = UIBarButtonItem(title: "확인", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
}

extension ExpositionViewController {
    func updateExpositionInfo() {
        titleLabel.text = exposition?.title
        guard let visitors = exposition?.visitors,
              let location = exposition?.location,
              let duration = exposition?.duration else {
            return
        }
        visitorsLabel.text = "방문객 : \(visitors.insertComma())"
        locationLabel.text = "개최지 : \(location)"
        durationLabel.text = "개최 기간 : \(duration)"
        descriptionLabel.text = exposition?.description
    }
}

extension Int {
    func insertComma() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: self))! + "명"
        return result
    }
}

var exposition: Exposition? = nil

func decodeExpositionData() {
    
    let jasonDecoder = JSONDecoder()
    guard let assetData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
       return
    }
    guard let expositionData = try? jasonDecoder.decode(Exposition.self, from: assetData.data) else {
        return
    }
    exposition = expositionData
}


