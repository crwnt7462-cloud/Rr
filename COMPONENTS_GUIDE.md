# Guide des Composants - Moona Onboarding

Ce document détaille tous les composants visuels de l'écran d'onboarding.

## 📐 Structure Complète de l'Écran

```
┌─────────────────────────────────────┐
│  🌙 Moona                    (Header) │ ← 60pt du haut
├─────────────────────────────────────┤
│                                     │
│              60pt spacing           │
│                                     │
│          [Illustration]             │ ← 280×280pt
│       Panier + Linge Bleu          │
│           + Étoile ✨              │
│                                     │
│              50pt spacing           │
│                                     │
│   "Suivez votre cycle              │
│    naturellement"                   │ ← 26pt semibold
│                                     │
│   "Prenez soin de vous,            │
│    simplement"                      │
│                                     │
│         [Spacer flexible]           │
│                                     │
│  ┌─────────────────────────────┐   │
│  │      Commencer              │   │ ← Bouton primaire
│  └─────────────────────────────┘   │   56pt height
│              12pt spacing           │
│  ┌─────────────────────────────┐   │
│  │  J'ai déjà un compte        │   │ ← Bouton secondaire
│  └─────────────────────────────┘   │   56pt height
│                                     │
│              24pt spacing           │
│                                     │
│  En continuant vous acceptez nos    │ ← Footer légal
│  Conditions d'utilisation           │   12pt regular
│  et notre Politique de              │   opacity 0.8
│  confidentialité                    │
│                                     │
│              40pt bottom            │ ← Home indicator space
└─────────────────────────────────────┘
```

## 🎨 Détail de l'Illustration Personnalisée

### Basket (Panier)
```
Forme: Courbe personnalisée en forme de bol
Couleur: #FAFAFA (blanc cassé)
Taille: 240×180pt
Texture: 8 lignes horizontales espacées de 12pt
Opacité lignes: 0.08
```

### Folded Items (Linge Plié)
```
4 RoundedRectangles empilés:

1. Item du bas:
   - Taille: 160×45pt
   - Couleur: #7CB8E8
   - Corner radius: 20
   - Offset: y: +20

2. Item du milieu:
   - Taille: 140×45pt
   - Couleur: #7CB8E8 (opacity 0.9)
   - Corner radius: 20
   - Offset: y: -10

3. Item du haut:
   - Taille: 150×45pt
   - Couleur: #7CB8E8 (opacity 0.95)
   - Corner radius: 20
   - Offset: x: +15, y: -40

4. Item qui dépasse (gauche):
   - Taille: 50×35pt
   - Couleur: #7CB8E8 (opacity 0.85)
   - Corner radius: 15
   - Offset: x: -85, y: +5
   - Rotation: -15°
```

### Sparkle (Étoile)
```
Forme: Losange à 4 branches
Couleur: Blanc
Taille: 32×32pt
Position: x: +110, y: -70 (haut droite)
Glow: Shadow blanc opacity 0.8, radius 4
```

### Ombre de l'ensemble
```
Color: Noir
Opacity: 0.1
Blur radius: 40
Offset Y: 20
```

## 🎭 Animations

### 1. Illustration - Animation d'Apparition
```swift
.onAppear {
    withAnimation(.easeOut(duration: 0.8)) {
        scale: 0.85 → 1.0
        opacity: 0 → 1.0
    }
}
```

### 2. Boutons - Animation de Press
```swift
.simultaneousGesture(
    DragGesture(minimumDistance: 0)
        .onChanged { _ in scale = 0.95 }
        .onEnded { _ in scale = 1.0 }
)
```

Durée: 0.1s
Easing: easeInOut

## 🎨 Palette Complète avec Codes RGB

| Nom Variable | Hex | RGB | Usage |
|--------------|-----|-----|-------|
| `moonaBlue` | #0066FF | 0, 102, 255 | Gradient top |
| `moonaLightBlue` | #E8F4FF | 232, 244, 255 | Gradient bottom |
| `moonaPastelBlue` | #7CB8E8 | 124, 184, 232 | Linge plié |
| `moonaOffWhite` | #FAFAFA | 250, 250, 250 | Panier |
| `moonaBlack` | #1C1C1E | 28, 28, 30 | Texte + Bouton primaire |
| `moonaGray` | #8E8E93 | 142, 142, 147 | Texte légal |
| `moonaLightGray` | #F5F5F5 | 245, 245, 245 | Bouton secondaire BG |
| `moonaDarkGray` | #3C3C43 | 60, 60, 67 | Bouton secondaire texte |

## 📝 Typographie

### Header
```
Font: SF Pro Display
Weight: Medium
Size: 20px
Color: White
```

### Texte Principal
```
Font: SF Pro Display
Weight: Semibold
Size: 26px
Color: moonaBlack (#1C1C1E)
Line Spacing: 4pt
Alignment: Center
```

### Bouton Primaire
```
Font: SF Pro Display
Weight: Semibold
Size: 18px
Color: White
Background: moonaBlack
```

### Bouton Secondaire
```
Font: SF Pro Display
Weight: Regular
Size: 18px
Color: moonaDarkGray
Background: moonaLightGray
```

### Footer Légal
```
Font: SF Pro Text
Weight: Regular
Size: 12px
Color: moonaGray
Opacity: 0.8
Line Spacing: 4pt
```

## 🔧 Propriétés de Boutons

### Dimensions
```
Width: maxWidth .infinity (pleine largeur - 48pt padding)
Height: 56pt
Corner Radius: 28pt (fully rounded)
Horizontal Padding: 24pt (du container parent)
```

### Touch Area
```
Minimum: 56×56pt ✅ (respecte les 44pt minimum iOS)
```

### States
```
Normal: scale = 1.0
Pressed: scale = 0.95
Animation: 0.1s easeInOut
```

## 📱 Safe Area & Spacing

### Top
```
Status Bar: Système iOS (9:41, signal, etc.)
Logo Padding Top: 60pt (inclut safe area)
```

### Bottom
```
Footer Padding Bottom: 40pt
(Espace pour home indicator + confort visuel)
```

### Horizontal
```
Texte principal: 40pt
Boutons: 24pt
Footer: Automatique (centré)
```

## 🎯 Points Clés iOS HIG

✅ **Contraste**
- Blanc sur bleu: 4.5:1+ ✓
- Noir sur bleu clair: 14:1+ ✓
- Blanc sur noir (bouton): 21:1 ✓

✅ **Touch Targets**
- Boutons: 56pt height (> 44pt minimum)

✅ **Animations**
- Durée: 0.8s max (fluide)
- Easing: Natural (easeOut, easeInOut)

✅ **Safe Area**
- Respects notch
- Respects home indicator

✅ **Typography**
- SF Pro (système iOS)
- Tailles appropriées (12-26pt)

## 📦 Composants Réutilisables

### HeaderView
```swift
struct HeaderView: View
- Logo + Emoji
- Utilisable ailleurs dans l'app
```

### BasketIllustration
```swift
struct BasketIllustration: View
- Illustration complète
- Animation intégrée
```

### PrimaryButton
```swift
struct PrimaryButton: View
- Style noir principal
- Animation press
- Action customizable
```

### SecondaryButton
```swift
struct SecondaryButton: View
- Style gris secondaire
- Animation press
- Action customizable
```

### MainTextView
```swift
struct MainTextView: View
- Texte principal formaté
- 2 lignes centrées
```

### LegalFooterView
```swift
struct LegalFooterView: View
- Texte légal formaté
- 2 lignes centrées
```

## 🚀 Utilisation des Composants

### Exemple: Réutiliser le PrimaryButton ailleurs

```swift
struct AnotherView: View {
    @State private var isPressed = false
    
    var body: some View {
        PrimaryButton(
            title: "Mon Action",
            isPressed: $isPressed,
            action: {
                // Votre logique
                print("Action!")
            }
        )
        .padding(.horizontal, 24)
    }
}
```

### Exemple: Customiser l'illustration

```swift
// Dans BasketIllustration.swift
// Modifiez les couleurs:
.fill(Color.moonaPastelBlue) → .fill(Color.purple)

// Modifiez les tailles:
.frame(width: 160, height: 45) → .frame(width: 180, height: 50)
```

## 📸 Captures d'Écran Recommandées

Pour la documentation:
1. Vue complète iPhone 15 Pro
2. Vue complète iPhone SE (petit écran)
3. Gros plan de l'illustration
4. Animation des boutons (GIF)
5. Dark mode (si implémenté)

## 🎨 Variations Possibles

### Dark Mode
```swift
// Ajouter dans ColorPalette.swift
@Environment(\.colorScheme) var colorScheme

// Adapter les couleurs:
static var moonaBackground: Color {
    Color(UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark 
            ? UIColor(red: 0.1, green: 0.1, blue: 0.12, alpha: 1)
            : UIColor.white
    })
}
```

### Localisation
```swift
// Externaliser les strings:
Text("onboarding.title.line1")
Text("onboarding.button.start")

// Créer Localizable.strings (fr)
"onboarding.title.line1" = "Suivez votre cycle naturellement";
"onboarding.button.start" = "Commencer";
```

---

**Note**: Ce guide est un complément au code source. Référez-vous toujours aux fichiers Swift pour l'implémentation exacte.
