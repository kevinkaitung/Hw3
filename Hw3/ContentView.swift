//
//  ContentView.swift
//  Hw3
//
//  Created by User11 on 2020/11/1.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSecondPage = false
    @State public var bdate = Date()
    @State public var YN =  0
    @State private var name: String = ""
    @State private var textColor = Color.black
    @State private var chance: CGFloat = 18
    @State private var showingSheet = false
    @State private var showAlert = false
    var yesno = ["Yes","No"]
    var body: some View {
        VStack{
            Text("Birthday gitf").labelStyle(/*@START_MENU_TOKEN@*/DefaultLabelStyle()/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(textColor)
            Image("images").resizable().scaledToFit()
            DisclosureGroup(
                content:{
                    DatePicker("你的生日日期:",selection: $bdate, displayedComponents: .date).datePickerStyle(WheelDatePickerStyle())
                        .foregroundColor(textColor)
                    },
                label:{
                    Label("你的生日日期:", systemImage: "sun.max.fill").foregroundColor(textColor)
                    Text(bdate,style: .date).foregroundColor(textColor)
                    }
                )
            Text("覺得會拿到禮物嗎").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(textColor)
            VStack{
                Picker(selection: $YN, label: Text("YES/NO")) {
                    Text(yesno[0]).tag(0)
                    Text(yesno[1]).tag(1)
                }.pickerStyle(SegmentedPickerStyle())
            }
            TextField("想要什麼禮物",text: $name).foregroundColor(textColor)
            Text("你覺得拿到的機會:\(Int(chance)) ％")
            Slider(value: $chance, in: 0...100, step: 1)
            
            ColorPicker("Set the text color",selection: $textColor).foregroundColor(textColor)
            
            
            Button(action: {
                    showAlert = true
                 }) {
                       Text("結果").foregroundColor(textColor)
                 }.alert(isPresented: $showAlert) { () -> Alert in
                    let answer = ["1","2","10"].randomElement()!
                    return Alert(title:  Text( "你想要" + name),message: Text("你爸送了" + answer + "隻吉娃娃" ))
                 }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
