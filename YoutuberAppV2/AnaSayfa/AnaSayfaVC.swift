//
//  ViewController.swift
//  YoutuberAppV2
//
//  Created by Sefer Furkan Sandal on 12.12.2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet private weak var anaSayfaAltCollectionView: UICollectionView!
    private var viewModel : AnaSayfaVM = AnaSayfaVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        altCollectionViewSetup()
    }
    
    fileprivate func altCollectionViewSetup(){
        anaSayfaAltCollectionView.delegate = self
        anaSayfaAltCollectionView.dataSource = self
        anaSayfaAltCollectionView.register(AnaSayfaAltCell.nib, forCellWithReuseIdentifier: AnaSayfaAltCell.identifier)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data = viewModel.veriler?.data {
            return data.count
        }else{
            return 3
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnaSayfaAltCell.identifier, for: indexPath) as! AnaSayfaAltCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let width : CGFloat = UIScreen.main.bounds.width / 2 - 5
        let height: CGFloat = 200
            
            return CGSize(width: width, height: height)
    }
    func viewModelDinle() {
        viewModel.basla = { [weak self] in
            DispatchQueue.main.async { [self] in
//                self?.tableView.reloadData()
//                self?.reklamTetikle()
                self?.anaSayfaAltCollectionView.reloadData()
            }
        }
        viewModel.start = { [weak self] in
//            self?.indicator.hide()
        }
    }


}

