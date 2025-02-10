//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Alexander Lazarev on 09.02.2025.
//

import UIKit
class AlertPresenter {
    
    weak var delegate: AlertDelegate?
    
    func showAlert(model: AlertModel){
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: model.buttonText, style: .default, handler: model.completion)
        alert.addAction(action)
        delegate?.didShowAlert(view: alert)
    }
}


