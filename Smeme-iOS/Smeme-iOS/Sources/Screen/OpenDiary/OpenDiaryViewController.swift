//
//  OpenDiaryViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import UIKit

import SnapKit
import Then

final class OpenDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    let topicList = ["전체", "일상", "기념일", "취향", "자기계발"]
    let dummyList = ["heightByNotch", "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process", "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process The issue that requires the phone call we have to solve it in person but sometimes some violence is needed", "heightByNotch", "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process", "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process The issue that requires the phone call we have to solve it in person but sometimes some violence is needed"]
    
    // MARK: - UI Property
    
    private lazy var topicCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var diaryListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let headerView = UIView().then {
        $0.backgroundColor = .white
        $0.makeSelectedRoundCorners(cornerRadius: 30, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
    }
    
    private let containerView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let titleLable = UILabel().then {
        $0.text = "둘러보기"
        $0.font = .headline3
        $0.textColor = .black
        $0.setTextWithLineHeight(lineHeight: 26)
    }
    
    private lazy var myProfileButon = UIButton().then {
        $0.setImage(Constant.Image.icnProfile, for: .normal)
                $0.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
    }
    
    private lazy var languageStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 4
    }
    
    private let languageLabel = UILabel().then {
        $0.text = "영어"
        $0.font = .body2
        $0.textColor = .gray500
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    private let languageButton = UIButton().then {
        $0.setImage(Constant.Image.icnArrowUnder, for: .normal)
    }
    
    private lazy var sortStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 4
    }
    
    private let sortLabel = UILabel().then {
        $0.text = "최신순"
        $0.font = .body2
        $0.textColor = .gray500
        $0.setTextWithLineHeight(lineHeight: 17)
    }
    
    private let sortButton = UIButton().then {
        $0.setImage(Constant.Image.icnArrowUnder, for: .normal)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
        registerCell()
        setDelegate()
    }
    
    // MARK: - @objc
    
    @objc
    private func touchupNextButton() {
        pushToMySmemeViewController()
        self.tabBarController?.tabBar.isHidden = false

    }
        
    // MARK: - Custom Method
        
    private func setBackgroundColor() {
        view.backgroundColor = .background
    }
    
    private func setLayout() {
        view.addSubviews([headerView, diaryListCollectionView])
        headerView.addSubviews([topicCollectionView, containerView,
                                languageStackView, sortStackView])
        languageStackView.addArrangedSubview(languageLabel)
        languageStackView.addArrangedSubview(languageButton)
        sortStackView.addArrangedSubview(sortLabel)
        sortStackView.addArrangedSubview(sortButton)
        containerView.addSubviews([titleLable, myProfileButon])
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(constraintByNotch(198, 167))
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(66)
        }
        
        titleLable.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
        }
        
        myProfileButon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
        
        topicCollectionView.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        sortStackView.snp.makeConstraints {
            $0.top.equalTo(topicCollectionView.snp.bottom).offset(constraintByNotch(-18, -18))
            $0.trailing.equalToSuperview().inset(30)
        }
        
        languageStackView.snp.makeConstraints {
            $0.centerY.equalTo(sortStackView)
            $0.trailing.equalTo(sortStackView.snp.leading).offset(-14)
        }
        
        diaryListCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    private func registerCell() {
        topicCollectionView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: TopicCollectionViewCell.identifier)
        diaryListCollectionView.register(DiaryListCollectionViewCell.self, forCellWithReuseIdentifier: DiaryListCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        topicCollectionView.delegate = self
        topicCollectionView.dataSource = self
        diaryListCollectionView.delegate = self
        diaryListCollectionView.dataSource = self
    }
    
    private func pushToMySmemeViewController() {
        let mySmemeVC = MySmemeViewController()
        self.navigationController?.pushViewController(mySmemeVC, animated: true)
    }
}

// MARK: - UICollectionViewDelegate

extension OpenDiaryViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource

extension OpenDiaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topicCollectionView {
            return topicList.count
        } else if collectionView == diaryListCollectionView {
            return dummyList.count
        }
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topicCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicCollectionViewCell.identifier, for: indexPath) as? TopicCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(topicList[indexPath.row])
            
            if indexPath.item == 0 {
                cell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
            }
            return cell
        } else if collectionView == diaryListCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiaryListCollectionViewCell.identifier, for: indexPath) as? DiaryListCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(dummyList[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OpenDiaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topicCollectionView {
            let cellSize = CGSize(width: topicList[indexPath.item].size(withAttributes: [NSAttributedString.Key.font: UIFont.subtitle2]).width + 24, height: 33)
            return cellSize
        } else if collectionView == diaryListCollectionView {
            let cellWidth = convertByWidthRatio(315)
            let cellHeight = convertByHeightRatio(161)
            return CGSize(width: cellWidth, height: cellHeight)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == topicCollectionView {
            return 3
        }
        return CGFloat()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == diaryListCollectionView {
            return 12
        }
        return CGFloat()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == diaryListCollectionView {
            return UIEdgeInsets(top: 18, left: 30, bottom: 18, right: 30)
        }
        return UIEdgeInsets()
    }
}
