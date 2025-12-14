//
//  BasketIllustration.swift
//  Moona
//
//  Created on 12/14/2025
//

import SwiftUI

struct BasketIllustration: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Main basket container
            BasketShape()
                .fill(Color.moonaOffWhite)
                .frame(width: 240, height: 180)
                .overlay(
                    BasketShape()
                        .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                )
                .overlay(
                    // Horizontal lines for texture
                    VStack(spacing: 12) {
                        ForEach(0..<8) { index in
                            Rectangle()
                                .fill(Color.gray.opacity(0.08))
                                .frame(height: 1)
                                .padding(.horizontal, 20)
                        }
                    }
                    .padding(.top, 40)
                )
            
            // Folded items inside basket
            ZStack {
                // Bottom folded item
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.moonaPastelBlue)
                    .frame(width: 160, height: 45)
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                    .offset(y: 20)
                
                // Middle folded item
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.moonaPastelBlue.opacity(0.9))
                    .frame(width: 140, height: 45)
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                    .offset(y: -10)
                
                // Top folded item
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.moonaPastelBlue.opacity(0.95))
                    .frame(width: 150, height: 45)
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                    .offset(x: 15, y: -40)
                
                // One item slightly sticking out
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.moonaPastelBlue.opacity(0.85))
                    .frame(width: 50, height: 35)
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                    .offset(x: -85, y: 5)
                    .rotationEffect(.degrees(-15))
            }
            .offset(y: -10)
            
            // Sparkle star in top right
            SparkleShape()
                .fill(Color.white)
                .frame(width: 32, height: 32)
                .shadow(color: Color.white.opacity(0.8), radius: 4, x: 0, y: 0)
                .offset(x: 110, y: -70)
        }
        .frame(width: 280, height: 280)
        .shadow(color: Color.black.opacity(0.1), radius: 40, x: 0, y: 20)
        .scaleEffect(isAnimating ? 1.0 : 0.85)
        .opacity(isAnimating ? 1.0 : 0)
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) {
                isAnimating = true
            }
        }
    }
}

// Custom basket shape (bowl-like)
struct BasketShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        // Start from top left
        path.move(to: CGPoint(x: width * 0.15, y: height * 0.2))
        
        // Top left curve
        path.addQuadCurve(
            to: CGPoint(x: width * 0.5, y: height * 0.15),
            control: CGPoint(x: width * 0.25, y: height * 0.1)
        )
        
        // Top right curve
        path.addQuadCurve(
            to: CGPoint(x: width * 0.85, y: height * 0.2),
            control: CGPoint(x: width * 0.75, y: height * 0.1)
        )
        
        // Right side curve down
        path.addQuadCurve(
            to: CGPoint(x: width * 0.7, y: height * 0.85),
            control: CGPoint(x: width * 0.95, y: height * 0.5)
        )
        
        // Bottom curve
        path.addQuadCurve(
            to: CGPoint(x: width * 0.3, y: height * 0.85),
            control: CGPoint(x: width * 0.5, y: height * 0.95)
        )
        
        // Left side curve up
        path.addQuadCurve(
            to: CGPoint(x: width * 0.15, y: height * 0.2),
            control: CGPoint(x: width * 0.05, y: height * 0.5)
        )
        
        path.closeSubpath()
        
        return path
    }
}

// Custom sparkle/star shape (4-point diamond star)
struct SparkleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let centerX = width / 2
        let centerY = height / 2
        
        // Top point
        path.move(to: CGPoint(x: centerX, y: 0))
        
        // Top right curve
        path.addQuadCurve(
            to: CGPoint(x: width, y: centerY),
            control: CGPoint(x: centerX + width * 0.15, y: centerY - height * 0.15)
        )
        
        // Bottom right curve
        path.addQuadCurve(
            to: CGPoint(x: centerX, y: height),
            control: CGPoint(x: centerX + width * 0.15, y: centerY + height * 0.15)
        )
        
        // Bottom left curve
        path.addQuadCurve(
            to: CGPoint(x: 0, y: centerY),
            control: CGPoint(x: centerX - width * 0.15, y: centerY + height * 0.15)
        )
        
        // Top left curve
        path.addQuadCurve(
            to: CGPoint(x: centerX, y: 0),
            control: CGPoint(x: centerX - width * 0.15, y: centerY - height * 0.15)
        )
        
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    ZStack {
        LinearGradient(
            colors: [Color.moonaBlue, Color.moonaLightBlue],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
        
        BasketIllustration()
    }
}
