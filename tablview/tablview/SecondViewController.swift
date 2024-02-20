//
//  SecondViewController.swift
//  tablview
//
//  Created by Zignuts Technolab on 20/02/24.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func didAddData(task: String, description: String)
}
class SecondViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    weak var delegate: SecondViewControllerDelegate?
    @IBAction func backButtonTapped(_ sender: UIButton) {
        guard let task = nameTextField.text, let description = descriptionTextField.text else {
                    return
                }

                // Notify the delegate with the entered data
                delegate?.didAddData(task: task, description: description)
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
