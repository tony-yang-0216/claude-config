請先執行 `git diff --cached --stat` 分析當前暫存區變動，並產出符合規範的提交指令：

1. Type 規範 (嚴格執行)：
   - build, ci, docs, feat, fix, perf, refactor, revert, style, test, chore

2. 格式要求：
   - 格式：<type>(<scope>): <description>
   - Description：使用英文 (Imperative mood)，Generates clear, concise, and standardized description。
   - 禁止出現任何與 Claude 或 AI 協作相關的文字。

3. 內容架構 (Summarize purpose using bullet points)：
   - 標題：描述改動的核心。
   - 正文 (Body)：使用點列式 (Bullet Points) 摘要說明變動的目的與核心邏輯。

4. 原子性檢查 (Atomic Commit Check)：
   - 若 staged 變動包含多個不相關邏輯，請停止產出指令，主動提醒我拆分並建議每個 commit 的範圍。

5. 輸出與執行：
   - 僅產出 `git commit -m "標題" -m "點列式內容"` 指令。
   - **產出指令後，請主動詢問我是否要執行該指令。**
   - 必須以實體 git 狀態為準，禁止參考對話歷史中的程式碼。

