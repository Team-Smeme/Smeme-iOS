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
    
    var openDiaryCategoryArray: [Category] = [Category(id: 0, content: "전체"), Category(id: 0, content: "일상")]
    var openDiaryListArray: [DiaryList] = []
    
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
        getOpenDiaryCategoryAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getOpenDiaryTotalListAPI()
    }
    
    // MARK: - @objc
    
    @objc private func touchupNextButton() {
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

extension OpenDiaryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == topicCollectionView {
            if indexPath.row == 0 {
                getOpenDiaryTotalListAPI()
            } else {
                getOpenDiarySelectList(param: indexPath.row - 1)
            }
        } else if collectionView == diaryListCollectionView {
            let detailOpenDiaryViewController = DetailOpenDiaryViewController()
            self.navigationController?.pushViewController(detailOpenDiaryViewController, animated: true)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension OpenDiaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topicCollectionView {
            return openDiaryCategoryArray.count
        } else if collectionView == diaryListCollectionView {
            return openDiaryListArray.count
        }
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topicCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicCollectionViewCell.identifier, for: indexPath) as? TopicCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(openDiaryCategoryArray[indexPath.item])
            
            if indexPath.row == 0 {
                cell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
            }
            return cell
        } else if collectionView == diaryListCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiaryListCollectionViewCell.identifier, for: indexPath) as? DiaryListCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(openDiaryListArray[indexPath.row])
            
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OpenDiaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topicCollectionView {
            let cellSize = CGSize(width: openDiaryCategoryArray[indexPath.item].content.size(withAttributes: [NSAttributedString.Key.font: UIFont.subtitle2]).width + 24, height: 33)
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

// MARK: - Network

extension OpenDiaryViewController {
    private func getOpenDiaryCategoryAPI() {
        OpenDiaryCategoryAPI.shared.getOpenDiaryCategory { response in
            guard let openDiaryCategorydata = response?.data?.categories else { return }
            self.openDiaryCategoryArray += openDiaryCategorydata
            self.topicCollectionView.reloadData()
        }
    }
    
    private func getOpenDiaryTotalListAPI() {
        OpenDiaryTotalListAPI.shared.getOpenDiaryTotalList { response in
            guard let openDiaryListArray = response?.data?.diaries else { return }
            self.openDiaryListArray = openDiaryListArray
            self.diaryListCollectionView.reloadData()
        }
    }
    
    private func getOpenDiarySelectList(param: Int) {
        OpenDiaryTotalListAPI.shared.getOpenDiarySelectList(category: param) { response in
            guard let openDiarySelectList = response?.data?.diaries else { return }
            self.openDiaryListArray = openDiarySelectList
            self.diaryListCollectionView.reloadData()
        }
    }
}
