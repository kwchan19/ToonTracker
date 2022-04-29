//
//  SearchToonCell.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-08.
//

import UIKit

class SearchToonCell: UITableViewCell {

    @IBOutlet weak var toonImage: UIButton!
    @IBOutlet weak var toonTitle: UILabel!
    @IBOutlet weak var toonGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        toonImage?.layoutIfNeeded()
        toonImage?.subviews.first?.contentMode = .scaleAspectFill
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SearchToons: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchToonCell") as? SearchToonCell else {
            fatalError("Cannot create cell")
        }
        
        cell.toonTitle.text = toonArray[indexPath.row]["title"] as! String
        cell.toonGenre.text = "Action"
        
        
        var toonId = toonArray[indexPath.row]["toonId"] as! String
            
        var url = "https://firebasestorage.googleapis.com/v0/b/toontracker-b5102.appspot.com/o/" + toonId + "?alt=media&token="
        cell.toonImage?.sd_setBackgroundImage(with: URL(string: url)!, for: .normal)
            

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let reactionVC = self.storyboard?.instantiateViewController(withIdentifier: "ToonDetailStoryboard")
                as? ToonDetail else {
            
            assertionFailure("No view controller in storyboard")
            return
        }
        
        // take a snapshot of current view and set it as backingImage
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 , execute: {
                
            reactionVC.retrieveTitle = self.toonArray[indexPath.row]["title"] as! String
            let toonId = self.toonArray[indexPath.row]["toonId"] as! String
            reactionVC.url = "https://firebasestorage.googleapis.com/v0/b/toontracker-b5102.appspot.com/o/" + toonId + "?alt=media&token="
            reactionVC.retrieveDescription = self.toonArray[indexPath.row]["description"] as! String
            reactionVC.previousView = "home"
            reactionVC.modalPresentationStyle = .fullScreen
                // present the view controller modally without animation
            self.present(reactionVC, animated: false, completion: nil)
        })
    }
  
    
    
}
