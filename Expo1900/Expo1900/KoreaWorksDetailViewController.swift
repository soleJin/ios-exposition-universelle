//
//  KoreaWorksDetailViewController.swift
//  Expo1900
//
//  Created by 김지혜 on 2020/12/23.
//

import UIKit

class KoreaWorksDetailViewController: UIViewController {
    @IBOutlet weak var koreaWorksImageView: UIImageView!
    @IBOutlet weak var koreaWorksDescription: UILabel!
    
    var koreaWorks: KoreaWorks?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    private func updateUI() {
        guard let koreaWorks = koreaWorks else { return }
        
        navigationItem.title = koreaWorks.name
        koreaWorksImageView.image = koreaWorks.image
        koreaWorksDescription.text = koreaWorks.description
    }
}

extension KoreaWorksDetailViewController: UIScrollViewDelegate {
    
}
