//
//  AddAlertViewController.swift
//  DrinK
//
//  Created by HwangByungJo  on 2022/06/20.
//

import UIKit

class AddAlertViewController: UIViewController {
  
  var pickedDate: ((_ date: Date) -> Void)?
  @IBOutlet weak var datePicker: UIDatePicker!
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
  
  @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true)
  }
  
  @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
    pickedDate?(datePicker.date)
    self.dismiss(animated: true)
  }
  
}
