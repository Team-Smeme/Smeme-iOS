//
//  MyDiaryViewController.swift
//  Smeme-iOS
//
//  Created by 황찬미 on 2023/01/04.
//

import UIKit

import Moya

final class MyDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    var simpleDiaryList: [MyDiaryListResponse] = []
    var diaryList: [MyDiaryDetailResponse] = [MyDiaryDetailResponse(content: "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed...The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed... I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed...The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed... I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed", category: "일상", topic: "", isPublic: true, createdAt: "2022-12-24 12:30", likeCnt: 2), MyDiaryDetailResponse(content: "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the phone call we have to solve it in person but sometimes some violence is needed...The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process not The issue that requires the ", category: "일상", topic: "", isPublic: true, createdAt: "2022-12-24 12:30", likeCnt: 5), MyDiaryDetailResponse(content: "The issue that requires the phone call we have to solve it in person but sometimes some violence is needed. I was just the part of the process ", category: "일상", topic: "", isPublic: true, createdAt: "2022-12-24 12:30", likeCnt: 4)]
    
    // MARK: - UI Property
    
    private lazy var myDiaryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
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
    
    private let headerView = UIView().then {
        $0.backgroundColor = .smemeWhite
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
        registerCell()
        setDelegate()
        totalMyDiaryListWithAPI()
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
        view.addSubviews([headerView, navigationBar, dateBar, myDiaryCollectionView, floatingButton])
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(constraintByNotch(47, 20))
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
        return simpleDiaryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyDiaryCollectionViewCell.identifier, for: indexPath) as? MyDiaryCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(content: simpleDiaryList[indexPath.row].content!, time: simpleDiaryList[indexPath.row].createdAt!)
        
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
        return UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 0)
    }
}

// MARK: - Network

extension MyDiaryViewController {
     func totalMyDiaryListWithAPI() {
         MyDiaryAPI.shared.totalMyDiaryList { response in
             switch response {
             case .success(let data):
                 if let diaries = data as? [MyDiaryListResponse] {
                     self.simpleDiaryList = diaries
                     self.myDiaryCollectionView.reloadData()
                 }
             case .requestErr(let message):
                 print("latestPhotosWithAPI - requestErr: \(message)")
             case .pathErr:
                 print("latestPhotosWithAPI - pathErr")
             case .serverErr:
                 print("latestPhotosWithAPI - serverErr")
             case .networkFail:
                 print("latestPhotosWithAPI - networkFail")
             }
         }
     }
 }
