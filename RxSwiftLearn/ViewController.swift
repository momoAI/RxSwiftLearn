//
//  ViewController.swift
//  RxSwiftLearn
//
//  Created by luxu on 2022/9/8.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ViewModel()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let fun = test(param: 1)
//        let fun2 = fun(2.0)
//        let result = fun2 { value, tag in
//            print(value, tag)
//        }
        
//        let fun = test(param: 1)(2.0)({ value , tag in
//            print(value, tag)
//        })
        
//        3.0.bind(to: test(param: 1), argum: {_,_ in
//
//        })
//        3.0.bind(to: test(param: 1)) {_,_ in
//
//        }
        
        
//        viewModel.data.bind(to: tableView.rx.items(cellIdentifier: "cell"), curriedArgument: {_,_,_ in
//
//        })
        
        viewModel.data.bind(to: tableView.rx.items(cellIdentifier: "cell")) {row, ele, cell in
            cell.textLabel?.text = "\(row)" + ele.title
            cell.detailTextLabel?.text = ele.detail
        }.disposed(by: bag)
        
        tableView.rx.itemSelected.subscribe { index in
            print(index.element?.row ?? 0)
        }.disposed(by: bag)
        tableView.rx.itemSelected.subscribe { index in
            print(index.row)
        }.disposed(by: bag)
        tableView.rx.modelSelected(Model.self).subscribe(onNext: { model in
            print("selected \(model.title)")
        }).disposed(by: bag)

    }

    
    
    func test<T: UITableViewCell>(param: Int, cellType: T.Type = T.self)
    -> (_ one: Double)
    -> (_ configureCell: @escaping (Int, String) -> Void)
    -> Bool {
        return {value in
            return {configureCell in
                configureCell(Int(2 + value) * param, "cell")
                return false
            }
        }
    }
    
}

extension Double {
    func bind<R1, R2>(to binder: (Self) -> (R1) -> R2, argum: R1) -> R2 {
        binder(self)(argum)
    }
}
