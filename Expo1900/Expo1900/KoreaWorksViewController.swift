import UIKit

class KoreaWorksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let a = segue.destination as? KoreaWorksDetailViewController
            if let index = sender as? Int {
                let koreaWorksInfo = koreaWorksList[index]
                a?.koreaWorksInfo = koreaWorksInfo
            }
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
//        navigationItem.title = "한국의 출품작"
        decodeKoreaWorks()
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaWorksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let koreaWorksInfo = koreaWorksList[indexPath.row]
        cell.update(info: koreaWorksInfo)
        return cell
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    func update(info: KoreaWorks) {
        imgView.image = info.image
        nameLabel.text = info.name
        shortDescriptionLabel.text = info.shortDescription
    }
}

var koreaWorksList: [KoreaWorks] = []

func decodeKoreaWorks() {
    let jasonDecoder = JSONDecoder()
    guard let assetData: NSDataAsset = NSDataAsset(name: "items") else {
       return
    }
    guard let koreaWorksData = try? jasonDecoder.decode([KoreaWorks].self, from: assetData.data) else {
        return
    }
    koreaWorksList = koreaWorksData
}


