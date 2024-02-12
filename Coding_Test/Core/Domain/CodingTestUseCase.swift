//
//  CodingTestUseCase.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import Foundation
protocol CodingTestUseCase {
    func getHeros() -> [HeroModel]
    func changeRating(rating: Int, id: Int) -> Bool
}

class CodingTestInteractor: CodingTestUseCase {
    private let repostiory: CodingTestRepositoryProtocol
    
    init(repostiory: CodingTestRepositoryProtocol) {
        self.repostiory = repostiory
    }
    
    func getHeros() -> [HeroModel] {
        return repostiory.getHeros()
    }
    
    func changeRating(rating: Int, id: Int) -> Bool {
        return repostiory.changeRatting(rating: rating, id: id)
    }
}
