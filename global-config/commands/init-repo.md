# Task: Initialize Project for Claude Code

請深入掃描 Repo 並自動執行必要的 ls 與 cat 操作，隨後生成以下檔案：

## 1. CLAUDE.md (專案根目錄)
內容需包含：
1. 專案概述與技術棧：一句話描述目標與核心技術。
2. 常用指令：列出精確的 Build, Dev, Test, Lint 指令（請檢查 package.json 或 Makefile）。
3. 目錄結構：僅列出主要目錄及其權責。
4. 代碼風格慣例：分析變數命名、匯入順序、專案中常見的錯誤處理模式。
5. 架構摘要：一句話說明資料流向，並指向 docs/ 下的詳細文件。

嚴格限制：
- 內容控制在 100-150 行內。
- 優先使用 Markdown 表格或條列式以節省空間。
- 只包含不會頻繁變動的資訊。會變動的細節 (TODO, 當前 Bug) 不應出現。

## 2. docs/ARCHITECTURE.md
將複雜的架構資訊拆到此檔案：
- 模組間的依賴關係與資料流 (用 Mermaid 圖)
- 每個核心模組的職責與 public API
- 資料庫 schema 摘要 (如果有)
- 關鍵設計決策與原因

## 3. CLAUDE.md 中加入指引
在 CLAUDE.md 的對應段落加上：
- `Architecture details: docs/ARCHITECTURE.md`
- 以及其他拆分出去的 docs 檔案路徑

確保以後 Claude 在需要深入資訊時知道去哪裡找。
