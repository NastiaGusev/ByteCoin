//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Nastia Gusev on 09/04/2022.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "BB2FD42B-9B30-4BE3-BC7C-0D159B96EB3D"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)/?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeDate = data {
                    parseJSON(coinData: safeDate)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(coinData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            print(decodedData.rate)
        } catch {
            print(error)
        }
        
    }
}
