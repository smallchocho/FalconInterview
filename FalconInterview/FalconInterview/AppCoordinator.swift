//
//  AppCoordinator.swift
//  FalconInterview
//
//  Created by Justin Haung on 2022/6/30.
//

import UIKit

protocol CoorDinator {
    var childAppCoorDinators: [CoorDinator] { get set }
    var rootViewController: UIViewController? { get set }
    
    func start()
}

class AppCoordinator: CoorDinator {
    private let storyBoardName: String = "Main"
    
    private weak var window: UIWindow?
    var childAppCoorDinators: [CoorDinator] = []
    var rootViewController: UIViewController?
    
    func start() {
        guard let vc = UIStoryboard(name: storyBoardName, bundle: nil).instantiateViewController(identifier: NewsViewController.storyBoardId) as? NewsViewController else { return }
        vc.delegate = self
        let naVC = UINavigationController(rootViewController: vc)
        rootViewController = naVC
        window?.rootViewController = rootViewController
    }
    
    init(window: UIWindow?) {
        self.window = window
    }
}

extension AppCoordinator: NewsViewControllerDelegate {}
