# アーキテクチャ概要

## 技術スタック
- 言語: Swift
- UIフレームワーク: SwiftUI
- プロジェクト管理: Xcode（`src/KifuManager.xcodeproj`）
- ビルド補助: SweetPad（`buildServer.json`, `.vscode/settings.json`）

## ディレクトリ構成
```
KifuManager/
├── .kiro/                 # CC-sddの作業領域（steering / specs / settings）
├── docs/                  # 人間向けドキュメント
├── src/
│   ├── KifuManager/           # アプリ本体のSwiftソース
│   ├── KifuManagerTests/      # ユニットテスト
│   └── KifuManagerUITests/    # UIテスト
└── .cursor/skills/kiro-*/ # CC-sddのCursor Skills
```

> 機能追加に伴いアーキテクチャが具体化したら、本ドキュメントと `.kiro/steering/structure.md`・`tech.md`（`/kiro-steering` コマンドで生成）を合わせて更新してください。
