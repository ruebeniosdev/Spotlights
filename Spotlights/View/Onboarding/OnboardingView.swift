//
//  OnboardingView.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("log_status") var logStatus = false
    @State  var showWelcomeView: Bool  = false
    @State var onboardingItems: [OnboardingItem] = [
.init(imageUrl: "onboard1", title: "Stand out from\nthe crowd", subTitle: "Try our special spotlight feature and\ndrive more engagements across your social media pages."),
.init(imageUrl: "onboard2", title: "Become\nan influencer", subTitle: "Support project Nhyira and the core team of Nhyira Foundation to receive awesome perks"),
.init(imageUrl: "onboard3", title: "Connect with\nfollowers", subTitle: "Grab Gifters, connect with friends and celebrate milestones with your fanbase.")
    ]
  //  @Binding  var showSignInView: Bool
    @State private var index = 0
    @AppStorage("onboarding_completed") var onboardingCompleted = false
   // @Binding  var showSignInView: Bool
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            HStack(spacing: 0) {
                ForEach($onboardingItems) { $item in
                    let islastSlide = (index == onboardingItems.count - 1)
                    VStack {
                        HStack {
                            Button {
                            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)) {
                                if index > 0 {
                                        index -= 1
                                    }
                                }
                            } label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("accent"))
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(Circle())
                            }
                            .opacity(index > 0 ? 1 : 0)
                            .padding(.horizontal)
                            Spacer()
                            Button("Skip") {
                                withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)) {
                                    index = onboardingItems.count - 1
                                }
                            }
                            .opacity(islastSlide ? 0 : 1)
                            .padding()
                            .animation(.easeInOut, value: index)
                            .foregroundColor(Color("accent"))
                        }
                        VStack(spacing: 15) {
                            let offset = -CGFloat(index) * size.width
                            TabView(selection: $index) {
                                ForEach(0..<3) { onboard in
                                    Image("onboard\(onboard)")
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                        .frame(width: 324, height: 323)
                                        .opacity(onboard == index ? 1 : 0)
                                        .offset(CGSize(width: 0, height: onboard == index ? 0 : 100))
                                        .animation(.easeInOut(duration: 0.6), value: onboard == index)
                                }
                            }
                            .frame(height: size.width)
                            .tabViewStyle(.page(indexDisplayMode: .never))
                            
                            ViewThatFits {
                                VStack(spacing: 8) {
                                    Text(item.title)
                                        .font(.custom("Poppins-Bold",size: 30))
                                        .multilineTextAlignment(.center)
                                        .offset(x: offset)
                                        .animation(.easeInOut(duration: 0.5), value: index)
                                    
                                    Text(item.subTitle)
                                        .font(.custom("Poppins-Medium",size: 18))
                                        .multilineTextAlignment(.center)  .padding(.horizontal,15)
                                        .foregroundColor(Color("offwhite"))
                                        .offset(x: offset)
                                        .animation(.easeInOut(duration: 0.5).delay(0.2), value: index)
                                }
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        Spacer(minLength: 0)
                        HStack {
                            HStack(spacing: 4) {
                                ForEach(0..<3) { onboardSlide in
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(onboardSlide == index ? Color("accent") : Color("accent").opacity(0.15))
                                        .frame(width: onboardSlide == index ? 32 : 8, height: 8)
                                        .animation(.easeInOut(duration: 0.5), value: onboardSlide == index)
                                }
                            }
                            Spacer()
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .frame(width: 18.41, height: 15.41)
                                    .foregroundColor(Color("accent"))
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)) {
                                            if index < onboardingItems.count - 1 {
                                                index += 1
                                            }
                                        }
                                        if islastSlide {
                                    withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)) {
                                                showWelcomeView = true
                                                onboardingCompleted = true
                                            }

                                        }
                                    }
                                    .animation(.easeInOut, value: islastSlide)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 41)
                        .frame(width: 335, height: 48)
                    }
                    .frame(width: size.width, height: size.height)
                    .background(Color("bg"))
                }
            }
            .frame(width: size.width * CGFloat(onboardingItems.count), alignment: .leading)
        }
        .overlay (
            Group {
                if showWelcomeView && onboardingCompleted {
                    SignIn()
                        .transition(.opacity)
                }
            }
        )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
