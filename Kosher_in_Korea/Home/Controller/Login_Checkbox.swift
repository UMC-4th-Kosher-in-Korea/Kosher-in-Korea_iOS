//
//  Login_Checkbox.swift
//  Kosher_in_Korea
//
//  Created by 김우용 on 2023/08/11.
//

import UIKit

class Login_Checkbox: UIViewController {
    @IBOutlet weak var arrowbackward2_1: UIButton!
    @IBOutlet weak var checkbtn2_1: UIButton!
    @IBOutlet weak var checkbtn2_2: UIButton!
    @IBOutlet weak var checkbtn2_3: UIButton!
    @IBOutlet weak var checkbtn2_4: UIButton!
    @IBOutlet weak var checkbtn2_5: UIButton!
    @IBOutlet weak var checkbtn2_6: UIButton!
    
    var isChecked2_1 = false
    var isChecked2_2 = false
    var isChecked2_3 = false
    var isChecked2_4 = false
    var isChecked2_5 = false
    var isChecked2_6 = false
    
    @objc func checkboxTapped2_1() {
        isChecked2_1 = !isChecked2_1
        checkbtn2_1.isSelected = isChecked2_1
        print("2_1")
        }
    @objc func checkboxTapped2_2() {
        isChecked2_2 = !isChecked2_2
        checkbtn2_2.isSelected = isChecked2_2
        }
    @objc func checkboxTapped2_3() {
        isChecked2_3 = !isChecked2_3
        checkbtn2_3.isSelected = isChecked2_3
        }
    @objc func checkboxTapped2_4() {
        isChecked2_4 = !isChecked2_4
        checkbtn2_4.isSelected = isChecked2_4
        print("1_1")
        }
    @objc func checkboxTapped2_5() {
        isChecked2_5 = !isChecked2_5
        checkbtn2_5.isSelected = isChecked2_5
        }
    @objc func checkboxTapped2_6() {
        isChecked2_6 = !isChecked2_6
        checkbtn2_6.isSelected = isChecked2_6
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrowbackward2_1.setImage(UIImage(named: "arrow_backward"), for: .normal)
        
        //체크박스2_1
        checkbtn2_1.setImage(UIImage(named: "checkbox_empty"), for: .normal)
        checkbtn2_1.setImage(UIImage(named: "checkbox_filled"), for: .selected)
        checkbtn2_1.addTarget(self, action: #selector(checkboxTapped2_1), for: .touchUpInside)
        
        //체크박스2_2
        checkbtn2_2.setImage(UIImage(named: "checkbox_empty"), for: .normal)
        checkbtn2_2.setImage(UIImage(named: "checkbox_filled"), for: .selected)
        checkbtn2_2.addTarget(self, action: #selector(checkboxTapped2_2), for: .touchUpInside)
        
        //체크박스2_3
        checkbtn2_3.setImage(UIImage(named: "checkbox_empty"), for: .normal)
        checkbtn2_3.setImage(UIImage(named: "checkbox_filled"), for: .selected)
        checkbtn2_3.addTarget(self, action: #selector(checkboxTapped2_3), for: .touchUpInside)
        
        //체크박스2_4
        checkbtn2_4.setImage(UIImage(named: "checkbox_empty"), for: .normal)
        checkbtn2_4.setImage(UIImage(named: "checkbox_filled"), for: .selected)
        checkbtn2_4.addTarget(self, action: #selector(checkboxTapped2_4), for: .touchUpInside)
        
        //체크박스2_5
        checkbtn2_5.setImage(UIImage(named: "checkbox_empty"), for: .normal)
        checkbtn2_5.setImage(UIImage(named: "checkbox_filled"), for: .selected)
        checkbtn2_5.addTarget(self, action: #selector(checkboxTapped2_5), for: .touchUpInside)
        
        //체크박스2_6
        checkbtn2_6.setImage(UIImage(named: "checkbox_empty"), for: .normal)
        checkbtn2_6.setImage(UIImage(named: "checkbox_filled"), for: .selected)
        checkbtn2_6.addTarget(self, action: #selector(checkboxTapped2_6), for: .touchUpInside)
    }
}
