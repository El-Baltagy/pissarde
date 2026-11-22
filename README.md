# 🏢 Pissarde (بيسارد) — Next-Gen HR & Smart Workforce Management System

[![Flutter](https://img.shields.io/badge/Flutter-3.38.4-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10.3-0175C2?logo=dart)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture%20%2B%20BLoC-blueviolet)]()
[![Firebase](https://img.shields.io/badge/Firebase-FCM%20%2B%20Analytics%20%2B%20Crashlytics-orange?logo=firebase)]()
[![License](https://img.shields.io/badge/License-Proprietary-red)]()

> **Pissarde** is an enterprise-grade mobile HR and smart workforce solution built for modern enterprises. It seamlessly orchestrates **geofenced biometric attendance**, **intelligent leave requests & multi-level approvals**, **shift rotation scheduling**, **multi-branch operations**, and **real-time cloud notification routing**.

---

## 📑 Table of Contents
1. [System Overview & Architecture](#-system-overview--architecture)
2. [Core Functional Modules](#-core-functional-modules)
3. [Design System & Color Palette](#-design-system--color-palette)
4. [Onboarding Visual Identity & Creative Brief](#-onboarding-visual-identity--creative-brief)
5. [Google Imagen / Gen-AI Onboarding Image Prompts](#-google-imagen--gen-ai-onboarding-image-prompts)
   - [Slide 1: Smart Geofenced Attendance](#slide-1-smart-geofenced-attendance--check-in)
   - [Slide 2: Leaves & Intelligent Approval Workflow](#slide-2-leaves--intelligent-approval-workflow)
   - [Slide 3: Flexible Shifts & Multi-Branch Rostering](#slide-3-flexible-shifts--multi-branch-rostering)
   - [Slide 4: Real-Time Alerts & Central Notification Hub](#slide-4-real-time-alerts--central-notification-hub)
6. [Prompt Guidelines & Generation Best Practices](#-prompt-guidelines--generation-best-practices)

---

## 🌐 System Overview & Architecture

Pissarde is engineered with **Clean Architecture**, separation of concerns, and unidirectional state management via **BLoC/Cubit**:

```
lib/
├── core/
│   ├── api_helper/          # Robust Dio networking, interceptors, token refresh & cancelation
│   ├── app/                 # AutoRoute declarative routing & main application widget
│   ├── localization/        # EasyLocalization multi-language engine (Arabic & English RTL/LTR)
│   ├── notification_helper/ # Unified FCM service, strategy-pattern handlers & local notifications
│   ├── storage/             # Encrypted Hive storage & secure device token management
│   └── theming/             # Design tokens, typography hierarchy & light/dark color definitions
└── features/screens/
    ├── home/                # Geolocation radar, attendance dashboard & live check-in toggle
    ├── requests/            # Leave application submission, balance breakdown & manager approvals
    ├── notifications/       # Segmented notification center, quick filters & interactive detail sheets
    ├── profile/             # Organization hierarchy, employees, shifts, branches & company policy
    └── login/               # Secure authentication & session validation
```

---

## ⚡ Core Functional Modules

### 📍 1. Smart Geofenced Attendance & Live Tracking
- **GPS Coordinates & Radar Radius Validation**: Verifies that employee check-ins and check-outs happen strictly within designated branch geofences.
- **Bi-Directional Action Slider / Toggle**: One-tap instant check-in/out state synchronization.
- **Real-Time Working Metrics**: Live on-duty timers, weekly commitment bars, late-arrival metrics, and absence tracking.

### 🏖️ 2. Comprehensive Leave Management & Approval Hub
- **Self-Service Requests**: Employees submit paid time-off, sick leaves, emergency permits, and remote work requests with document attachments.
- **Manager Approval Pipeline**: Dedicated `PendingApprovals` screen enabling managers to review, approve, or reject employee requests with audit notes.
- **Dynamic Leave Balances**: Real-time remaining quota indicators and annual entitlement charts.

### ⏱️ 3. Dynamic Shift Scheduling & Branch Management
- **Shift Rostering**: Morning, evening, split-shift, and overnight scheduling with customizable grace periods and break windows.
- **Multi-Branch Operations**: Assign employees to designated corporate headquarters, remote hubs, or retail branches.
- **Official Holidays Calendar**: Automated tracking of national and company-wide paid non-working days.

### 🔔 4. Central Notification Center & FCM Integration
- **Zero-Latency Push Notifications**: Google Firebase Cloud Messaging integrated with custom high-importance Android channels.
- **Instant Redirection**: Deep-linking directly to the Notification Center (Tab Index 1) on tap with automatic data refresh.
- **Categorized Tabs**: Quick filters for Approvals, Attendance alerts, Shift updates, and Corporate Announcements.

---

## 🎨 Design System & Color Palette

The app employs a corporate, modern aesthetic rooted in trust, technology, and clarity:

| Token Name | Hex Code | Visual Swatch | Semantic Purpose |
| :--- | :---: | :---: | :--- |
| **Primary Navy** | `#1B3B8B` | ![#1B3B8B](https://via.placeholder.com/15/1B3B8B/000000?text=+) | Header backgrounds, primary buttons, brand accents |
| **Secondary Coral** | `#FF6B6B` | ![#FF6B6B](https://via.placeholder.com/15/FF6B6B/000000?text=+) | Action buttons, prominent highlights, notifications |
| **GPS Radar Teal** | `#0D9488` | ![#0D9488](https://via.placeholder.com/15/0D9488/000000?text=+) | Geolocation radar, safe zones, location indicators |
| **Online / Success Green**| `#10B981` | ![#10B981](https://via.placeholder.com/15/10B981/000000?text=+) | Checked-in status, approved requests, high commitment |
| **Warning / Review Gold** | `#D97706` | ![#D97706](https://via.placeholder.com/15/D97706/000000?text=+) | Late alerts, pending approval tags, grace periods |
| **Danger / Alert Red** | `#EF4444` | ![#EF4444](https://via.placeholder.com/15/EF4444/000000?text=+) | Absence badges, check-out triggers, rejection alerts |
| **Surface Background** | `#F8F9FA` | ![#F8F9FA](https://via.placeholder.com/15/F8F9FA/000000?text=+) | Clean light background, card borders, neutral canvas |

---

## 🖼️ Onboarding Visual Identity & Creative Brief

When generating onboarding visuals for **Pissarde**, adhere to the following artistic direction:
- **Art Style**: High-end 3D Claymorphic / Isometric tech illustration with smooth matte finishes, soft ambient occlusion, gentle glowing neon outlines, and minimalist corporate aesthetic (akin to modern fintech & enterprise SaaS apps like Linear, Stripe, and Apple Health).
- **Characters**: Diverse, friendly corporate professionals wearing smart-casual business attire (deep navy, white, slate grey, with touches of coral and mint).
- **Composition**: Centered focal point, balanced negative space, clean floating UI glassmorphic cards around the main subject.
- **Lighting & Atmosphere**: Soft studio lighting, volumetric rim light, slight depth of field, bright clean background with subtle gradient accents (`#FFFFFF` to `#F1F5F9`).

---

## 🚀 Google Imagen / Gen-AI Onboarding Image Prompts

Copy and paste the exact prompts below into **Google Imagen**, **Whisk**, **Midjourney**, or any generative AI model:

---

### Slide 1: Smart Geofenced Attendance & Check-In
> **Focus**: Location-based effortless attendance, GPS precision, on-time commitment.

```text
3D isometric illustration of a happy modern corporate employee tapping a glowing green check-in button on a floating sleek smartphone screen. Behind the smartphone, a miniature futuristic corporate glass office building is surrounded by a translucent glowing teal circular GPS geofence radar beacon (#0D9488). Minimalist floating 3D badge icons showing an analog clock with a green checkmark, geolocation pin, and live status badge saying 'On Duty'. Color palette: Deep Royal Navy (#1B3B8B), vibrant teal, online emerald green (#10B981), and clean white. Soft matte textures, claymorphism, Apple-style premium 3D design, clean studio lighting, soft diffused shadows, isolated on a clean neutral light background, 8k resolution, trending on Dribbble, Octane render --ar 9:16
```

---

### Slide 2: Leaves & Intelligent Approval Workflow
> **Focus**: Paperless time-off requests, stress-free balance tracking, instant manager approvals.

```text
3D premium isometric illustration representing smart leave management and time-off requests. A cheerful employee relaxing with a coffee cup beside a large floating 3D calendar with highlighted vacation dates and a miniature palm tree. Floating glassmorphic notification cards show a green 'Approved' stamp with a checkmark badge and a golden star. Floating metric pills show 'Annual Leave Balance: 18 Days'. Elegant corporate color palette featuring deep navy (#1B3B8B), soft coral accents (#FF6B6B), and mint green (#10B981). Claymorphic aesthetic, smooth matte plastic and frosted glass materials, clean studio lighting, pristine pastel background, highly detailed 3D render, ultra-crisp --ar 9:16
```

---

### Slide 3: Flexible Shifts & Multi-Branch Rostering
> **Focus**: Work-life balance, seamless shift scheduling, multi-location flexibility.

```text
3D isometric illustration celebrating flexible working shifts and modern scheduling. In the center, a stylish 3D circular 24-hour shift clock with color-coded segments (morning, evening, flexible) smoothly rotating. Two diverse professional team members collaborating happily with miniature laptop and tablet. In the background, interconnected miniature 3D architectural office branches linked by glowing dashed lines. Floating glass UI cards showing 'Shift Confirmed 09:00 - 17:00' with a shield icon. Colors: Corporate navy blue (#1B3B8B), electric teal (#0D9488), warm amber, and white. Beautiful depth of field, Octane render, smooth Pixar/Stripe inspired 3D corporate style, soft shadows, pristine light backdrop --ar 9:16
```

---

### Slide 4: Real-Time Alerts & Central Notification Hub
> **Focus**: Instant notifications, direct communication, never missing important company updates.

```text
3D isometric tech illustration depicting real-time enterprise communication and notification center. A glowing golden-bronze notification bell floating in the center with dynamic sound waves and an energetic coral notification badge (#EF4444) showing '3 New'. Floating stacked 3D glassmorphic notification cards displaying 'Approval Request', 'Shift Reminder', and 'Attendance Verified' with vibrant micro-icons. Soft neon light trails entering a sleek smartphone. Harmonious color harmony of deep navy (#1B3B8B), coral red, and emerald green on an ultra-clean white and light grey surface. Volumetric lighting, frosted glass blur, claymorphism 3D art, modern SaaS product visual, 8k render --ar 9:16
```

---

## 🛠️ Prompt Guidelines & Generation Best Practices

| Parameter | Recommended Setting | Purpose |
| :--- | :--- | :--- |
| **Aspect Ratio (`--ar`)** | `9:16` (Vertical Full-Screen) or `1:1` (Card/Square) | Optimized for mobile onboarding screens |
| **Art Style** | `3D Claymorphic / Isometric Tech Art` | Consistent, friendly, premium enterprise look |
| **Color Enforcers** | `#1B3B8B (Navy), #0D9488 (Teal), #10B981 (Green), #FF6B6B (Coral)` | Enforces brand identity consistency across all 4 slides |
| **Negative Prompts** | `photorealistic, real photo, noisy, dark background, clutter, text spelling errors, low poly, distorted hands, creepy faces, messy wireframe` | Eliminates common artifacts and ensures clean UI illustrations |

---

*Authored for the Pissarde Mobile Enterprise Ecosystem.*
