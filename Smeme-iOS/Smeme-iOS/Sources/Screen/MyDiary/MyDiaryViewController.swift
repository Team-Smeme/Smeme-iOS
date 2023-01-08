//
//  MyDiaryViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import UIKit

final class MyDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    let diaryList = ["The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed...The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed... I was just the part of the process not The issue that requires the phone call", "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed...The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was jus", "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but"]
    
    // MARK: - UI Property
    
    private let navigationBar = MyDiaryNavigationBar().then {
        $0.goMyProfileView = {
            print("내프로필뷰로 이동")
        }
    }
    
    private let dateBar = MyDiaryDateBar().then {
        $0.increaseDate = {
            print("날짜 증가")
        }
        $0.decreaseDate = {
            print("날짜 감소")
        }
    }
    
    private lazy var floatingButton = UIButton().then {
        $0.setImage(Constant.Image.btnPlus, for: .normal)
        $0.addTarget(self, action: #selector(floatingButtonClicked(_:)), for: .touchUpInside)
        $0.addShadow(shadowColor: .black, shadowOpacity: 0.08, shadowRadius: 20, offset: CGSize(width: 0, height: 0))
    }
    
    private lazy var myDiaryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 0)
        
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
        registerCell()
        setDelegate()
    }
    
    // MARK: - @objc
    
    @objc func floatingButtonClicked(_ sender: UIButton) {
        let newVC = MyDiaryFloatingButtonViewController()
        newVC.modalTransitionStyle = .crossDissolve
        newVC.modalPresentationStyle = .overFullScreen
        self.present(newVC, animated: true, completion: nil)
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .background
    }
    
    private func setLayout() {
        view.addSubviews([navigationBar, dateBar, myDiaryCollectionView, floatingButton])
        
        navigationBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        dateBar.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        floatingButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(bottomHeightByNotch(102))
            $0.trailing.equalToSuperview().inset(18)
        }
        
        myDiaryCollectionView.snp.makeConstraints {
            $0.top.equalTo(dateBar.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
    
    private func registerCell() {
        myDiaryCollectionView.register(MyDiaryCollectionViewCell.self, forCellWithReuseIdentifier: MyDiaryCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        myDiaryCollectionView.delegate = self
        myDiaryCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate

extension MyDiaryViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource

extension MyDiaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diaryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyDiaryCollectionViewCell.identifier, for: indexPath) as? MyDiaryCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(diaryList[indexPath.row])
        
        if indexPath.item == 0 {
            cell.isSelected = true
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MyDiaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: convertByWidthRatio(315), height: convertByHeightRatio(434))
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
