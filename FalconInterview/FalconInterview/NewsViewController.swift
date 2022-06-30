//
//  NewsViewController.swift
//  FalconInterview
//
//  Created by Justin Haung on 2022/6/30.
//

import UIKit

protocol NewsViewControllerDelegate: AnyObject {}

class NewsViewController: UIViewController {

    weak var delegate: NewsViewControllerDelegate?
    static let storyBoardId: String = "NewsViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

