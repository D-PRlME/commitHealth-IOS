import UIKit
import SnapKit
import Then

class TermsViewController: UIViewController {
    let titleLabel = UILabel().then {
        $0.text = "약관을 모두 읽고\n동의해주세요"
        $0.textColor = UIColor(named: "Gray-9")
        $0.font = UIFont(name: "Pretendard-Bold", size: 32)
        $0.numberOfLines = .max
    }
    
    let termsScrollView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
    }
    
    let contentView = UIView()
    
    var termAgreeStatus: Bool = false
    
    let termTextLabel = UILabel().then {
        $0.text = " 국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이 체포 또는 구금되지 아니한다. 모든 국민은 사생활의 비밀과 자유를 침해받지 아니한다. 국회는 헌법 또는 법률에 특별한 규정이 없는 한 재적의원 과반수의 출석과 출석의원 과반수의 찬성으로 의결한다. 가부동수인 때에는 부결된 것으로 본다. 대법원장의 임기는 6년으로 하며, 중임할 수 없다. 피고인의 자백이 고문·폭행·협박·구속의 부당한 장기화 또는 기망 기타의 방법에 의하여 자의로 진술된 것이 아니라고 인정될 때 또는 정식재판에 있어서 피고인의 자백이 그에게 불리한 유일한 증거일 때에는 이를 유죄의 증거로 삼거나 이를 이유로 처벌할 수 없다.\n\n 제1항의 지시를 받은 당해 행정기관은 이에 응하여야 한다. 외국인은 국제법과 조약이 정하는 바에 의하여 그 지위가 보장된다. 국가는 평생교육을 진흥하여야 한다. 공무원인 근로자는 법률이 정하는 자에 한하여 단결권·단체교섭권 및 단체행동권을 가진다. 대통령이 제1항의 기간내에 공포나 재의의 요구를 하지 아니한 때에도 그 법률안은 법률로서 확정된다. 대한민국은 민주공화국이다. 국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다. 이 헌법시행 당시의 대법원장과 대법원판사가 아닌 법관은 제1항 단서의 규정에 불구하고 이 헌법에 의하여 임명된 것으로 본다. 대법원에 대법관을 둔다. 다만, 법률이 정하는 바에 의하여 대법관이 아닌 법관을 둘 수 있다.\n\n 선거운동은 각급 선거관리위원회의 관리하에 법률이 정하는 범위안에서 하되, 균등한 기회가 보장되어야 한다. 모든 국민은 그 보호하는 자녀에게 적어도 초등교육과 법률이 정하는 교육을 받게 할 의무를 진다. 제2항의 재판관중 3인은 국회에서 선출하는 자를, 3인은 대법원장이 지명하는 자를 임명한다. 대통령이 궐위되거나 사고로 인하여 직무를 수행할 수 없을 때에는 국무총리, 법률이 정한 국무위원의 순서로 그 권한을 대행한다. 일반사면을 명하려면 국회의 동의를 얻어야 한다. 위원은 정당에 가입하거나 정치에 관여할 수 없다. 대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다."
        $0.textColor = UIColor(named: "Gray-9")
        $0.font = UIFont(name: "Pretendard-Medium", size: 18)
        $0.numberOfLines = .max
    }
    
    let termAgreeLabel = UILabel().then {
        $0.text = "개인정보 활용 및 보관 약관(필수)"
        $0.textColor = UIColor(named: "Gray-9")
        $0.font = UIFont(name: "Pretendard-Medium", size: 18)
    }
    
    let termAgreeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        $0.setPreferredSymbolConfiguration(.init(pointSize: 25, weight: .regular, scale: .default), forImageIn: .normal)
        $0.backgroundColor = .clear
        $0.tintColor = UIColor(named: "Gray-1")
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
        termAgreeButton.addTarget(self, action: #selector(termAgreeButtonClick), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillLayoutSubviews() {
        startSetting()
    }
    
    func startSetting() {
        [titleLabel, nextButton, termsScrollView, termAgreeButton, termAgreeLabel].forEach({self.view.addSubview($0)})
        termsScrollView.addSubview(contentView)
        contentView.addSubview(termTextLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leftMargin.equalToSuperview().offset(20)
            $0.topMargin.equalToSuperview().offset(70)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.width.equalTo(348)
            $0.height.equalTo(65)
        }
        
        termsScrollView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(nextButton.snp.top).offset(-96)
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(termsScrollView.snp.top)
            $0.left.equalTo(termsScrollView.snp.left)
            $0.right.equalTo(termsScrollView.snp.right)
            $0.bottom.equalTo(termsScrollView.snp.bottom)
            $0.width.equalTo(termsScrollView.snp.width)
            $0.height.equalTo(termTextLabel.snp.height)
        }
        
        termTextLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).inset(20)
            $0.right.equalTo(contentView.snp.right).inset(20)
        }
        
        termAgreeButton.snp.makeConstraints {
            $0.left.equalTo(nextButton.snp.left).offset(8)
            $0.bottom.equalTo(nextButton.snp.top).offset(-25)
        }
        
        termAgreeLabel.snp.makeConstraints {
            $0.centerY.equalTo(termAgreeButton.snp.centerY)
            $0.left.equalTo(termAgreeButton.snp.right).offset(10)
        }
    }
    
    @objc func nextButtonClick() {
        if termAgreeStatus == true {
            navigationController?.pushViewController(TermsNextViewController(), animated: true)
        } else {
            let termAlert = UIAlertController(title: "오류", message: "필수 약관을 확인해주세요", preferredStyle: .alert)
            let termAction = UIAlertAction(title: "알겠습니다", style: .default)
            termAlert.addAction(termAction)
            self.present(termAlert, animated: true, completion: nil)
        }
        
    }
    
    @objc func termAgreeButtonClick() {
        switch termAgreeStatus {
        case true:
            termAgreeButton.tintColor = UIColor(named: "Gray-1")
            termAgreeStatus = false
        case false:
            termAgreeButton.tintColor = UIColor(named: "Green-5")
            termAgreeStatus = true
        }
    }
}


//MARK: - 이용약관 다음 대기 페이지
class TermsNextViewController: UIViewController {
    let titleLabel = UILabel().then {
        $0.text = "당신의 건강한\n개발 라이프를 위해,\n커밋헬스가\n응원할게요"
        $0.textColor = .black
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.numberOfLines = 4
    }
    
    let subLabel = UILabel().then {
        $0.text = "가입이 완료됐어요.\n이제 프로필 입력을 시작할게요"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Medium", size: 20)
        $0.numberOfLines = 2
    }
    
    let startButton = UIButton().then {
        $0.setTitle("시작하기", for: .normal)
        $0.setTitleColor(UIColor(named: "Gray-9"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 20)
        $0.backgroundColor = UIColor(named: "Green-5")
        $0.layer.cornerRadius = 6
    }
    	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        startButton.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    func startSetting() {
        [titleLabel, subLabel, startButton].forEach({self.view.addSubview($0)})
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-30)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(38)
            $0.centerX.equalToSuperview()
        }
        
        startButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().offset(-20)
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.width.equalTo(348)
            $0.height.equalTo(65)
        }
    }
    
    override func viewWillLayoutSubviews() {
        startSetting()
    }
    
    @objc func startButtonClick() {
        navigationController?.pushViewController(BodyInfoViewController(), animated: true)
    }
}
