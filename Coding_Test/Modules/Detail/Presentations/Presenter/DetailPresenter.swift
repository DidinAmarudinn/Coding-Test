//
//  DetailPresenter.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import Foundation
protocol DetailPresenterProtocol {
    func changeRating(rating: Int, id: Int)
}

class DetailPresenter: DetailPresenterProtocol {
    private let usecase: CodingTestUseCase
    
    init(usecase: CodingTestUseCase) {
        self.usecase = usecase
    }
    
    func changeRating(rating: Int, id: Int) {
       let _ = usecase.changeRating(rating: rating, id: id)
    }
}
