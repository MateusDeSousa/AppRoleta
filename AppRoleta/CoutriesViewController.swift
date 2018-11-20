//
//  CoutriesViewController.swift
//  AppRoleta
//
//  Created by Mateus de Sousa Silva on 20/11/2018.
//  Copyright © 2018 Mateus de Sousa Silva. All rights reserved.
//

import UIKit

class CoutriesViewController: UIViewController {

    @IBOutlet weak var meuPicker: UIPickerView!
    
    @IBOutlet weak var textResultado: UILabel!
    
    @IBAction func ButtonJogar(_ sender: UIButton) {
        meuPicker.selectRow(Int(arc4random_uniform(4)), inComponent: 0, animated: true)
        meuPicker.selectRow(Int(arc4random_uniform(4)), inComponent: 1, animated: true)
        meuPicker.selectRow(Int(arc4random_uniform(4)), inComponent: 2, animated: true)
        
        if  (meuPicker.selectedRow(inComponent: 0) == meuPicker.selectedRow(inComponent: 1)) && (meuPicker.selectedRow(inComponent: 1) == meuPicker.selectedRow(inComponent: 2))  {
            textResultado.text = "Você ganhou :D"
            
            }else{
            textResultado.text  = "Você Perdeu :("
        }
    }
    var coutries = [UIImage.init(named: "Brasil"), UIImage.init(named: "EUA"), UIImage.init(named: "Canada"), UIImage.init(named: "Iraque")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meuPicker.dataSource = self
        meuPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    

    

}



extension CoutriesViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coutries.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = coutries[row]
        
        return image
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
}
