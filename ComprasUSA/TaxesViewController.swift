//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Abner Lima on 16/02/23.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxe: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var lbStateTaxeDescription: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }

    @IBAction func changeIof(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        lbStateTaxeDescription.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateTaxe, withCurrency: ""))%)"
        lbIOFDescription.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: ""))%)"
        
        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$")
        lbStateTaxe.text = tc.getFormattedValue(of: tc.stateTaxeValue, withCurrency: "US$")
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$")
        
        let real = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getFormattedValue(of: real, withCurrency: "R$")
    }
}
