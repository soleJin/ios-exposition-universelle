//
//  ExpositionTableViewController.swift
//  Expo1900
//
//  Created by 김지혜 on 2020/12/22.
//

import UIKit

class ExpositionTableViewController: UITableViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var expositionImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var koreaWorksButton: UIButton!
    @IBOutlet private weak var leftFlagImageView: UIImageView!
    @IBOutlet private weak var rightFlagImageView: UIImageView!
    
    private var exposition: Exposition? {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultUI()
        decodeJson()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setDefaultUI() {
        expositionImageView.image = UIImage(named: "poster")
        koreaWorksButton.setTitle("한국의 출품작 보러가기", for: .normal)
        leftFlagImageView.image = UIImage(named: "flag")
        rightFlagImageView.image = UIImage(named: "flag")
    }
    
    private func decodeJson() {
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        let decoder = JSONDecoder()
        guard let exposition = try? decoder.decode(Exposition.self, from: asset.data) else {
            return
        }
        
        self.exposition = exposition
    }
    
    private func updateUI() {
        guard let exposition = exposition else { return }
        
        titleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = "방문객 : \(exposition.visitors.withCommas()) 명"
        locationLabel.text = "개최지 : \(exposition.location)"
        durationLabel.text = "개최 기간 : \(exposition.duration)"
        descriptionLabel.text = exposition.description
    }
}

extension Int {
    func withCommas() -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
