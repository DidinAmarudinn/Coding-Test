//
//  HomePresenter.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import Foundation
protocol HomePresenterProtocol {
    func getHeros() -> [HeroModel]
}

class HomePresenter: HomePresenterProtocol {
    private let usecase: CodingTestUseCase
    
    init(usecase: CodingTestUseCase) {
        self.usecase = usecase
    }
    
    func getHeros() -> [HeroModel] {
        return usecase.getHeros()
    }
}
