//
//  KoreaWorksTableViewController.swift
//  Expo1900
//
//  Created by 김지혜 on 2020/12/22.
//

import UIKit

class KoreaWorksTableViewController: UITableViewController {
    private var koreaWorksArray: [KoreaWorks] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        decodeJson()
    }

    private func decodeJson() {
        guard let asset = NSDataAsset(name: "items") else { return }

        let decoder = JSONDecoder()
        guard let koreaWorksArray = try? decoder.decode([KoreaWorks].self, from: asset.data) else {
            return
        }

        self.koreaWorksArray = koreaWorksArray
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaWorksArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KoreaWorksTableViewCell", for: indexPath) as? KoreaWorksTableViewCell,
              indexPath.row < koreaWorksArray.count else { return .init() }
        
        let koreaWorks = koreaWorksArray[indexPath.row]
        cell.worksNameLabel.text = koreaWorks.name
        cell.worksShortDescriptionLabel.text = koreaWorks.shortDescription
        cell.imageView?.image = koreaWorks.image
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showWorksDetail" else { return }
        
        guard let cell: KoreaWorksTableViewCell = sender as? KoreaWorksTableViewCell,
              let destinationController: KoreaWorksDetailViewController = segue.destination as? KoreaWorksDetailViewController else { return }
        
        guard let index: IndexPath = tableView.indexPath(for: cell),
              index.row < koreaWorksArray.count else { return }
        
        let koreaWorks: KoreaWorks = koreaWorksArray[index.row]
        destinationController.koreaWorks = koreaWorks
    }
}
