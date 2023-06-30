//
//  codeStudyUI.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/17.
//

import SwiftUI

struct codeStudyUI: View {
    // 게시자의 타입을 가진 데이터로 생성된 데이터를 구독, 구독함으로써 이 데이터의 변화를 알 수 있음
    // 이 데이터는 이 뷰뿐문아니라 다른 뷰에서도 사용 가능해지는 데이터가 됨.
    @ObservedObject var testData = TestData()
    // @ObservedObject var testData: TestData -> 프리뷰, contentview에 매개변수로 testData: TestData()로 전달해주어야함
    
    var body: some View {
        Text("testData 카운트 횟수 : \(testData.count)")

        Button(action: {
            // @옵저블 이기 때문에 @퍼블리시 인 함수 사용 가능
            testData.update()
        }, label: { // 버튼의 레이블
            Text("Add Count")
        })
    }
}

struct codeStudyUI_Previews: PreviewProvider {
    static var previews: some View {
        codeStudyUI()
        // 매개변수로 게시자의 인스턴스 자체를 넣어주는 것
        
        // 즉 게시자가 게시한 데이터 타임의 count라는 함수를 observedObjected가 계속 지켜보면서 변화를 캐치하고 그 변화를 적용하는 것
    }
}
