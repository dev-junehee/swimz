//
//  SearchResultView.swift
//  meaning-out
//
//  Created by junehee on 6/30/24.
//

import UIKit
import SnapKit

final class SearchResultView: BaseView {
    
    let totalLabel = UILabel()
    
    let buttonStack = UIStackView()
    let simButton = UIButton()
    let dateButton = UIButton()
    let ascButton = UIButton()
    let dscButton = UIButton()
    
    lazy var resultCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: collectionViewLayout()
    )
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout() // 테이블뷰의 rowHeight와 같음
        
        let sectionSpaciing: CGFloat = 16
        let cellSpacing: CGFloat = 16
        
        let width = UIScreen.main.bounds.width - (sectionSpaciing * 2) - (cellSpacing * 2)
        layout.itemSize = CGSize(width: width/2, height: width/1.3)
        layout.scrollDirection = .vertical
        
        layout.minimumInteritemSpacing = cellSpacing
        layout.minimumLineSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return layout
    }
    
    override func configureViewHierarchy() {
        let buttonViews = [simButton, dateButton, ascButton, dscButton]
        buttonViews.forEach {
            buttonStack.addArrangedSubview($0)
        }
        
        let subviews = [totalLabel, buttonStack, resultCollectionView]
        subviews.forEach {
            self.addSubview($0)
        }
    }
    
    override func configureViewLayout() {
        totalLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(8)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(30)
        }
        
        buttonStack.snp.makeConstraints {
            $0.top.equalTo(totalLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(40)
        }
        buttonStack.axis = .horizontal
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 8
        
        let simDateButton = [simButton, dateButton]
        simDateButton.forEach {
            $0.snp.makeConstraints { make in
                make.width.equalTo(70)
            }
        }
        
        let priceButton = [ascButton, dscButton]
        priceButton.forEach {
            $0.snp.makeConstraints { make in
                make.width.equalTo(90)
            }
        }
        
        resultCollectionView.snp.makeConstraints {
            $0.top.equalTo(buttonStack.snp.bottom).offset(16)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(24)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    override func configureViewUI() {
        totalLabel.font = Resource.Fonts.bold14
        totalLabel.textColor = Resource.Colors.primary
        
        let buttons = [simButton, dateButton, ascButton, dscButton]
        let titles = Constants.Button.sorting
        
        for i in 0..<buttons.count {
            let button = buttons[i]
            let title = titles[i]
            
            button.setTitle(title, for: .normal)
            button.setTitleColor(Resource.Colors.black, for: .normal)
            button.titleLabel?.font = Resource.Fonts.bold15
            button.layer.borderColor = Resource.Colors.gray.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 20
            button.tag = i
        }
        
        // 정확도 버튼 선택된 상태 기본 세팅
        simButton.setClickedButtonUI()
        setUnclickedButtons(buttons: [dateButton, ascButton, dscButton])
    }
    
}

extension SearchResultView {
    func setUnclickedButtons(buttons: [UIButton]) {
        buttons.forEach {
            $0.setUnclickedButtonUI()
        }
    }
}
