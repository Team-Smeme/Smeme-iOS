//
//  MyDiaryViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import UIKit

final class MyDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    let diaryList: [MyDiaryDetailResponse] = [MyDiaryDetailResponse(content: "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed...The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed... I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed...The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed... I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed", category: "일상", topic: "", isPublic: true, createdAt: "2022-12-24 12:30", likeCnt: 2), MyDiaryDetailResponse(content: "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed...The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the ", category: "일상", topic: "", isPublic: true, createdAt: "2022-12-24 12:30", likeCnt: 5), MyDiaryDetailResponse(content: "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process ", category: "일상", topic: "", isPublic: true, createdAt: "2022-12-24 12:30", likeCnt: 4)]
    
    // MARK: - UI Property
    
    private let headerView = UIView().then {
        $0.makeRoundCorner(cornerRadius: 30)
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.06).cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowRadius = 26
        $0.layer.shadowOpacity = 1
    }
    
    private lazy var myDiaryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    private let notchWhiteView = UIView().then {
        $0.backgroundColor = .smemeWhite
    }
    
    private lazy var navigationBar = MyDiaryNavigationBar().then {
        $0.goMyProfileView = {
            let mySmemeVC = MySmemeViewController()
            self.navigationController?.pushViewController(mySmemeVC, animated: true)
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
        let newdetailMyDiaryViewControllerVC = MyDiaryFloatingButtonViewController()
        newdetailMyDiaryViewControllerVC.modalTransitionStyle = .crossDissolve
        newdetailMyDiaryViewControllerVC.modalPresentationStyle = .overFullScreen
        self.present(newdetailMyDiaryViewControllerVC, animated: true, completion: nil)
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .background
    }
    
    private func setLayout() {
        view.addSubviews([notchWhiteView, headerView, navigationBar, dateBar, myDiaryCollectionView, floatingButton])
        
        notchWhiteView.snp.makeConstraints { /// 노치부분 하얗게 해주기 위해서 선언
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        headerView.snp.makeConstraints { /// 상단 notchWhiteView, navigationBar, dateBar를 묶어줌, 그림자를 위해서 넣었습니다 안넣으면 그림자가 dateBar에만 적용되어 중간이 짤리더라구요!
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(dateBar.snp.bottom)
        }
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
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
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
        }
        
        view.bringSubviewToFront(self.dateBar)
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

extension MyDiaryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailMyDiaryViewController = DetailMyDiaryViewController()
        let myDiaryInfo: MyDiaryDetailResponse = diaryList[indexPath.row]
        detailMyDiaryViewController.myDiaryDetail = MyDiaryDetailResponse(content: myDiaryInfo.content, category: myDiaryInfo.category, topic: myDiaryInfo.topic, isPublic: myDiaryInfo.isPublic, createdAt: myDiaryInfo.createdAt, likeCnt: myDiaryInfo.likeCnt)
        self.navigationController?.pushViewController(detailMyDiaryViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension MyDiaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diaryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyDiaryCollectionViewCell.identifier, for: indexPath) as? MyDiaryCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(content: diaryList[indexPath.row].content, time: diaryList[indexPath.row].createdAt)
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 18, left: 30, bottom: 18, right: 30)
    }
}
