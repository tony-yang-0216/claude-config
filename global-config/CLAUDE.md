# SWE Global Rules

## Response Style
- 語言：回覆使用繁體中文，程式碼註解與系統 Log 使用英文。
- 精簡原則：禁止複述問題、禁止開場白、禁止結尾問候語。
- 知識過濾：回答盡量清楚精簡，避免重複解釋我已經問過的概念或基礎操作。
- 決策建議：針對 EKS、Auth、Azure 等複雜架構，直接給出最佳實踐方案。

## Coding Style (Context-Aware)
- 非同步處理：優先使用 async/await。
- 命名規範：Python 專案遵循 PEP 8 使用 snake_case；Web 或 JSON 相關預設使用 camelCase。
- 強健性：錯誤處理必須明確，禁止 silent catch 或空的 except 區塊。
- 基礎設施：處理 YAML 或 Helm 模板時，保持與現有檔案的命名慣例一致。

## Execution & Token Saving

### 工具選擇策略（優先順序）
- 檔案搜尋：使用 Glob 工具（禁止 find 或 ls 遞迴搜尋）
- 內容搜尋：使用 Grep 工具（禁止 bash grep/rg 指令）
- 架構探索：使用 Task + Explore agent（禁止手動多輪 Grep）
- 檔案讀寫：已知路徑直接 Read/Edit，未知路徠用 Glob 找（禁止先 ls）

### 並行執行強制規則
- 獨立操作必須在單一 message 並行執行（如同時讀取多個檔案）
- 禁止逐一執行可並行的 Read、Grep、Glob、Bash 指令
- 範例：讀取 3 個檔案 → 單次回覆包含 3 個 Read tool calls

### Agent 使用時機
- 複雜探索問題（「XXX 功能在哪裡實作」）→ 必須用 Explore agent
- 多檔案變更（>3 檔案）或架構性修改 → 必須用 EnterPlanMode
- Agent 內部操作不計入 tokens，優先使用

### 程式碼輸出限制
- 使用 Edit/Write 工具後，禁止在回覆中重複顯示程式碼內容
- 僅用「檔案路徑:行號」引用變更位置（如 auth.py:45-52）
- 禁止顯示「完整檔案」或「變更後的程式碼」

### 自動化執行
- 唯讀操作（ls, cat, git status）不需詢問；具變動性的操作（rm, git push）必須經過確認。
- 流程優化：回覆時不需要重述我的問題，直接產出解決方案、代碼或執行結果。

## Technical Stack Context
- Backend: FastAPI, Django, Redis.
- Infra: EKS, K8s, Helm, Prometheus.
- Auth: Auth0, Keycloak.
- Tooling: Azure, MS Teams, Notion, Getoutline.

