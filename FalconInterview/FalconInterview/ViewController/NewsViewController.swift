//
//  NewsViewController.swift
//  FalconInterview
//
//  Created by Justin Haung on 2022/6/30.
//

import UIKit

protocol NewsViewControllerDelegate: AnyObject {}

class NewsViewController: UIViewController {
    static let storyBoardId: String = "NewsViewController"
    
    @IBOutlet weak var newsTableView: UITableView!

    weak var delegate: NewsViewControllerDelegate?
    private var viewModel: NewsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewsViewModel()
        setupUI()
        reloadNews()
        // Do any additional setup after loading the view.
    }
    
    
    private func setupUI() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    
    private func reloadNews() {
        viewModel?.getNewsList{ [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case.success:
                    self.newsTableView.reloadData()
                case .failure:
                    break
                }
            }
        }
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.newsSections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.newsSections[section].items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.newsSections[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as? NewsTableViewCell else { return UITableViewCell() }
        let news = viewModel?.newsSections[indexPath.section].items[indexPath.row]
        cell.createdLabel.text = news?.extra?.created?.dateFormat(.full)
        if let url = news?.appearance?.thumbnail {
            cell.thumbnailImageView.downloadImage(from: url)
        }
        cell.mainTitleLabel.text = news?.appearance?.mainTitle
        cell.subTitleLabel.text = news?.appearance?.subTitle
        return cell
    }
    
}
