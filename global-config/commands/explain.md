根據 Google Engineering Practices 準則，用繁體中文分析以下程式碼：

1. 邏輯與目的 (Logic & Purpose)：
   - 這段程式碼解決了什麼核心問題？其執行流程為何？

2. 設計決策 (Design Decisions)：
   - 分析代碼的複雜度 (Complexity) 與可讀性。
   - 是否符合語言慣例 (如 Pythonic)？有無過度設計 (Over-engineering)？

3. 潛在風險 (Potential Risks)：
   - 找出潛在 Bug、Edge Cases 或併發 (Concurrency) 問題。
   - 檢查 Error Handling 是否完備，有無效能瓶頸 (如 Redis 讀取、K8s 資源爭搶)。

4. 重構建議 (Refactoring Suggestions)：
   - 如何提升可測試性 (Testability)？是否能更簡潔地達成相同目的？

對象: $ARGUMENTS
