//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Abner Lima on 16/02/23.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfStateTaxtes: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfDolar.text = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        tfIOF.text = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        tfStateTaxtes.text = tc.getFormattedValue(of: tc.stateTaxe, withCurrency: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues() {
        tc.dolar = tc.convertToDouble(tfDolar.text!)
        tc.iof = tc.convertToDouble(tfIOF.text!)
        tc.stateTaxe = tc.convertToDouble(tfStateTaxtes.text!)
    }

}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
