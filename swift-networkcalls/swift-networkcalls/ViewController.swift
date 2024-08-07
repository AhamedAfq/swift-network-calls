//
//  ViewController.swift
//  swift-networkcalls
//
//  Created by Ashfak Ahamed Alauddeen on 06/08/24.
//

import UIKit

class ViewController: UIViewController {
    var loader: UIActivityIndicatorView!
    var user: GetGHUserResponseModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loader = UIActivityIndicatorView()
        loader.center = view.center
        view.addSubview(loader)
        loader.startAnimating()
        
        ApiManager().getGitHubUser("AhamedAfq") { [weak self] result in
            DispatchQueue.main.async {
                self?.loader.stopAnimating()
                switch result{
                case .success(let fetchedUser):
                    self?.user = fetchedUser
                    print("Fetched user: \(fetchedUser)")
                case .failure(let error):
                    print("Failed to fetch user \(error.localizedDescription)")
                    self?.showError(error)
                }
            }
        }
    }
    
    func showError(_ error: Error){
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }


}

