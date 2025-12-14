//
//  OnboardingView.swift
//  Moona
//
//  Created on 12/14/2025
//

import SwiftUI

struct OnboardingView: View {
    @State private var isPrimaryButtonPressed = false
    @State private var isSecondaryButtonPressed = false
    
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                colors: [Color.moonaBlue, Color.moonaLightBlue],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header with logo
                HeaderView()
                    .padding(.top, 60)
                
                Spacer()
                    .frame(height: 60)
                
                // Central illustration
                BasketIllustration()
                
                Spacer()
                    .frame(height: 50)
                
                // Main text
                MainTextView()
                    .padding(.horizontal, 40)
                
                Spacer()
                
                // Action buttons
                VStack(spacing: 12) {
                    PrimaryButton(
                        title: "Commencer",
                        isPressed: $isPrimaryButtonPressed,
                        action: {
                            // Action for starting
                            print("Commencer tapped")
                        }
                    )
                    
                    SecondaryButton(
                        title: "J'ai déjà un compte",
                        isPressed: $isSecondaryButtonPressed,
                        action: {
                            // Action for login
                            print("Login tapped")
                        }
                    )
                }
                .padding(.horizontal, 24)
                
                Spacer()
                    .frame(height: 24)
                
                // Legal footer
                LegalFooterView()
                    .padding(.bottom, 40)
            }
        }
    }
}

// MARK: - Header View
struct HeaderView: View {
    var body: some View {
        HStack(spacing: 6) {
            Text("🌙")
                .font(.system(size: 24))
            
            Text("Moona")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

// MARK: - Main Text View
struct MainTextView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Suivez votre cycle naturellement")
                .font(.system(size: 26, weight: .semibold, design: .default))
                .foregroundColor(Color.moonaBlack)
                .multilineTextAlignment(.center)
            
            Text("Prenez soin de vous, simplement")
                .font(.system(size: 26, weight: .semibold, design: .default))
                .foregroundColor(Color.moonaBlack)
                .multilineTextAlignment(.center)
        }
        .lineSpacing(4)
    }
}

// MARK: - Primary Button
struct PrimaryButton: View {
    let title: String
    @Binding var isPressed: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.system(size: 18, weight: .semibold, design: .default))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.moonaBlack)
                .cornerRadius(28)
        }
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    isPressed = true
                }
                .onEnded { _ in
                    isPressed = false
                }
        )
    }
}

// MARK: - Secondary Button
struct SecondaryButton: View {
    let title: String
    @Binding var isPressed: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.system(size: 18, weight: .regular, design: .default))
                .foregroundColor(Color.moonaDarkGray)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.moonaLightGray)
                .cornerRadius(28)
        }
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    isPressed = true
                }
                .onEnded { _ in
                    isPressed = false
                }
        )
    }
}

// MARK: - Legal Footer
struct LegalFooterView: View {
    var body: some View {
        VStack(spacing: 4) {
            Text("En continuant vous acceptez nos Conditions d'utilisation")
                .font(.system(size: 12, weight: .regular, design: .default))
                .foregroundColor(Color.moonaGray)
                .opacity(0.8)
            
            Text("et notre Politique de confidentialité")
                .font(.system(size: 12, weight: .regular, design: .default))
                .foregroundColor(Color.moonaGray)
                .opacity(0.8)
        }
        .multilineTextAlignment(.center)
    }
}

// MARK: - Preview
#Preview {
    OnboardingView()
}
