//
//  Injection.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import Foundation
final class Injection: NSObject {
    private func provideDataSource() -> CodingTestLocalDataSourceProtocol {
        return CodingTestLocalDataSource()
    }
    
    private func provideRepostiory() -> CodingTestRepositoryProtocol {
        return CodingTestRepository(dataSource: provideDataSource())
    }
    
    func provideUsecase() -> CodingTestUseCase {
        return CodingTestInteractor(repostiory: provideRepostiory())
    }
}
