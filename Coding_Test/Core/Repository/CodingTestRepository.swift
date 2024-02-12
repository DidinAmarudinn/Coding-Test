//
//  CodeTestRepository.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import Foundation
protocol CodingTestRepositoryProtocol {
    func getHeros() -> [HeroModel]
    func changeRatting(rating: Int, id: Int) -> Bool
}

class CodingTestRepository: CodingTestRepositoryProtocol {
    private let dataSource: CodingTestLocalDataSourceProtocol
    
    init(dataSource: CodingTestLocalDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getHeros() -> [HeroModel] {
        return dataSource.getHeros()
    }
    
    func changeRatting(rating: Int, id: Int) -> Bool {
        return dataSource.changeRating(rating: rating, id: id)
    }
}
