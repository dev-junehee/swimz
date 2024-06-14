//
//  SettingViewController.swift
//  meaning-out
//
//  Created by junehee on 6/14/24.
//

import UIKit
import SnapKit

enum SettingOptions: CaseIterable {
    case profile
    case menu
    
    var menuOptions: [String] {
        return ["나의 장바구니 목록", "자주 묻는 질문", "1:1 문의", "알림 설정", "탈퇴하기"]
    }
}

class SettingViewController: UIViewController {
    
    let settingTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    private func configureView() {
        view.backgroundColor = Resource.Colors.white
        navigationItem.title = Constants.Text.Title.setting.rawValue
//        navigationItem.scrollEdgeAppearance = navigationItem.standardAppearance
    }
    
    private func configureHierarchy() {
        view.addSubview(settingTableView)
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(SettingProfileTableViewCell.self, forCellReuseIdentifier: SettingProfileTableViewCell.id)
        settingTableView.register(SettingMenuTableViewCell.self, forCellReuseIdentifier: SettingMenuTableViewCell.id)
    }
    
    private func configureLayout() {
        settingTableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureUI() {
        
    }

}


// MARK: SettingViewController 익스텐션

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return SettingOptions.allCases[section].menuOptions.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 120
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let idx = indexPath.row
        
        var cell: UITableViewCell?
        
        if section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: SettingProfileTableViewCell.id, for: indexPath) as! SettingProfileTableViewCell
 
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: SettingMenuTableViewCell.id, for: indexPath) as! SettingMenuTableViewCell
            
            cell?.backgroundColor = .yellow
        }
        
        return cell!
    }
    
    
}
