import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel().then {
        $0.text = "돌아오신 걸\n환영해요!"
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.numberOfLines = 2
    }
    
    let idLabel = UILabel().then {
        $0.text = "아이디"
        $0.textColor = UIColor(named: "Gray-5")
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
    }
    
    let idTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor(named: "Gray-1")
    }
    
    let pwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.textColor = UIColor(named: "Gray-5")
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
    }
    
    let pwTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor(named: "Gray-1")
        $0.isSecureTextEntry = true
    }
    
    let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-9"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 20)
        $0.backgroundColor = UIColor(named: "Green-5")
        $0.layer.cornerRadius = 6
    }
    
    let lostAccountButton = UIButton().then {
        $0.setTitle("계정을 잃어버렸나요?", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-6"), for: .normal)
    }
    
    let pwStatusOp1ChackLabel = UILabel().then {
        $0.text = "❌영어 대/소문자와 숫자를 포함해야 해요"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
        $0.numberOfLines = 3
    }
    
    let pwStatusOp2ChackLabel = UILabel().then {
        $0.text = "❌길이는 8 글자를 넘어야 해요"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
        $0.numberOfLines = 3
    }
    
    let pwStatusOp3ChackLabel = UILabel().then {
        $0.text = "❌특수문자(!@#$&%*,.)를 포함해야 해요"
        $0.textColor = UIColor(named: "Gray-5")
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
        $0.numberOfLines = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        nextButton.addTarget(self, action: #selector(nextButtonClick), for: .touchUpInside)
        lostAccountButton.addTarget(self, action: #selector(lostAccountButtonClick), for: .touchUpInside)
        pwTextField.addTarget(self, action: #selector(pwTextfieldWillEdit), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(systemName: "arrow.left")
        backButton.action = #selector(backButtonClick)
        backButton.target = self
        self.navigationItem.setLeftBarButton(backButton, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        startSetting()
    }
    
    func startSetting() {
        [titleLabel, idLabel, idTextField, pwLabel, pwTextField, nextButton, lostAccountButton, pwStatusOp1ChackLabel, pwStatusOp2ChackLabel, pwStatusOp3ChackLabel].forEach({self.view.addSubview($0)})
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(252)
            $0.height.equalTo(96)
            $0.leftMargin.equalToSuperview().offset(20)
            $0.topMargin.equalToSuperview().offset(70)
        }
        
        idTextField.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left)
            $0.rightMargin.equalTo(-20)
            $0.height.equalTo(48)
            $0.topMargin.equalTo(idLabel.snp.bottom).offset(15)
        }
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.left.equalTo(idTextField.snp.left).offset(10)
        }
        
        pwLabel.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.left.equalTo(pwTextField.snp.left).offset(10)
        }
        
        pwTextField.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left)
            $0.rightMargin.equalTo(-20)
            $0.height.equalTo(48)
            $0.topMargin.equalTo(pwLabel.snp.bottom).offset(15)
        }
        
        pwStatusOp1ChackLabel.snp.makeConstraints {
            $0.left.equalTo(pwLabel.snp.left)
            $0.top.equalTo(pwTextField.snp.bottom).offset(14)
        }
        
        pwStatusOp2ChackLabel.snp.makeConstraints {
            $0.left.equalTo(pwLabel.snp.left)
            $0.top.equalTo(pwStatusOp1ChackLabel.snp.bottom).offset(6)
        }
        
        pwStatusOp3ChackLabel.snp.makeConstraints {
            $0.left.equalTo(pwLabel.snp.left)
            $0.top.equalTo(pwStatusOp2ChackLabel.snp.bottom).offset(6)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.width.equalTo(348)
            $0.height.equalTo(65)
        }
        
        lostAccountButton.snp.makeConstraints {
            $0.bottom.equalTo(nextButton.snp.top).offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
    @objc func nextButtonClick() {
        guard let inputAccount = idTextField.text,
              inputAccount.isEmpty == true else {
            if let Account = idTextField.text, let PassWord = pwTextField.text,
               Account == "Admin" && pwChack(PassWord) {
                //맞는 id일때 넘어가기
                print("로그인 성공")
            } else {
                let singUpAlert = UIAlertController(title: "옳바르지 않은 형식입니다", message: "다시 확인해주세요!" ,preferredStyle: .alert)
                let singUpAlertCancel = UIAlertAction(title: "알겠습니다", style: .cancel, handler: nil)
                singUpAlert.addAction(singUpAlertCancel)
                self.present(singUpAlert, animated: true, completion: nil)
            }
            return;
        }
    }
    
    @objc func pwTextfieldWillEdit() {
        let textValue = pwTextField.text!
        if pwOp1(textValue) {
            pwStatusOp1ChackLabel.text = "✅영어 대/소문자와 숫자를 포함해야 해요"
        } else {
            pwStatusOp1ChackLabel.text = "❌영어 대/소문자와 숫자를 포함해야 해요"
        }
        
        if textValue.count >= 8 {
            pwStatusOp2ChackLabel.text = "✅길이는 8 글자를 넘어야 해요"
        } else {
            pwStatusOp2ChackLabel.text = "❌길이는 8 글자를 넘어야 해요"
        }
        
        if pwOp3(textValue) {
            pwStatusOp3ChackLabel.text = "✅특수문자(!@#$&%*,.)를 포함해야 해요"
        } else {
            pwStatusOp3ChackLabel.text = "❌특수문자(!@#$&%*,.)를 포함해야 해요"
        }
    }
    
    func pwOp1(_ pw: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{0,}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: pw)
    }
    
    func pwOp3(_ pw: String) -> Bool {
        let passwordRegEx = "^(?=.*[!@#$&%*,.]).{0,}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: pw)
    }
    
    func pwChack(_ pw: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$&%*,.]).{8,}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: pw)
    }
    
    @objc func lostAccountButtonClick() {
        print("계정을 잃어버렸어요!")
    }
    
    @objc func backButtonClick() {
        navigationController?.popViewController(animated: true)
    }
}


