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
    
    var isTapped: Bool = true
    
    var id = 0
    
    var randomSubject = RandomSubjectResponse(id: 0, content: "")
    
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
        $0.configure(with: RandomSubjectViewModel(contentText: "오늘부터 딱 일주일 후! 설레는 크리스마스네요. 일주일 전부터 세워보는 나의 크리스마스 계획은?", isHiddenRefreshButton: false))
    }
    
    private let cancelButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.smemeBlack, for: .normal)
        $0.titleLabel?.setTextWithLineHeight(lineHeight: 21)
        $0.setTitle("취소", for: .normal)
    }
    
    private let completeButton = UIButton().then {
        $0.titleLabel?.font = .body1
        $0.setTitleColor(.smemeBlack, for: .normal)
        $0.titleLabel?.setTextWithLineHeight(lineHeight: 21)
        $0.setTitle("다음", for: .normal)
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
    
    private lazy var randomTopicButton: UIImageView = {
        let view = UIImageView(image: Constant.Image.btnRandomTopicCheckBoxDisabled)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(topikBTNDidTap(_:)))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let publicButton = UIImageView(image: Constant.Image.btnPublicCheckBoxSelected)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgoundColor()
        setLayout()
        
    }
    
    // MARK: - @objc
    
    @objc
    func topikBTNDidTap(_ gesture: UITapGestureRecognizer) {
        setRandomTopicButtonToggle()
    }
    
    // MARK: - Custom Method
    
    private func setBackgoundColor() {
        view.backgroundColor = .smemeWhite
    }
    
    private func setData() {
        randomSubjectView.configure(with: RandomSubjectViewModel(contentText: randomSubject.content, isHiddenRefreshButton: false))
    }

    private func setLayout() {
        view.addSubviews([naviView, tipLabel, diaryTextView, bottomView])
        
        naviView.addSubviews([cancelButton, languageView, completeButton])
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
            $0.top.bottom.equalTo(cancelButton)
            $0.leading.equalTo(languageLabel)
            $0.trailing.equalTo(languageLabel)
        }
        
        completeButton.snp.makeConstraints {
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
            $0.top.equalTo(tipLabel.snp.bottom).offset(10)
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
        isTapped.toggle()
        if isTapped {
            randomTopicButton.image = Constant.Image.btnRandomTopicCheckBox
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

        } else {
            randomTopicButton.image = Constant.Image.btnRandomTopicCheckBoxSelected
            view.addSubview(randomSubjectView)

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
        }
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
