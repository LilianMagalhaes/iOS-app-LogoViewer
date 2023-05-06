//
//  ViewController.swift
//  LogoViewer
//
//  Created by Lilian MAGALHAES on 2023-04-14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    @IBAction func didTapSearchButton() {
        searchLogo()
    }

    func searchLogo() {
        guard let domain = textField.text else { return }
        toggleActivityIndicator(shown: true)
        LogoService.shared.getLogo(domain: domain) { (success, data) in
            self.toggleActivityIndicator(shown: false)
            if success, let data = data {
                self.updateImage(with: data)
            } else {
                self.presentAlert()
            }
        }
    }

    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        searchButton.isHidden = shown
    }

    private func updateImage(with data: Data) {
        self.imageView.image = UIImage(data: data)
    }

    private func presentAlert() {
        let alertVC = UIAlertController(title: "Error", message: "Could not find a logo.", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

}

    
    
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchLogo()
        return true
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }

    
}

