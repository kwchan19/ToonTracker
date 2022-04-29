//
//  DailyWebtoonCell.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-03.
//

import UIKit
import SDWebImage

class DailyWebtoonCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var date: UILabel!
    var todayTomorrow = [String]()
    
    var didSelectItemAction: ((IndexPath) -> Void)?
    
    @objc func reloadTableViewData() {
        collectionView.reloadData()
    }
    
    func resetCollectionView() {
        collectionView.reloadData()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCollectionView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableViewData), name: NSNotification.Name(rawValue: "reloadData"), object: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyWebtoonCell") as? DailyWebtoonCell else {
            fatalError("Cannot create cell")
        }
        
        cell.didSelectItemAction = { [weak self] collectionIndex in
            
            guard let reactionVC = self?.storyboard?.instantiateViewController(withIdentifier: "ToonDetailStoryboard")
                    as? ToonDetail else {
                
                assertionFailure("No view controller in storyboard")
                return
            }
            
            // take a snapshot of current view and set it as backingImage
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 , execute: {
                    
                reactionVC.retrieveTitle = subscribedToons[dateArr[indexPath.row].lowercased()]![collectionIndex.row]["title"] as! String
                let toonId = subscribedToons[dateArr[indexPath.row].lowercased()]![collectionIndex.row]["toonId"] as! String
                reactionVC.url = "https://firebasestorage.googleapis.com/v0/b/toontracker-b5102.appspot.com/o/" + toonId + "?alt=media&token="
                reactionVC.retrieveDescription = subscribedToons[dateArr[indexPath.row].lowercased()]![collectionIndex.row]["description"] as! String
                reactionVC.previousView = "home"
                reactionVC.modalPresentationStyle = .fullScreen
                    // present the view controller modally without animation
                self!.present(reactionVC, animated: false, completion: nil)
            })
        }
        
        if(dateArr[indexPath.row] == todayTomorrow[0]) {
            cell.date.text = "Today"
        }
        else if(dateArr[indexPath.row] == todayTomorrow[1]) {
            cell.date.text = "Tomorrow"
        }
        else {
            cell.date.text = dateArr[indexPath.row]
        }

        if(subscribedToons[dateArr[indexPath.row].lowercased()]?.count == 0) {
            tableView.rowHeight = 0
        }
     
        if(dateArr[indexPath.row] == "Monday") {

           // cell.identi = "123"
            cell.collectionView.tag = 11
        }
        else if(dateArr[indexPath.row] == "Tuesday") {
            cell.collectionView.tag = 22
        }
        
        else if(dateArr[indexPath.row] == "Wednesday") {
   
            cell.collectionView.tag = 33
        }
        
        else if(dateArr[indexPath.row] == "Thursday") {
            cell.collectionView.tag = 44
        }
        
        else if(dateArr[indexPath.row] == "Friday") {
            cell.collectionView.tag = 55
        }
        
        else if(dateArr[indexPath.row] == "Saturday") {
            
            cell.collectionView.tag = 66
        }
        
        else if(dateArr[indexPath.row] == "Sunday") {
            cell.collectionView.tag = 77
        }
        else {
            
            cell.collectionView.tag = 1
        }
      
       
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /*if(subscribedToons[dateArr[indexPath.row].lowercased()]!.count == 0) {
            return 0
        }
        else {
            return 325
         }*/
        
        return 325
    }
    
}

extension DailyWebtoonCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(subscribedToons.isEmpty) {
            return 0
        }
    
        if(collectionView.tag == 11) {
           // print("Monday: ",subscribedToons["Monday"]!.count)
            return subscribedToons["monday"]!.count
        }
        else if(collectionView.tag == 22) {
           // print("Tues: ",subscribedToons["Tuesday"]!.count)
            return subscribedToons["tuesday"]!.count
        }
        else if(collectionView.tag == 33) {
            //print("Wed: ",subscribedToons["Wednesday"]!.count)
            return subscribedToons["wednesday"]!.count
        }
        else if(collectionView.tag == 44) {
           // print("Thurs: ",subscribedToons["Thursday"]!.count)
            return subscribedToons["thursday"]!.count
        }
        else if(collectionView.tag == 55) {
           // print("Fri: ",subscribedToons["Friday"]!.count)
            return subscribedToons["friday"]!.count
        }
        else if(collectionView.tag == 66){
            //print("Sat: ",subscribedToons["Saturday"]!.count)
            return subscribedToons["saturday"]!.count
        }
        else if(collectionView.tag == 77){
           // print("TEST COUNT: ",subscribedToons["Sunday"]!.count)
            //print("Sun: ",subscribedToons["Sunday"]!.count)
            return subscribedToons["sunday"]!.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WebtoonCollectionCell
        let collectionIndex = collectionView.tag
        
        cell.tag = indexPath.row
        cell.webtoonTitle.text = "Add Toon"
        cell.webtoonImage?.setBackgroundImage(nil, for: .normal)
        
       // cell.webtoonTitle.text = String(indexPath.row)
        
        var day = ""
        
        if(collectionView.tag == 11) {
            day = "monday"
        }
        else if(collectionView.tag == 22) {
           day = "tuesday"
        }
        else if(collectionView.tag == 33) {
           day = "wednesday"
        }
        else if(collectionView.tag == 44) {
            day = "thursday"
        }
        else if(collectionView.tag == 55) {
            day = "friday"
        }
        else if(collectionView.tag == 66) {
            day = "saturday"
            
        }
        else if(collectionView.tag == 77) {
            day = "sunday"
        }
        
        print("Day: ",day)
        
        let title = subscribedToons[day]![indexPath.row]["title"] as! String
        
        cell.webtoonTitle.text = " " + title + " "
        var toonId = subscribedToons[day]![indexPath.row]["toonId"] as! String
            
        var url = "https://firebasestorage.googleapis.com/v0/b/toontracker-b5102.appspot.com/o/" + toonId + "?alt=media&token="
        cell.webtoonImage?.sd_setBackgroundImage(with: URL(string: url)!, for: .normal)
            
        cell.webtoonImage?.layoutIfNeeded()
        cell.webtoonImage?.subviews.first?.contentMode = .scaleAspectFill
        cell.layoutIfNeeded()
        
        
        
        
        return cell
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .bottom)

        didSelectItemAction?(indexPath)
        
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
        
    }
    
}

