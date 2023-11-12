//
//  LoginCell.swift
//  MVVMC
//
//  Created by sam on 2023/11/1.
//

import Then
import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class LoginCell: NiblessTableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    lazy var titleLabel: UILabel = {
        UILabel()
            .then {
                $0.backgroundColor = .clear
                $0.numberOfLines = 0
                $0.textAlignment = .left
                $0.textColor = .black
                $0.font = UIFont.systemFont(ofSize: 15.scale(.iPhone_6s))
            }
            .then {
                contentView.addSubview($0)
                $0.snp.makeConstraints {
                    $0.top.equalToSuperview().offset(8.scale(.iPhone_6s))
                    $0.left.equalToSuperview().offset(10.scale(.iPhone_6s))
                    $0.right.equalToSuperview().offset(-10.scale(.iPhone_6s))
                }
            }
    }()
    
    lazy var inputTextField: UITextField = {
        UITextField()
            .then {
                $0.backgroundColor = .clear
                $0.autocapitalizationType = .none
                $0.autocorrectionType = .no
                $0.font = .systemFont(ofSize: 15.scale(.iPhone_6s))
                $0.clearButtonMode = .whileEditing
                $0.borderStyle = .bezel
            }
            .then {
                contentView.addSubview($0)
                $0.snp.makeConstraints {
                    $0.top.equalTo(titleLabel.snp.bottom).offset(3.scale(.iPhone_6s))
                    $0.left.right.equalTo(titleLabel)
                }
            }
    }()
    
    lazy var tipsLabel: UILabel = {
        UILabel()
            .then {
                $0.backgroundColor = .clear
                $0.numberOfLines = 0
                $0.textAlignment = .left
                $0.textColor = .red
                $0.font = .systemFont(ofSize: 13.scale(.iPhone_6s))
                $0.isHidden = true
            }
            .then {
                contentView.addSubview($0)
                $0.snp.makeConstraints {
                    $0.top.equalTo(inputTextField.snp.bottom).offset(3.scale(.iPhone_6s))
                    $0.left.right.equalTo(inputTextField)
                }
            }
    }()
}

extension LoginCell: CellViewModelOwner {
    
    func setContent(with viewModel: any LoginCellViewModel) {
        titleLabel.text = viewModel.title
        inputTextField.placeholder = viewModel.placeholder
        tipsLabel.text = viewModel.tips
    }
}
