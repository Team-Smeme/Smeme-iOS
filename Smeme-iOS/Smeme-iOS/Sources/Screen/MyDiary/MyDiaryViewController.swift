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
    
    var diaryList: [MyDiary] = []
    
    var myDiaryDetail = MyDiaryDetailResponse(content: "", topicID: 0, topic: "", category: "", isPublic: false, createdAt: "", likeCnt: 0)
    
    // MARK: - UI Property
    
    private let headerView = UIView().then {
        $0.makeRoundCorner(cornerRadius: 30)
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        $0.backgroundColor = .white
        $0.addShadow(shadowColor: .black, shadowOpacity: 0.06, shadowRadius: 26, offset: CGSize(width: 0, height: 4))
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
    
    override func viewWillAppear(_ animated: Bool) {
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
        print(URLConstant.detailMyDiaryListURL + "\(67)")
        view.backgroundColor = .background
    }
    
    private func setLayout() {
        view.addSubviews([notchWhiteView, headerView, myDiaryCollectionView, floatingButton])
        headerView.addSubviews([navigationBar, dateBar])
        
        notchWhiteView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        headerView.snp.makeConstraints {
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
        
        self.view.bringSubviewToFront(headerView)
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
        detailMyDiaryViewController.diaryId = diaryList[indexPath.row].diaryId
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
        let content = diaryList[indexPath.row].content
        let time = diaryList[indexPath.row].createdAt
        cell.setData(content: content, time: time)
        
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

// MARK: - Network

extension MyDiaryViewController {
    func totalMyDiaryListWithAPI() {
        MyDiaryAPI.shared.totalMyDiaryList { response in
            guard let diariesData = response?.data?.diaries else { return }
            self.diaryList = diariesData
            self.myDiaryCollectionView.reloadData()
        }
    }
    
    func detailMyDiaryWithAPI(diaryId: Int) {
        MyDiaryAPI.shared.detailMyDiaryList(diaryId: diaryId) { response in
            guard let diaryData = response?.data else { return }
            self.myDiaryDetail = diaryData
        }
    }
}
