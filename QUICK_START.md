# 🚀 Quick Start - Moona Onboarding

Guide rapide pour démarrer en 5 minutes.

## ⚡ Installation Express (Xcode)

### 1. Créer le Projet (2 min)

```bash
# Ouvrir Xcode
# File → New → Project
# iOS → App
```

**Configuration:**
- Product Name: `Moona`
- Team: Votre équipe
- Organization Identifier: `com.votrecompagnie`
- Interface: **SwiftUI** ⚠️
- Language: **Swift** ⚠️
- Storage: None
- Include Tests: Optional

### 2. Ajouter les Fichiers (2 min)

**Glisser-déposer dans Xcode (dans cet ordre):**

1. ✅ `ColorPalette.swift`
2. ✅ `BasketIllustration.swift`
3. ✅ `OnboardingView.swift`
4. ✅ `MoonaApp.swift` (remplace le fichier App existant)

**Cocher:** "Copy items if needed"

### 3. Configurer Info.plist (1 min)

Ouvrir `Info.plist` et ajouter/modifier:

```xml
<key>UISupportedInterfaceOrientations</key>
<array>
    <string>UIInterfaceOrientationPortrait</string>
</array>
```

Ou via l'interface Xcode:
- Target → Info
- Supported interface orientations: **Portrait** uniquement

## ▶️ Lancer l'App

1. Sélectionner un simulateur: **iPhone 15 Pro**
2. Appuyer sur **⌘R** (ou cliquer Run)
3. L'écran d'onboarding s'affiche ! 🎉

## 🎨 Preview en Direct (Recommandé)

Au lieu de lancer le simulateur, utilisez les Canvas Previews:

1. Ouvrir `OnboardingView.swift`
2. Cliquer sur **"Resume"** en haut du Canvas (à droite)
3. Preview interactive en temps réel ! ⚡

**Raccourci:** ⌥⌘P (Option+Cmd+P)

## ✏️ Personnalisation Rapide

### Changer le Texte

```swift
// OnboardingView.swift → MainTextView
Text("Votre nouveau message ici")
```

### Changer les Couleurs

```swift
// ColorPalette.swift
static let moonaBlue = Color(red: 0/255, green: 102/255, blue: 255/255)
// Changez les valeurs RGB ↑
```

### Ajouter une Action

```swift
// OnboardingView.swift → PrimaryButton
action: {
    print("Démarrage!")
    // Naviguer vers la prochaine vue:
    // navigationPath.append(NextView())
}
```

## 🐛 Troubleshooting

### "Cannot find type 'Color' in scope"
**Solution:** Vérifiez que `import SwiftUI` est en haut du fichier

### "No such module 'SwiftUI'"
**Solution:** 
1. Deployment Target doit être iOS 15.0+
2. Target → Build Settings → iOS Deployment Target

### Canvas ne s'affiche pas
**Solution:**
1. Editor → Canvas (⌥⌘↵)
2. Cliquer "Resume" si nécessaire
3. Product → Clean Build Folder (⇧⌘K)

### Illustration ne s'affiche pas
**Solution:** Vérifiez que `BasketIllustration.swift` est bien dans le target
- File Inspector → Target Membership → Cocher votre app

### Boutons ne répondent pas
**Solution:** Vérifiez que vous avez bien les `@State` bindings:
```swift
@State private var isPrimaryButtonPressed = false
```

## 📱 Tester sur Différents Appareils

### Simulateurs Recommandés
- ✅ iPhone 15 Pro (référence)
- ✅ iPhone 14 (référence)
- ✅ iPhone SE 3rd gen (petit écran)
- ✅ iPhone 15 Pro Max (grand écran)

**Raccourci:** ⌘⇧2 pour changer de simulateur

### Test sur Device Réel

1. Connecter votre iPhone
2. Sélectionner votre iPhone dans la liste
3. ⌘R
4. Accepter le profil de développement sur l'iPhone

## 🎯 Prochaines Étapes

### Navigation

Ajouter NavigationStack pour aller à la prochaine vue:

```swift
// Dans MoonaApp.swift
struct MoonaApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                OnboardingView()
            }
        }
    }
}

// Dans OnboardingView, ajouter:
@Environment(\.dismiss) var dismiss

PrimaryButton(
    title: "Commencer",
    action: {
        // Naviguer
        dismiss()
    }
)
```

### State Management

Gérer l'état d'onboarding:

```swift
// Créer un UserDefaults helper
extension UserDefaults {
    var hasCompletedOnboarding: Bool {
        get { bool(forKey: "hasCompletedOnboarding") }
        set { set(newValue, forKey: "hasCompletedOnboarding") }
    }
}

// Dans MoonaApp.swift
@AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding = false

var body: some Scene {
    WindowGroup {
        if hasCompletedOnboarding {
            MainAppView()
        } else {
            OnboardingView()
        }
    }
}
```

### Animations Avancées

Ajouter plus d'animations:

```swift
// Dans OnboardingView
@State private var textOpacity = 0.0

.opacity(textOpacity)
.onAppear {
    withAnimation(.easeIn(duration: 0.6).delay(0.4)) {
        textOpacity = 1.0
    }
}
```

## 📚 Ressources

- [README.md](./README.md) - Documentation complète
- [COMPONENTS_GUIDE.md](./COMPONENTS_GUIDE.md) - Guide des composants
- [Project.swift](./Project.swift) - Configuration projet

## 💡 Tips & Tricks

### Preview Multiple Devices

```swift
#Preview("iPhone 15 Pro") {
    OnboardingView()
}

#Preview("iPhone SE") {
    OnboardingView()
        .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
}
```

### Preview Dark Mode

```swift
#Preview("Dark Mode") {
    OnboardingView()
        .preferredColorScheme(.dark)
}
```

### Live Reload

Les changements dans le code sont automatiquement reflétés dans le Canvas Preview sans relancer l'app ! 🔥

### Keyboard Shortcuts Utiles

- **⌘R** - Run
- **⌘.** - Stop
- **⌥⌘P** - Toggle Canvas
- **⇧⌘K** - Clean Build
- **⌘B** - Build
- **⌘⇧2** - Device selector

## ✅ Checklist Avant Production

- [ ] Tester sur iPhone réel
- [ ] Vérifier les animations (60 FPS)
- [ ] Tester avec VoiceOver (accessibilité)
- [ ] Tester sur petit écran (iPhone SE)
- [ ] Tester sur grand écran (Pro Max)
- [ ] Implémenter les actions des boutons
- [ ] Ajouter analytics (optionnel)
- [ ] Tester en mode avion (ressources locales)
- [ ] Vérifier les liens légaux (CGU, politique)
- [ ] Ajouter localisations (EN, ES, etc.)

## 🎉 C'est Tout !

Vous avez maintenant une magnifique page d'onboarding pour Moona !

**Questions?** Consultez le [README.md](./README.md) pour plus de détails.

---

**Temps total:** ~5 minutes ⚡
**Difficulté:** Débutant ✅
**Dépendances:** Aucune 🎯
