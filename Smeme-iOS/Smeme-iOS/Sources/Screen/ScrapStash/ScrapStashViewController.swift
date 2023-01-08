//
//  ScrapStashViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import UIKit

import SnapKit
import Then

final class ScrapStashViewController: UIViewController {
    
    // MARK: - Property
    
    final let scrapedInset: UIEdgeInsets = UIEdgeInsets(top: 18, left: 31, bottom: 18, right: 30)
    
    final let scrapedLineSpacing: CGFloat = 12
    
    // MARK: - UI Property
        
    private let headerView = UIView().then {
        $0.layer.cornerRadius = 30
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.layer.shadowRadius = 18
        $0.layer.shadowOpacity = 0.04
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "보관함"
        $0.textColor = .smemeBlack
        $0.font = .headline3
    }
    
    private let profileButton = UIButton().then {
        $0.setImage(Constant.Image.icnProfile, for: .normal)
    }
    
    private let scrapedStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
        $0.alignment = .center
        $0.distribution = .fill
    }
    
    private let scrapedLabel = UILabel().then {
        $0.text = "스크랩한 표현"
        $0.textColor = .primary
        $0.font = .subtitle2
    }
    
    private let selectedUnderline = UIView().then {
        $0.backgroundColor = .primary
    }
    
    private let likedDiaryLabel = UILabel().then {
        $0.text = "추천한 일기"
        $0.textColor = .gray400
        $0.font = .subtitle2
    }
    
    private lazy var scrapedListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        $0.backgroundColor = .clear
        $0.collectionViewLayout = layout
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
        register()
    }
    
    // MARK: - @objc
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .background
        headerView.backgroundColor = .white
    }
    
    private func setLayout() {        
        view.addSubviews([headerView, scrapedListCollectionView])
        
        headerView.addSubviews([titleLabel, profileButton, scrapedStackView, likedDiaryLabel])
        
        scrapedStackView.addArrangedSubview(scrapedLabel)
        scrapedStackView.addArrangedSubview(selectedUnderline)
                
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(30)
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(40)
        }
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(convertByHeightRatio(152))
        }
        
        scrapedStackView.snp.makeConstraints {
            $0.bottom.equalTo(headerView)
            $0.leading.equalToSuperview().offset(30)
        }
    
        selectedUnderline.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        likedDiaryLabel.snp.makeConstraints {
            $0.leading.equalTo(scrapedStackView.snp.trailing).offset(20)
            $0.top.equalTo(scrapedStackView)
        }
        
        scrapedListCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    var scrapedExpressionList: [ScrapedExpressionModel] = [
        ScrapedExpressionModel(scrapedExpression: "component"),
        ScrapedExpressionModel(scrapedExpression: "The Merge Wireframing Kit is another simple solution"),
        ScrapedExpressionModel(scrapedExpression: "The Merge Wireframing Kit is another simple solution The Merge Wireframing Kit is another simple solutionThe Merge Wireframing Kit is another simple solution"),
        ScrapedExpressionModel(scrapedExpression: "The Merge Wireframing Kit is another simple solution The Merge Wireframing Kit is another simple solutionThe Merge Wireframing Kit is another simple solution, The Merge Wireframing Kit is another simple solution The Merge Wireframing Kit is another simple solutionThe Merge Wireframing Kit is another simple solution")
    ]
    
    private func register() {
        scrapedListCollectionView.register(ScrapedListCollectionViewCell.self, forCellWithReuseIdentifier: ScrapedListCollectionViewCell.identifier)
    }
    
    func setDummyLabel(_ text: String) -> CGFloat {
        var dummyLabel = UILabel().then {
            $0.text = text
            $0.font = .body1
            $0.numberOfLines = 0
            $0.sizeToFit()
            $0.setTextWithLineHeight(lineHeight: 21)
        }
        
        dummyLabel.frame = CGRect(x: 0,
                                  y: 0,
                                  width: convertByWidthRatio(284),
                                  height: dummyLabel.calculateContentHeight(lineHeight: 21))
        
        return dummyLabel.calculateContentHeight(lineHeight: 21)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ScrapStashViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = convertByWidthRatio(314)
        let height: CGFloat = setDummyLabel(scrapedExpressionList[indexPath.item].scrapedExpression) + 90
        
        return CGSize(width: width, height: height)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return scrapedInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return scrapedLineSpacing
    }
}

// MARK: - UICollectionViewDataSource

extension ScrapStashViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scrapedExpressionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let listCell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrapedListCollectionViewCell.identifier, for: indexPath)
                as? ScrapedListCollectionViewCell else {return UICollectionViewCell() }
        listCell.dataBind(model: scrapedExpressionList[indexPath.item])
        return listCell
    }
}
