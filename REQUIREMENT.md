# Mobile Development Challenge – To-do App Implementation

**December 2025**

---

## ✨ Overview

- **Goal**: Demonstrate your ability to build a professional-grade, scalable, testable, and maintainable mobile application following **Clean Architecture** principles.
- **Tech Stack**: You may choose any mobile technology you prefer, including **Flutter**, **Native Android/iOS**, **React Native**, etc.

---

## ✨ Important Note About APIs

- All API URLs provided in this document are **examples only**.
- You are required to **create your own mock API** to successfully complete this assignment.

---

## ✨ Application Features

### 1. Home Screen
This screen will have **four buttons**:

- To Call  
- To Buy  
- To Sell  
- Sync  

**Features:**
- Four modules: To Call, To Buy, To Sell, Sync (Manual Sync)
- Realtime counters

---

### 2. To-Call Module (Remote API)

Displays a list of persons to call. Data is retrieved from a **web API**.

**Requirements:**
- Pagination  
- Filtering  
- Retry logic  
- Last-synced timestamp  

---

### 3. To-Buy Module (Remote API)

Displays a list of items to buy. Data is returned from a **web API**.  
You may create the API and define any JSON structure needed.

**Requirements:**
- Sorting  
- Filtering  
- Detail page  
- Wishlist stored locally  

---

### 4. To-Sell Module (Local Database)

Displays a list of items to sell. Data is stored in an **SQLite table named `ItemToSell`**.  
Users can add, update, and delete items.

**Requirements:**
- Full CRUD  
- Validation  
- Bulk delete  
- Undo delete  

---

### 5. Sync Module (Hybrid Sync)

The same logic applies to **To-Sell**, but also supports **offline selling**.

**Behavior:**
- When the user clicks *Sell*, the item’s sold status is stored locally
- Data is synced with the API once the device is online

**Requirements:**
- Offline-first  
- Manual + background sync  

---

## ✨ Architecture Requirements

- Presentation / Domain / Data layers
- Repository + Use Case structure
- Dependency Injection

---

## ✨ AI-Resistant Requirements

- ADR (Architectural Decision Record)
- Sequence diagrams
- Folder structure justification
- At least **two unit tests**

---

## ✨ Deliverables & Submission Guidelines

### 🎯 Deadline
- Submit within **02 days (48 hours)** from the exact time this assignment was sent
- Late submissions will **not** be evaluated

### 📌 How to Submit

1. Push your final code to a **public repository** (GitHub, GitLab, or Bitbucket)
2. Make the repo fully public and send the **direct repository link**
3. Include the **exact time you finished and pushed** the project
4. Ensure your submission includes:
   - A complete and fully runnable project
   - Comprehensive documentation (within the repository)
   - Instructions for setting up the mock API or data

---

## 💡 Expectation

We evaluate **senior-level Mobile developers** by:
- Attention to detail
- Ability to deliver **production-ready code**
- Well-structured documentation

> ⚠️ **Important**:  
> The reviewer will clone and run your project immediately.  
> If it doesn’t build and run perfectly within **10 minutes**, it will be rejected — regardless of how good the code looks.

---

**------------------------------ Good luck with your test! ------------------------------**
