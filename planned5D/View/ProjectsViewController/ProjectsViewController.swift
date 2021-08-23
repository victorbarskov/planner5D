//
//  ProjectsViewController.swift
//  planned5D
//
//  Created by Victor Barskov on 20.08.2021.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ProjectListViewModel(withParser: Parser())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        title = "Projects"
        viewModel.delegate = self
        viewModel.parse(with: "projects")
    }
    
}

extension ProjectsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.projects[indexPath.row]?.name ?? ""
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}

extension ProjectsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let projectViewController: ProjectViewController = storyboard.instantiateViewController(withIdentifier: "ProjectViewController") as? ProjectViewController else { return }
        projectViewController.project = viewModel.projects[indexPath.row]
        navigationController?.pushViewController(projectViewController, animated: true)
        
    }
    
}


extension ProjectsViewController: ProjectListViewModelDelegate {
    
    func failedParse(with error: ParseError?) {
        // handle error
    }
    
    func viewModelDidParseProjects() {
        tableView.reloadData()
    }
    
}


