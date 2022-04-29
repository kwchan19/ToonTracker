//
//  SpotlightCollectionCell.swift
//  ToonTracker
//
//  Created by Kevin Chan on 2022-04-07.
//

import UIKit

class SpotlightCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var toonImage: UIButton!
    @IBOutlet weak var toonTitle: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
/*        webtoonTitle.text = nil
        webtoonImage.imageView!.image = nil
        webtoonImage.setBackgroundImage(nil, for: .normal)*/
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        toonTitle.layer.borderColor = UIColor.systemGray4.cgColor
        toonTitle.layer.borderWidth = 1
        toonImage.roundedButton()
        toonImage.layoutIfNeeded()
        toonImage.subviews.first?.contentMode = .scaleAspectFill
        
        toonTitle.clipsToBounds = true
        toonTitle.layer.cornerRadius = 6
        toonTitle.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    
}


extension TopChartToons: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "spotlightCollectionCell", for: indexPath) as! SpotlightCollectionCell
        return cell
    }
    

}
