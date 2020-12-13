//
//  AltCellModel.swift
//  YoutuberAppV2
//
//  Created by Sefer Furkan Sandal on 13.12.2020.
//

import Foundation
struct AltCellModel: Codable {
    let data: [Veri]
    let paylasText: String
    let bannerShow: Bool
    let kacDefadaGosterilsin: Int
    let paylasShow: Bool
    let bannerid, gecisid: String

    enum CodingKeys: String, CodingKey {
        case data
        case paylasText = "paylas_text"
        case bannerShow = "banner_show"
        case kacDefadaGosterilsin = "kac_defada_gosterilsin"
        case paylasShow = "paylas_show"
        case bannerid = "banner_id"
        case gecisid = "gecis_id"
    }
}

// MARK: - Datum
struct Veri: Codable {
    let icon, baslik, icerik: String
}
