# Moona - iOS Onboarding Screen

Une page d'accueil moderne et épurée pour l'application iOS **Moona**, une app de suivi des règles menstruelles.

## 🌙 Aperçu

Cette interface d'onboarding présente un design minimaliste et chaleureux avec :
- Un dégradé bleu apaisant (bleu roi → bleu ciel)
- Une illustration personnalisée représentant des serviettes pliées dans un panier
- Des animations fluides et naturelles
- Une interface conforme aux guidelines Apple Human Interface

## 📱 Spécifications Techniques

### Plateforme
- **Framework**: SwiftUI
- **iOS Version**: 15.0+
- **Devices**: iPhone (optimisé pour iPhone 14/15)
- **Orientation**: Portrait uniquement

### Architecture des Fichiers

```
Moona/
├── MoonaApp.swift              # Point d'entrée de l'application
├── OnboardingView.swift        # Vue principale d'onboarding
├── BasketIllustration.swift    # Illustration personnalisée
├── ColorPalette.swift          # Palette de couleurs
├── Info.plist                  # Configuration iOS
└── Project.swift               # Documentation projet
```

## 🎨 Palette de Couleurs

| Couleur | Hex | Usage |
|---------|-----|-------|
| Bleu principal | `#0066FF` | Haut du dégradé |
| Bleu clair | `#E8F4FF` | Bas du dégradé |
| Bleu pastel | `#7CB8E8` | Illustration |
| Blanc cassé | `#FAFAFA` | Panier |
| Noir | `#1C1C1E` | Texte principal, bouton primaire |
| Gris moyen | `#8E8E93` | Texte légal |
| Gris clair | `#F5F5F5` | Bouton secondaire |

## 🚀 Installation et Utilisation

### Option 1: Créer un nouveau projet Xcode

1. **Ouvrir Xcode** et créer un nouveau projet:
   - File → New → Project
   - Sélectionner "iOS" → "App"
   - Product Name: `Moona`
   - Interface: **SwiftUI**
   - Language: **Swift**

2. **Remplacer/Ajouter les fichiers**:
   - Remplacer le fichier App généré par `MoonaApp.swift`
   - Ajouter tous les autres fichiers Swift au projet
   - Mettre à jour `Info.plist` avec notre configuration

3. **Configurer le projet**:
   - Deployment Target: iOS 15.0 ou supérieur
   - Supported Interface Orientations: Portrait uniquement
   - Status Bar Style: Light Content

4. **Build & Run** (⌘R)

### Option 2: Intégrer dans un projet existant

Si vous avez déjà une app:

1. Copier les fichiers `ColorPalette.swift`, `BasketIllustration.swift` et `OnboardingView.swift`
2. Ajouter ces fichiers à votre projet Xcode
3. Afficher `OnboardingView()` depuis votre navigation

```swift
NavigationView {
    OnboardingView()
}
```

## ✨ Fonctionnalités

### Animations Implémentées

- **Illustration**: Animation d'apparition avec scale (0.85 → 1.0) et fade-in (durée 0.8s)
- **Boutons**: Effet de press avec scale (0.95) au toucher
- **Transitions**: Animations fluides avec easing naturel

### Composants UI

#### Header
- Logo "🌙 Moona" centré
- Police: SF Pro Display Medium, 20px, blanc

#### Illustration
- Panier personnalisé avec texture
- 4 formes bleues empilées (effet linge plié)
- Étoile brillante en haut à droite
- Ombres douces pour la profondeur

#### Texte Principal
- "Suivez votre cycle naturellement"
- "Prenez soin de vous, simplement"
- Police: SF Pro Display Semibold, 26px

#### Boutons
- **Primaire**: "Commencer" (blanc sur fond noir)
- **Secondaire**: "J'ai déjà un compte" (gris sur fond gris clair)
- Hauteur: 56pt, Rayon: 28pt (fully rounded)

#### Footer Légal
- Texte de conditions d'utilisation
- Police: SF Pro Text Regular, 12px
- Opacité: 0.8

## 🎯 Conformité iOS Human Interface Guidelines

Cette interface respecte:
- ✅ Safe Area (notch et home indicator)
- ✅ Tailles de police dynamiques (via SF Pro)
- ✅ Espacement cohérent (multiples de 4/8)
- ✅ Contraste de couleurs suffisant
- ✅ Zones de toucher minimales (44pt pour les boutons)
- ✅ Animations naturelles (easing approprié)
- ✅ Status bar visible et stylé

## 🔧 Personnalisation

### Modifier les Couleurs

Éditez `ColorPalette.swift` pour changer les couleurs:

```swift
extension Color {
    static let moonaBlue = Color(red: 0/255, green: 102/255, blue: 255/255)
    // Modifiez les valeurs RGB ici
}
```

### Modifier le Texte

Éditez `OnboardingView.swift` dans la section `MainTextView`:

```swift
Text("Votre nouveau texte ici")
    .font(.system(size: 26, weight: .semibold))
```

### Ajouter des Actions aux Boutons

Dans `OnboardingView.swift`, modifiez les closures `action`:

```swift
PrimaryButton(
    title: "Commencer",
    isPressed: $isPrimaryButtonPressed,
    action: {
        // Votre code ici - navigation, etc.
    }
)
```

## 📐 Dimensions et Spacing

- **Illustration**: 280 × 280pt
- **Boutons**: Full width - 48pt horizontal padding, 56pt height
- **Spacing vertical**: 
  - Header → Illustration: 60pt
  - Illustration → Texte: 50pt
  - Texte → Boutons: Spacer flexible
  - Boutons entre eux: 12pt
  - Footer bottom: 40pt

## 🐛 Debug & Tests

### Preview en Direct

Chaque vue possède un `#Preview` pour visualisation en temps réel dans Xcode:

```swift
#Preview {
    OnboardingView()
}
```

### Tests Recommandés

- [ ] Apparence sur iPhone 14, 14 Pro, 15, 15 Pro Max
- [ ] Rotation (devrait rester portrait)
- [ ] Dark mode (si implémenté)
- [ ] Tailles de police dynamiques (Accessibilité)
- [ ] VoiceOver (accessibilité)

## 📝 Notes de Développement

- Aucune dépendance externe requise
- SwiftUI pur (iOS 15+)
- Support du mode sombre peut être ajouté
- Prêt pour la localisation (textes externalisables)
- Code modulaire et réutilisable

## 🎨 Design System

Cette onboarding peut servir de base pour un design system Moona:
- Composants réutilisables (PrimaryButton, SecondaryButton)
- Palette de couleurs centralisée
- Espacement cohérent
- Typographie standardisée

## 📄 Licence

Ce code est fourni comme exemple d'implémentation. Adaptez-le selon vos besoins.
