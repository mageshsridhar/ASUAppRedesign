//
//  ContentView.swift
//  ASUappRedesign
//
//  Created by Magesh Sridhar on 11/9/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            NavView()
            ScrollView(.vertical,showsIndicators:false){
                VStack(){
            CardsView()
            ResourcesView()
            EventsView().padding(.top,130)
            NewsView().padding(.top,230)
            Spacer(minLength: 90)
                }
                
            }
        }
    }
}
func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
struct NavView:View{
    var body: some View{
    HStack{
        Image(systemName: "ellipsis").font(.title)
        Spacer()
        Image("Logo").resizable().scaledToFit().frame(height:80)
        Spacer()
        Image(systemName: "bell").font(.title)
    }.padding(.horizontal,26)
    }
}
struct CardsView: View{
    var body: some View{
        ScrollView(.horizontal, showsIndicators:false){
            HStack(spacing:10){
                MonthlyCheckCardView().padding(.leading,10)
                WeatherCardView()
                CareerCardView()
                EventCardView()
            }.padding(.horizontal)
        }
    }
}
struct MonthlyCheckCardView: View{
    let topgold = hexStringToUIColor(hex: "#ffd42a")
    let bottomgold = hexStringToUIColor(hex: "#e6b223")
    var body: some View{
        ZStack(){
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(topgold), Color(bottomgold)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(25)
                .frame(width: 320,height:400)
                .shadow(color: Color(bottomgold).opacity(0.5),radius:15,x:0,y:25 )
                .padding(.bottom,35)
            VStack(){
                HStack(alignment:.top){
                Text("Set your health check schedule 3 months in advance.").font(.system(size:28)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer(minLength: 40)
                    Image(systemName: "calendar").font(.system(size:50))
                }.padding(.top).padding(.horizontal,25).frame(width:320)
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 100).frame(height:60).shadow(color: Color.black.opacity(0.4),radius: 10,x:0,y:5 )
                    HStack{
                    Text("Health Check Submitted").foregroundColor(.white)
                        Image(systemName: "checkmark.circle").foregroundColor(.white)
                    }
                }.padding(.horizontal).padding(.bottom)
                ZStack{
                    RoundedRectangle(cornerRadius: 100).frame(height:60)
                    Text("Schedule").foregroundColor(.white).shadow(color: Color.black.opacity(0.4),radius: 10,x:0,y:5 )
                }.padding(.horizontal)
                Spacer()
            }.frame(height:400)
        }
    }
}
struct WeatherCardView: View{
    let topblue = hexStringToUIColor(hex: "#00aef0")
    let bottomblue = hexStringToUIColor(hex: "#0093ca")
    var body: some View{
        ZStack(){
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(topblue), Color(bottomblue)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(25)
                .frame(width: 320,height:400)
                .shadow(color: Color(bottomblue).opacity(0.3),radius:15,x:0,y:25)
                .padding(.bottom,35)
            VStack(){
                HStack(){
                VStack(alignment:.leading,spacing:3){
                Text("Tuesday, November 10")
                Text("Tempe, Arizona")
                Text("52º").font(.system(size:60,weight:.medium))
                    Image(systemName: "moon.stars.fill").font(.title).padding(.bottom,10)
                Text("Clear")
                Text("H:60º L:50º")
                }
                    Spacer()
                }.padding(25).frame(width:320)
                Spacer()
                Text("Good Evening").font(.title2)
                Spacer()
            }.frame(height:400).padding().foregroundColor(.white)
        }
    }
}
struct CareerCardView: View{
    let topblack = hexStringToUIColor(hex: "#1d1d1d")
    let bottomblack = hexStringToUIColor(hex: "#212121")
    let topgold = hexStringToUIColor(hex: "#ffd42a")
    let bottomgold = hexStringToUIColor(hex: "#e6b223")
    let backgroundGold = hexStringToUIColor(hex: "#7c5f0e")
    var body: some View{
        ZStack(){
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(topblack), Color(bottomblack)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(25)
                .frame(width: 320,height:400)
                .shadow(color: Color(bottomblack).opacity(0.5),radius:15,x:0,y:25 )
                .padding(.bottom,35)
            VStack()
            {
                HStack(){
                    Text("Are you Career Ready?").foregroundColor(.white).font(.system(size:30)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                }.padding(.top).padding(.horizontal,25)
                ZStack(){
                    Circle().stroke(Color(backgroundGold),lineWidth: 20)
                    Circle().trim(from: 0, to: 0.8).stroke(AngularGradient(gradient: Gradient(colors: [Color(topgold), Color(bottomgold)]), center: .center, startAngle: .degrees(0), endAngle: .degrees(358)),style: StrokeStyle(lineWidth: 20, lineCap: .round)).rotationEffect(.degrees(-90))
                    Text("80%").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(Color(topgold))
                }.frame(width:150,height: 150)
                VStack(){
                Text("You're currently on")
                    Text("Career Milestone 5").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(0.3)
                Text("Start Networking")
                }.padding().foregroundColor(.white)
                Spacer()
            }.frame(width:320,height:400)
            
        }
    }
}
struct EventCardView: View{
    let maroon = hexStringToUIColor(hex: "#8C1D40")
    let topmaroon = hexStringToUIColor(hex: "#961f44")
    let bottommaroon = hexStringToUIColor(hex: "#7e1a3a")
    var body: some View{
        ZStack(){
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(topmaroon), Color(bottommaroon)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(25)
                .frame(width: 320,height:400)
                .shadow(color: Color(bottommaroon).opacity(0.5),radius:15,x:0,y:25 )
                .padding(.bottom,35)
            VStack(alignment:.leading){
                Text("Featured News").font(.subheadline).padding(.bottom,10)
                Text("ASU Law students engage in dialogue with inventor of the Super Soaker").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                HStack(){
                    Spacer()
                    Image(systemName: "newspaper").font(.system(size:80))
                }
                Spacer()
            }.padding(25).foregroundColor(.white).frame(width:320,height: 400)
        }.padding()
    }
}
struct ResourcesView : View{
    let cardColor = hexStringToUIColor(hex: "#F2F2F2")
    let maroon = hexStringToUIColor(hex: "#8C1D40")
    let gold = hexStringToUIColor(hex: "#ffc627")
    let orange = hexStringToUIColor(hex: "#FF7F32")
    let blue = hexStringToUIColor(hex: "#00A3E0")
    let green = hexStringToUIColor(hex: "#78BE20")
    let grey = hexStringToUIColor(hex: "#5C6670")
    var body: some View{
        ZStack(){
            Rectangle().frame(height:420).cornerRadius(30).foregroundColor(Color(cardColor))
            VStack()
            {
                HStack(){
                    Text("Resources").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                }.padding(.horizontal,26).padding(.top,35)
                Spacer()
                VStack(spacing: 30){
                    HStack(spacing:40){
                        VStack(){
                        ZStack()
                        {
                            Rectangle().cornerRadius(15).frame(width:80,height:80)
                                .foregroundColor(Color(gold))
                            Image(systemName: "person.fill").font(.system(size:45)).foregroundColor(.white)
                        }
                            Text("My ASU").font(.subheadline)
                        }
                        VStack(){
                        ZStack()
                        {
                            Rectangle().cornerRadius(15).frame(width:80,height:80)
                                .foregroundColor(Color(maroon))
                            Image(systemName: "note.text").font(.system(size:45)).foregroundColor(.white)
                        }
                            Text("Canvas").font(.subheadline)
                        }
                        VStack(){
                        ZStack()
                        {
                            Rectangle().cornerRadius(15).frame(width:80,height:80)
                                .foregroundColor(Color(orange))
                            Image(systemName: "a.book.closed.fill").font(.system(size:45)).foregroundColor(.white)
                        }
                            Text("Library").font(.subheadline)
                        }
                    }
                    HStack(spacing:40){
                        VStack(){
                        ZStack()
                        {
                            Rectangle().cornerRadius(15).frame(width:80,height:80)
                                .foregroundColor(Color(blue))
                            Image(systemName: "envelope.fill").font(.system(size:45)).foregroundColor(.white)
                        }
                            Text("Email").font(.subheadline)
                        }.offset(x:7)
                        VStack(){
                        ZStack()
                        {
                            Rectangle().cornerRadius(15).frame(width:80,height:80)
                                .foregroundColor(Color(green))
                            Image(systemName: "calendar").font(.system(size:45)).foregroundColor(.white)
                        }
                            Text("Calendar").font(.subheadline)
                        }.offset(x:7)
                        VStack(){
                        ZStack()
                        {
                            Rectangle().cornerRadius(15).frame(width:80,height:80)
                                .foregroundColor(Color(grey))
                            Image(systemName: "person.3.fill").font(.system(size:30)).foregroundColor(.white)
                        }
                            Text("SunDevilSync").font(.subheadline)
                        }
                    }
                }.padding()
                Text("Edit Menu").padding().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).padding(.bottom)
            }
        }.padding(.horizontal).frame(height:400)
    }
}
struct EventsView : View{
    let cardColor = hexStringToUIColor(hex: "#F2F2F2")
    var body: some View{
        ZStack(){
            Rectangle().frame(height:620).cornerRadius(30).foregroundColor(Color(cardColor))
            VStack()
            {
                HStack(){
                    Text("Events").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.top)
                    Spacer()
                }
                VStack(alignment:.leading,spacing:10){
                Rectangle().frame(height:150).cornerRadius(10).foregroundColor(.gray)
                Text("Limited Audience: Doctoral Student Recital: Hongni Wu, Piano").font(.headline)
                Text("Tuesday Nov 10th, 7:30 PM MST - 9:30 PM MST").font(.caption)
                }
                Divider()
                HStack()
                {
                    VStack(alignment: .leading,spacing: 10)
                    {
                        Text("Limited Audience: Undergraduate Student Recital: Brooke Durborow, Soprano").font(.headline)
                        Text("Tuesday Nov 10th,\n7:30 PM MST - 9:30 PM MST").font(.caption)
                    }
                    Rectangle().frame(height:120).cornerRadius(10).foregroundColor(.gray)
                }
                Divider()
                HStack()
                {
                    VStack(alignment: .leading,spacing: 10)
                    {
                        Text("Sustainability Committee Meeting").font(.headline)
                        Text("Tuesday Nov 11th,\n12:00 PM MST - 1:00 PM MST").font(.caption)
                    }
                    Rectangle().frame(height:120).cornerRadius(10).foregroundColor(.gray)
                }
                Divider()
                Text("More Events").padding(.top,8).padding(.bottom).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
            }.padding()
        }.padding(.horizontal).frame(height:400)
    }
}
struct NewsView : View{
    let cardColor = hexStringToUIColor(hex: "#F2F2F2")
    var body: some View{
        ZStack(){
            Rectangle().frame(height:630).cornerRadius(30).foregroundColor(Color(cardColor))
            VStack()
            {
                HStack(){
                    Text("News").font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.top,25)
                    Spacer()
                }
                VStack(alignment:.leading, spacing: 10)
                {
                Rectangle().frame(height:150).cornerRadius(10).foregroundColor(.gray)
                Text("Discoveries").font(.caption)
                Text("New Study uses satellites and field studies to improve coral reef restoration").font(.headline)
                }
                Divider()
                HStack()
                {
                    VStack(alignment: .leading,spacing: 10)
                    {
                        Text("Athletics").font(.caption)
                        Text("Hockey featured in first two big ten network showdowns").font(.headline).frame(height: 80)
                        
                    }
                    Rectangle().frame(height:120).cornerRadius(10).foregroundColor(.gray)
                }
                Divider()
                HStack()
                {
                    VStack(alignment: .leading,spacing: 10)
                    {
                        Text("ASU News").font(.caption)
                        Text("ASU completes $50 million in recent facilities upgrades").font(.headline).frame(height: 80)
                        
                    }
                    Rectangle().frame(height:120).cornerRadius(10).foregroundColor(.gray)
                }
                Divider()
                Text("More News").padding(.top,8).padding(.bottom).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }.padding()
        }.padding(.horizontal).frame(height:400)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //NewsView()
    }
}
