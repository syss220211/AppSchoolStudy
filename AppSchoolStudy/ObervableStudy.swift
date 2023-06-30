//
//  ObervableStudy.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/17.
//

import Foundation
import Combine

// observableObject를 상속한 데이터 생성
class TestData : ObservableObject {
    
    // 옵저블로 사용하기 위해서 @published 래퍼 선언
    @Published var count = 0

    // 옵저블 프로퍼티의 값을 변화시킬 수 있는 함수
    func update(){
        count += 1
    }
}
