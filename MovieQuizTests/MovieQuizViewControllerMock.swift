//
//  MovieQuizViewControllerMock.swift
//  MovieQuizTests
//
//  Created by Alexander Lazarev on 15.02.2025.
//

import Foundation
import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    func hideFrame() {}
    func show() {}
    func show(quiz step: QuizStepViewModel) {}
    func highlightImageBorder(isCorrectAnswer: Bool) {}
    func showLoadingIndicator() {}
    func hideLoadingIndicator() {}
    func showNetworkError(message: String) {}
}
