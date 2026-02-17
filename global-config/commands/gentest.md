為以下目標生成單元測試：
- 框架：優先使用 pytest。
- 模式：嚴格遵循 AAA (Arrange, Act, Assert) 模式，並在代碼中以註解標註這三個階段。
- 命名：測試函式使用 test_<function_name>_<scenario_description>。
- 範圍：覆蓋 Happy Path、Edge Cases 以及 Error Cases（如 Exception 拋出）。
- 依賴：針對 FastAPI/Django 邏輯，需包含對 Database、Redis 或外部 API 的 Mocking。
- 風格：參照專案現有的測試風格；若無，則使用最新 Python 慣例。

目標: $ARGUMENTS
