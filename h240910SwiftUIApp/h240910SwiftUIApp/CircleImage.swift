//
//  CircleImage.swift
//  h240910SwiftUIApp
//
//  Created by hwacdx on 2024/9/12.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle()) //将图片裁剪为圆形
            .overlay {
                Circle().stroke(.white, lineWidth: 6) //设置圆形描边
            }.shadow(radius: 7) //添加阴影
    }
}

#Preview {
    CircleImage()
}
