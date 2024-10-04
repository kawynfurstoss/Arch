//
//  HomeViewController.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/29/24.
//

import UIKit
import Components

class HomeViewController: UIViewController {
  
  var viewModel: HomeViewModel
  var button: UIButton = Button()
  
  init(_ viewModel: HomeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemRed
      setupButton()
      view.addSubview(button)
      layoutContraints()
    }
  
  private func setupButton() {
    button.setTitle("go to feed", for: .normal)
    button.addAction(UIAction(
      handler: { _ in self.viewModel.buttonTapped() }),
      for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func layoutContraints() {
    NSLayoutConstraint.activate([
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor), // Center vertically
        button.widthAnchor.constraint(equalToConstant: 150), // Set width
        button.heightAnchor.constraint(equalToConstant: 50) // Set height
    ])
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
