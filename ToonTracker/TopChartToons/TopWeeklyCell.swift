//
//  TopWeeklyCell.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-07.
//

import UIKit

class TopWeeklyCell: UITableViewCell {


    @IBOutlet weak var toonImage: UIButton!
    @IBOutlet weak var toonTitle: UILabel!
    @IBOutlet weak var toonGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        toonImage.roundedButtonAllCorners()
        toonImage.layoutIfNeeded()
        toonImage.subviews.first?.contentMode = .scaleAspectFill
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TopChartToons: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topWeeklyCell") as! TopWeeklyCell
        return cell
    }
    
    
}
