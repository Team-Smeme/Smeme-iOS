//
//  StepOneKoreanDiaryViewController.swift
//  Smeme-iOS
//
//  Created by Joon Baek on 2023/01/09.
//

import UIKit

import SnapKit
import Then

final class StepOneKoreanDiaryViewController: UIViewController {
    
    // MARK: - Property
    
    var isRandomTopic: Bool = false
    var isPublic: Bool = true
    
    var randomSubject = RandomSubjectResponse(id: 0, content: "")
    var topicID: Int?
    var diaryID: Int?
    
    // MARK: - UI Property
    
    private let naviView = UIView()
    private let languageView = UIView()
    
    private lazy var diaryTextView = UITextView().then {
        $0.setLineSpacing()
        $0.textColor = .gray400
        $0.delegate = self
    }
    
    private let placeHolderLabel = UILabel().then {
        $0.text = "최소 10자 이상의 외국어를 작성해 주세요"
        $0.textColor = .gray400
        $0.font = .body1
        $0.setTextWithLineHeight(lineHeight: 21)
    }
    
    private var randomSubjectView = RandomSubjectView().then {
        $0.configure(with: RandomSubjectViewModel(contentText: "오늘부터 딱 일주일 후! 설레는 크리스마스네요. 일주일 전부터 세워보는 나의 크리스마스 계획은?", isHiddenRefreshButton: true))
    }
    
    private lazy var cancelButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.smemeBlack, for: .normal)
        $0.titleLabel?.setTextWithLineHeight(lineHeight: 21)
        $0.setTitle("취소", for: .normal)
        $0.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var nextButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.smemeBlack, for: .normal)
        $0.titleLabel?.setTextWithLineHeight(lineHeight: 21)
        $0.setTitle("다음", for: .normal)
        $0.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    private let languageLabel = UILabel().then {
        $0.font = .subtitle2
        $0.textColor = .smemeBlack
        $0.setTextWithLineHeight(lineHeight: 19)
        $0.text = "한국어"
    }
    
    private let stepLabel = UILabel().then {
        $0.font = .caption1
        $0.textColor = .gray400
        $0.setTextWithLineHeight(lineHeight: 14)
        $0.text = "STEP 1"
    }
    
    private let tipLabel = UILabel().then {
        $0.font = .body2
        $0.textColor = .gray600
        $0.setTextWithLineHeight(lineHeight: 17)
        $0.text = "TIP 정확한 힌트를 받고 싶다면? 문장을 정리해보세요!"
        $0.asColor(targetString: "TIP", color: .primary ?? UIColor())

    }
    
    private let bottomView = UIView().then {
        $0.backgroundColor = .white
        $0.addShadow(shadowColor: .black, shadowOpacity: 0.04, shadowRadius: 16, offset: CGSize(width: 0, height: -4.0))
    }
    
    private lazy var randomTopicButton = UIButton().then {
        $0.setImage(Constant.Image.btnRandomTopicCheckBox, for: .normal)
        $0.addTarget(self, action: #selector(randomTopicButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var publicButton = UIButton().then {
        $0.setImage(Constant.Image.btnPublicCheckBoxSelected, for: .normal)
        $0.addTarget(self, action: #selector(publicButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgoundColor()
        setLayout()
        randomSubjectWithAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showKeyboard(textView: diaryTextView)
        keyboardAddObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        keyboardRemoveObserver()
    }
    
    // MARK: - @objc
    
    @objc func randomTopicButtonDidTap(_ gesture: UITapGestureRecognizer) {
        setRandomTopicButtonToggle()
    }
    
    @objc func nextButtonDidTap() {
        let stepTwoKoreanDiaryViewController = StepTwoKoreanDiaryViewController()
        stepTwoKoreanDiaryViewController.koreanDiaryTextView.text = diaryTextView.text
        stepTwoKoreanDiaryViewController.randomTopicCheckBox = isRandomTopic
        stepTwoKoreanDiaryViewController.publicCheckBox = isPublic
        self.navigationController?.pushViewController(stepTwoKoreanDiaryViewController, animated: true)
    }
    
    @objc func cancelButtonDidTap() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        handleKeyboardChanged(notification: notification, customView: bottomView, isActive: true)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        handleKeyboardChanged(notification: notification, customView: bottomView, isActive: false)
    }
    
    @objc func publicButtonDidTap() {
        isPublic.toggle()
        if isPublic {
            publicButton.setImage(Constant.Image.btnPublicCheckBoxSelected, for: .normal)
        } else {
            publicButton.setImage(Constant.Image.btnPublicCheckBox, for: .normal)
        }
    }
    
    // MARK: - Custom Method
    
    private func setBackgoundColor() {
        view.backgroundColor = .smemeWhite
    }
    
    private func setData() {
        randomSubjectView.configure(with: RandomSubjectViewModel(contentText: randomSubject.content, isHiddenRefreshButton: true))
    }

    private func setLayout() {
        view.addSubviews([naviView, tipLabel, diaryTextView, bottomView])
        
        naviView.addSubviews([cancelButton, languageView, nextButton])
        diaryTextView.addSubview(placeHolderLabel)
        languageView.addSubviews([languageLabel, stepLabel])
        bottomView.addSubviews([randomTopicButton, publicButton])
        
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(convertByHeightRatio(66))
        }
        
        cancelButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
        }
        
        languageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.bottom.equalTo(nextButton)
            $0.leading.equalTo(languageLabel)
            $0.trailing.equalTo(languageLabel)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        languageLabel.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
        }
        
        stepLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(languageLabel.snp.bottom).offset(2)
        }
        
        tipLabel.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
        }
        
        diaryTextView.snp.makeConstraints {
            $0.top.equalTo(tipLabel.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
        
        placeHolderLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(7)
        }
        
        bottomView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(constraintByNotch(87, 53))
        }
        
        publicButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        randomTopicButton.snp.makeConstraints {
            $0.centerY.equalTo(publicButton)
            $0.trailing.equalTo(publicButton.snp.leading).offset(-16)
        }
    }
    
    private func setRandomTopicButtonToggle() {
        topicID = 0
        isRandomTopic.toggle()
        if isRandomTopic {
            randomTopicButton.setImage(Constant.Image.btnRandomTopicCheckBoxSelected, for: .normal)
            
            view.addSubview(randomSubjectView)
            
            languageView.snp.remakeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalTo(languageLabel.snp.trailing).offset(6)
            }
            
            randomSubjectView.snp.remakeConstraints {
                $0.top.equalTo(naviView.snp.bottom)
                $0.leading.equalToSuperview()
            }
            
            diaryTextView.snp.remakeConstraints {
                $0.top.equalTo(randomSubjectView.snp.bottom).offset(9)
                $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(30)
                $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
                $0.bottom.equalTo(bottomView.snp.top)
            }
            
        } else {
            randomTopicButton.setImage(Constant.Image.btnRandomTopicCheckBox, for: .normal)
            
            naviView.snp.remakeConstraints {
                $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
                $0.height.equalTo(convertByHeightRatio(66))
            }
            
            diaryTextView.snp.remakeConstraints {
                $0.top.equalTo(naviView.snp.bottom).offset(9)
                $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(30)
                $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
                $0.bottom.equalTo(bottomView.snp.top)
            }
            
            randomSubjectView.removeFromSuperview()
        }
    }
    
    private func keyboardAddObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func keyboardRemoveObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - UITextViewDelegate

extension StepOneKoreanDiaryViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeHolderLabel.isHidden = false
            textView.textColor = .smemeBlack
            textView.font = .body1
            textView.setLineSpacing()
            textView.tintColor = .clear
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeHolderLabel.isHidden = false
            textView.textColor = .smemeBlack
            textView.font = .body1
            textView.setLineSpacing()
            textView.tintColor = .clear
        } else {
            placeHolderLabel.isHidden = true
            textView.textColor = .gray400
            textView.font = .body1
            textView.setLineSpacing()
            textView.tintColor = .primary
        }
    }
}

// MARK: - Network

extension StepOneKoreanDiaryViewController {
    func randomSubjectWithAPI () {
        RandomSubjectAPI.shared.getRandomSubject { response in
            guard let randomSubjectData = response?.data else {return}
            self.randomSubject = randomSubjectData
            self.topicID = self.randomSubject.id
            self.setData()
        }
    }
}
