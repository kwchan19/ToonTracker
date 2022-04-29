//
//  ToonDetailCell.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-07.
//

import UIKit

class ToonDetailCell: UITableViewCell {
    @IBOutlet weak var chapterNumber: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var isNew: UILabel!
    @IBOutlet weak var star: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

extension ToonDetail: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToonDetailCell") as! ToonDetailCell
        
        var chapNum = (103-indexPath.row)
        var chapNumStr = String(chapNum)
        cell.chapterNumber.text = "Chapter " + chapNumStr as! String

        if(indexPath.row == 0) {
            cell.isNew.isHidden = false
        }
        else if(indexPath.row == 1) {
            cell.star.isHidden = false
        }
        else {
            cell.isNew.isHidden = true
            cell.star.isHidden = true
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: title, message: "Add to your list?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
            
        }))
        
        /*if let popoverPresentationController = alert.popoverPresentationController {
            popoverPresentationController.sourceRect = sender.frame
            popoverPresentationController.sourceView = self.view
        }*/
        
        present(alert, animated: true, completion: nil)
    }
    
}
