//
//  AnaSayfaVM.swift
//  YoutuberAppV2
//
//  Created by Sefer Furkan Sandal on 13.12.2020.
//

import Foundation
import UIKit

final class AnaSayfaVM{
   var veriler: AltCellModel?
    var basla: (() -> ())?
    var start: (() -> ())?
    
    func veriCek() {
            
        
        let url = URL(string: "http://apps.furkansandal.com/youtuber_app_v2/show_json.php")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, res, error) in
            if error != nil {
//                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//                let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
//                alert.addAction(okButton)
//                self.present(alert, animated: true, completion: nil)
            }else{
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let responseObject = try decoder.decode(AltCellModel.self, from: data)
                        self.veriler = responseObject
                        let reklamId = self.veriler?.bannerid
                        UserDefaults.standard.set(reklamId, forKey: "banner_id")
                        
                        let gecis_id = self.veriler?.gecisid
                        UserDefaults.standard.set(gecis_id, forKey: "gecis_id")
                        
                        let sayac = self.veriler?.kacDefadaGosterilsin
                        UserDefaults.standard.set(sayac, forKey: "kac_defada")
                        
                        self.basla?()
                        self.start?()
                        
                    }catch{
                        print("Data Boş")
                        
                    }
                    
                }
            }
        }
        task.resume()
    }
    
    init() {
        veriCek()
    }
    
    func reklamSayac(){
        let sayac = 2
        UserDefaults.standard.set(sayac, forKey: "sayac")
        
    }
}
