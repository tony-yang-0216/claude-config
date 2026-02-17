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
- 檔案操作：讀取前優先使用已知路徑。不確定路徑時，先執行 ls 確認結構，禁止盲目搜尋。
- 自動化執行：唯讀操作（ls, cat, git status）不需詢問；具變動性的操作（rm, git push）必須經過確認。
- 流程優化：回覆時不需要重述我的問題，直接產出解決方案、代碼或執行結果。

## Technical Stack Context
- Backend: FastAPI, Django, Redis.
- Infra: EKS, K8s, Helm, Prometheus.
- Auth: Auth0, Keycloak.
- Tooling: Azure, MS Teams, Notion, Getoutline.

