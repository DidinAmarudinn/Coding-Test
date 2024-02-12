//
//  DetailViewController.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var btnStart1: UIButton!
    @IBOutlet weak var btnStart2: UIButton!
    @IBOutlet weak var btnStart3: UIButton!
    @IBOutlet weak var heroImage: UIImageView!
    
    var presenter: DetailPresenter?
    var data: HeroModel?
    
    init(data: HeroModel?) {
        super.init(nibName: nil, bundle: nil)
        self.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let usecase = Injection.init().provideUsecase()
        presenter = DetailPresenter(usecase: usecase)
        title = data?.name
        
        setupNavBarTitle()
        setupUI()
        
    }
    
    func setupNavBarTitle() {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "backIcon").withRenderingMode(.alwaysTemplate), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.widthAnchor.constraint(equalToConstant: button.frame.width).isActive = true
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let barButtonItemMenu = UIBarButtonItem()
        barButtonItemMenu.customView = button
        self.navigationItem.leftBarButtonItems = [barButtonItemMenu]
    }
    
    @objc func backButtonTapped() {
         navigationController?.popViewController(animated: true)
     }
    
    
    func setupUI() {
        if let data {
            heroImage.image = UIImage(named: data.image)
            setupRating(rating: data.rating)
        }
    }
    
    @IBAction func brnStar1Pressed(_ sender: UIButton) {
        if let data {
            presenter?.changeRating(rating: 1, id: data.id)
            setupRating(rating: 1)
        }
    }
    
    @IBAction func btnStar2Pressed(_ sender: Any) {
        if let data {
            presenter?.changeRating(rating:2, id: data.id)
            
            setupRating(rating: 2)
        }
    }
    @IBAction func btrStar3Pressed(_ sender: Any) {
        if let data {
            presenter?.changeRating(rating: 3, id: data.id)
            setupRating(rating: 3)
        }
    }
    
    func setupRating(rating: Int) {
        let starsButtons = [btnStart1, btnStart2, btnStart3]
        for (index, button) in starsButtons.enumerated() {
            let imageName = (index + 1) <= rating ? "starfilled" : "star"
            button?.setImage(UIImage(named: imageName), for: .normal)
        }
    }
    
}
