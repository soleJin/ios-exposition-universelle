import UIKit

class ExpositionViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var exposition: Exposition?

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpositionData()
        updateExpositionInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension ExpositionViewController {
    
    private func updateExpositionInfo() {
        guard let exposition = exposition else {return}
        titleLabel.text = exposition.title
        visitorsLabel.text = "방문객 : \(exposition.visitors.insertComma())"
        locationLabel.text = "개최지 : \(exposition.location)"
        durationLabel.text = "개최 기간 : \(exposition.duration)"
        descriptionLabel.text = exposition.description
    }
    
    private func decodeExpositionData() {
        
        let jasonDecoder = JSONDecoder()
        guard let assetData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
           return
        }
        guard let expositionData = try? jasonDecoder.decode(Exposition.self, from: assetData.data) else {
            return
        }
        exposition = expositionData
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




