//
//  ViewController.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: HomePresenter?
    var heros: [HeroModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        let usecase = Injection.init().provideUsecase()
        presenter = HomePresenter(usecase: usecase)
        title = "Avengers"
    }
    
    func getData() {
        heros = presenter?.getHeros() ?? []
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroTableViewCell")
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeroTableViewCell", for: indexPath) as? HeroTableViewCell else {
            return UITableViewCell()
        }
        cell.data = heros[indexPath.row]
        cell.setupUi()
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController(data: heros[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

