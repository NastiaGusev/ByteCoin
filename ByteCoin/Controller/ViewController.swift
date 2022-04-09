//
//  ViewController.swift
//  ByteCoin
//
//  Created by Nastia Gusev on 09/04/2022.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
  
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //How many columns we want in the picker
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //How many rows are in the picker
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //The method is called to get the title for each row
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Records the row number that was selected
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
        
    }
    
    func didUpdateCoin(_ coinManager: CoinManager, rate: Double, currency: String) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.2f", rate)
            self.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}

