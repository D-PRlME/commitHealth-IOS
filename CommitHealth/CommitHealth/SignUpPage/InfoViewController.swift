import UIKit
import SnapKit
import Then


class InfoViewController: UIViewController {

    let titleLabel = UILabel().then {
        $0.text = "이름을\n알려주세요"
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.numberOfLines = 2
    }
    
    let nameLabel = UILabel().then {
        $0.text = "이름"
        $0.textColor = UIColor(named: "Gray-5")
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
    }
    
    let nameTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor(named: "Gray-1")
    }
    
    let stNumLabel = UILabel().then {
        $0.text = "학번"
        $0.textColor = UIColor(named: "Gray-5")
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
    }
    
    let stNumTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.backgroundColor = UIColor(named: "Gray-1")
    }
    
    let messageLabel = UILabel().then {
        $0.text = "학년,반,번호 순서로 4자리로 입력해주세요"
        $0.textColor = UIColor(named: "Gray-5")
        $0.backgroundColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
    }
    
    let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-9"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 20)
        $0.backgroundColor = UIColor(named: "Green-5")
        $0.layer.cornerRadius = 6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        nextButton.addTarget(self, action: #selector(nextButtonClick), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillLayoutSubviews() {
        startSetting()
    }
    
    func startSetting() {
        [titleLabel, nameLabel, nameTextField, stNumLabel, stNumTextField, nextButton, messageLabel].forEach({self.view.addSubview($0)})
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(252)
            $0.height.equalTo(96)
            $0.leftMargin.equalToSuperview().offset(20)
            $0.topMargin.equalToSuperview().offset(70)
        }
        
        nameTextField.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left)
            $0.rightMargin.equalTo(-20)
            $0.height.equalTo(48)
            $0.topMargin.equalTo(nameLabel.snp.bottom).offset(15)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.left.equalTo(nameTextField.snp.left).offset(10)
        }
        
        stNumLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
            $0.left.equalTo(stNumTextField.snp.left).offset(10)
        }
        
        stNumTextField.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left)
            $0.rightMargin.equalTo(-20)
            $0.height.equalTo(48)
            $0.topMargin.equalTo(stNumLabel.snp.bottom).offset(15)
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(stNumTextField.snp.bottom).offset(14)
            $0.left.equalTo(stNumLabel.snp.left)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.width.equalTo(348)
            $0.height.equalTo(65)
        }
    }
    
    @objc func nextButtonClick() {
        print("NEXT")
//        guard let inputAccount = idTextField.text,
//              inputAccount.isEmpty == true else {
//            if let Account = idTextField.text, let PassWord = pwTextField.text,
//               Account == "Admin" && pwChack(PassWord) {
//                //맞는 id일때 넘어가기
//                print("로그인 성공")
//            } else {
//                let singUpAlert = UIAlertController(title: "옳바르지 않은 형식입니다", message: "다시 확인해주세요!" ,preferredStyle: .alert)
//                let singUpAlertCancel = UIAlertAction(title: "알겠습니다", style: .cancel, handler: nil)
//                singUpAlert.addAction(singUpAlertCancel)
//                self.present(singUpAlert, animated: true, completion: nil)
//            }
//            return;
//        }
    }
}
