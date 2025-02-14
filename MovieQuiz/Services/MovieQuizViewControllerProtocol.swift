//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Alexander Lazarev on 14.02.2025.
//

import Foundation

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func show()
    
    func highlightImageBorder(isCorrectAnswer: Bool)
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNetworkError(message: String)
    
    func hideFrame()
}
