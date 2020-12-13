//
//  AnaSayfaAltCell.swift
//  YoutuberAppV2
//
//  Created by Sefer Furkan Sandal on 12.12.2020.
//

import UIKit


class AnaSayfaAltCell: UICollectionViewCell {


    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var altCellLabel: UILabel!
    private var paylasLink : String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    @IBAction fileprivate func paylasBtn(_ sender: Any) {
    }
    
    
    func ayarla(resimLink: String, baslik: String, gelenPaylasLink: String){
        altCellLabel.text = baslik
        paylasLink = gelenPaylasLink
        imageView.load(url: URL(string: gelenPaylasLink)!)
        
        
        
    }
    
}



extension AnaSayfaAltCell {
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

