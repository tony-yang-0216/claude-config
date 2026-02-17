#!/bin/bash

# 建立指令與文件目錄
mkdir -p .claude/commands
mkdir -p docs

echo "🚀 正在部署最強版 Claude Code 持久化指令集 (Workflow v2)..."

# --- 1. /onboard (專案入職與持久化) ---
cat > .claude/commands/onboard.md << 'EOF'
# Task: Project Onboarding & Persistence

請分三階段執行，並將所有進度實體化記錄於檔案中：

### Phase 1: 掃描與同步
- 檢查是否存在 `docs/CODEBASE.md`。
- 若已存在：讀取並驗證與目前代碼是否一致，指出差異點。
- 若不存在：掃描目錄結構、`package.json`、`CLAUDE.md`，建立初版 `docs/CODEBASE.md`。
- **匯報**：簡述目前對技術棧與架構的理解。

### Phase 2: 邏輯深挖
- 追蹤核心資料流 (Data Flow) 與關鍵進入點。
- 更新 `docs/CODEBASE.md`，加入「模組權責」與「關鍵商務邏輯」。
- **提問**：條列出不確定或代碼中模糊的地方。**請等待我的回覆再繼續。**

### Phase 3: 知識封存
- 根據回覆，產出 `docs/ONBOARDING.md` 作為新人指南。
- 確保以後即使執行 `/clear`，只要讀取 `docs/CODEBASE.md` 就能立刻接手任務。
EOF

# --- 2. /task (任務計畫與分析) ---
cat > .claude/commands/task.md << 'EOF'
# Task: Task Analysis & Implementation Plan
# Input: $ARGUMENTS

步驟：
1. **背景檢索**：閱讀 `CLAUDE.md` 與 `docs/CODEBASE.md`。
2. **影響分析**：針對 $ARGUMENTS 描述的需求，識別需修改的檔案清單。
3. **實作提案**：給出邏輯步驟（不直接寫 code），包含對現有架構的改動。
4. **規範檢查**：確保計畫符合 `CLAUDE.md` 的風格要求。
5. **確認**：等待我確認（或輸入 "GO"）後再開始實作。
EOF

# --- 3. /bug (問題診斷與修復) ---
cat > .claude/commands/bug.md << 'EOF'
# Task: Bug Diagnosis & Root Cause Analysis
# Input: $ARGUMENTS

步驟：
1. **重現分析**：分析錯誤訊息或異常行為描述。
2. **代碼搜尋**：使用 grep 或 ls 定位可能的出錯點。
3. **原因解釋**：說明為何會發生此問題（Root Cause）。
4. **修復建議**：提出修復方案，並檢查是否會對其他模組造成 Side Effect。
EOF

# --- 4. /review (代碼品質審查) ---
cat > .claude/commands/review.md << 'EOF'
# Task: Code Quality Review

請針對「目前變更」或「指定檔案」進行審查：
1. **規範一致性**：是否符合 `CLAUDE.md` 定義的命名、結構與風格。
2. **邏輯健全性**：檢查邊界條件處理（Edge Cases）與錯誤處理。
3. **優化建議**：是否有更簡潔或效能更好的寫法。
4. **文件同步**：是否需要更新 `docs/CODEBASE.md`。
EOF

# --- 5. /pr-desc (自動化 PR 描述) ---
cat > .claude/commands/pr-desc.md << 'EOF'
# Task: Pull Request Description Generator

分析目前 branch 的所有變更，產出：

## 📝 Summary
- 一句話說明核心變更。

## 🛠 Changes
- 檔案路徑與變更邏輯摘要。

## 🧪 Test Plan
- 如何驗證變更（包含指令或手動測試步驟）。

## ⚠️ Risks
- 潛在風險或需要 Reviewer 特別關注的地方。
EOF

chmod +x .claude/commands/*.md
echo "✅ 指令集部署完成！"
echo "指令包含:"
ls ./claude/commands
echo "💡 提示：現在你可以執行 /onboard 開始你的專案探索之旅了。"

