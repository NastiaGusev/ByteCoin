//
//  CoinData.swift
//  ByteCoin
//
//  Created by Nastia Gusev on 09/04/2022.
//

import Foundation

struct CoinData : Decodable {
    let asset_id_base : String
    let asset_id_quote : String
    let rate : Double
}
