import UIKit
import SnapKit
import Then

class ThreeBodyInfoViewController: UIViewController {
    
    let titleLabel = UILabel().then {
        $0.text = "3대 중량을\n기록해주세요"
        $0.textColor = UIColor(named: "Gray-9")
        $0.font = UIFont(name: "Pretendard-Bold", size: 32)
        $0.numberOfLines = .max
    }
    
    let kg1 = UILabel().then {
        $0.text = "Kg"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-Medium", size: 20)
    }
    let kg2 = UILabel().then {
        $0.text = "Kg"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-Medium", size: 20)
    }
    let kg3 = UILabel().then {
        $0.text = "Kg"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-Medium", size: 20)
    }
    
    let squatLabel = UILabel().then {
        $0.text = "스쿼트"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-ExtraBold", size: 14)
    }
    
    let benchLabel = UILabel().then {
        $0.text = "벤치 프레스"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-ExtraBold", size: 14)
    }
    
    let deadliftLabel = UILabel().then {
        $0.text = "데드 리프트"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-ExtraBold", size: 14)
    }
    
    let squatTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor(named: "Gray-1")
        $0.layer.borderColor = UIColor.blue.cgColor
    }
    
    let benchTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor(named: "Gray-1")
    }
    
    let deadliftTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor(named: "Gray-1")
    }
    
    let howToButton = UIButton().then {
        $0.setTitle("어떻게 측정하나요?", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-6"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 20)
    }
    
    let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-9"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 24)
        $0.backgroundColor = UIColor(named: "Green-5")
        $0.layer.cornerRadius = 6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        nextButton.addTarget(self, action: #selector(nextButtonClick), for: .touchUpInside)
        howToButton.addTarget(self, action: #selector(howToButtonClick), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLayoutSubviews() {
        startSetting()
    }
    
    func startSetting() {
        [titleLabel, squatLabel, benchLabel, deadliftLabel, squatTextField, benchTextField, deadliftTextField, howToButton, nextButton, kg1, kg2, kg3].forEach({self.view.addSubview($0)})
        
        titleLabel.snp.makeConstraints {
            $0.leftMargin.equalToSuperview().offset(20)
            $0.topMargin.equalToSuperview().offset(70)
        }
        
        squatLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.left.equalTo(squatTextField.snp.left).offset(10)
        }
        
        squatTextField.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left)
            $0.rightMargin.equalTo(-20)
            $0.height.equalTo(48)
            $0.top.equalTo(squatLabel.snp.bottom).offset(8)
        }
        
        benchLabel.snp.makeConstraints {
            $0.top.equalTo(squatTextField.snp.bottom).offset(8)
            $0.left.equalTo(benchTextField.snp.left).offset(10)
        }

        benchTextField.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left)
            $0.rightMargin.equalTo(-20)
            $0.height.equalTo(48)
            $0.top.equalTo(benchLabel.snp.bottom).offset(8)
        }
        
        deadliftLabel.snp.makeConstraints {
            $0.top.equalTo(benchTextField.snp.bottom).offset(8)
            $0.left.equalTo(benchTextField.snp.left).offset(10)
        }
        
        deadliftTextField.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left)
            $0.rightMargin.equalTo(-20)
            $0.height.equalTo(48)
            $0.top.equalTo(deadliftLabel.snp.bottom).offset(8)
        }
        
        howToButton.snp.makeConstraints {
            $0.bottom.equalTo(nextButton.snp.top).offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.width.equalTo(348)
            $0.height.equalTo(65)
        }
        
        kg1.snp.makeConstraints {
            $0.centerY.equalTo(squatTextField.snp.centerY)
            $0.left.equalTo(squatTextField.snp.right).inset(35)
        }
        kg2.snp.makeConstraints {
            $0.centerY.equalTo(benchTextField.snp.centerY)
            $0.left.equalTo(benchTextField.snp.right).inset(35)
        }
        kg3.snp.makeConstraints {
            $0.centerY.equalTo(deadliftTextField.snp.centerY)
            $0.left.equalTo(deadliftTextField.snp.right).inset(35)
        }
    }
    
    @objc func howToButtonClick() {
        navigationController?.pushViewController(HowToViewController(), animated: true)
    }
    
    @objc func nextButtonClick() {
        print("다음")
    }
}

class HowToViewController: UIViewController {
    
    let howTitleLabel = UILabel().then {
        $0.text = "3대 중량은\n어떻게 측정하나요?"
        $0.textColor = UIColor(named: "Gray-9")
        $0.font = UIFont(name: "Pretendard-Bold", size: 32)
        $0.numberOfLines = .max
    }
    
    let writeButton = UIButton().then {
        $0.setTitle("입력하기", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-9"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 24)
        $0.backgroundColor = UIColor(named: "Green-5")
        $0.layer.cornerRadius = 6
    }
    
    let skipButton = UIButton().then {
        $0.setTitle("나중에 할게요", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-6"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        skipButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
        writeButton.addTarget(self, action: #selector(writeButtonClick), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLayoutSubviews() {
        startSetting()
    }
    
    func startSetting() {
        [howTitleLabel, writeButton, skipButton].forEach({self.view.addSubview($0)})
        
        howTitleLabel.snp.makeConstraints {
            $0.leftMargin.equalToSuperview().offset(20)
            $0.topMargin.equalToSuperview().offset(70)
        }
        
        writeButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.width.equalTo(348)
            $0.height.equalTo(65)
        }
        
        skipButton.snp.makeConstraints {
            $0.bottom.equalTo(writeButton.snp.top).offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
    @objc func skipButtonClick() {
        navigationController?.pushViewController(EndSignUpViewController(), animated: true)
    }
    
    @objc func writeButtonClick() {
        navigationController?.popViewController(animated: true)
    }
}
