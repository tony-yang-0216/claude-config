#!/bin/bash

# 1. 建立指令儲存目錄
mkdir -p ~/.claude/commands

# 2. 建立 /explain 指令 (Google Code Review 風格)
cat > ~/.claude/commands/explain.md << 'EOF'
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
EOF

# 3. 建立 /gentest 指令 (AAA 測試模式)
cat > ~/.claude/commands/gentest.md << 'EOF'
為以下目標生成單元測試：
- 框架：優先使用 pytest。
- 模式：嚴格遵循 AAA (Arrange, Act, Assert) 模式，並在代碼中以註解標註這三個階段。
- 命名：測試函式使用 test_<function_name>_<scenario_description>。
- 範圍：覆蓋 Happy Path、Edge Cases 以及 Error Cases（如 Exception 拋出）。
- 依賴：針對 FastAPI/Django 邏輯，需包含對 Database、Redis 或外部 API 的 Mocking。
- 風格：參照專案現有的測試風格；若無，則使用最新 Python 慣例。

目標: $ARGUMENTS
EOF

echo "✅ Claude Global Commands 部署完成！"
echo "位置: ~/.claude/commands/"

