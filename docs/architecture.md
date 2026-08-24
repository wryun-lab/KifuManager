# アーキテクチャ概要

## プラットフォーム構成
iOS版とAndroid版を`src/`配下でプラットフォームごとのディレクトリに分けて管理する。

### iOS（`src/ios/`）
- 言語: Swift
- UIフレームワーク: SwiftUI
- プロジェクト管理: Xcode（`src/ios/KifuManager.xcodeproj`）
- ビルド補助: SweetPad（`buildServer.json`, `.vscode/settings.json`。いずれもリポジトリルートに配置し、`src/ios/`配下のワークスペースを参照する）

### Android（`src/android/`）
- 未着手（プレースホルダのみ）。着手時にAndroid Studio（Gradle）プロジェクトをこの配下に作成する。

## ディレクトリ構成
```
KifuManager/
├── .kiro/                     # CC-sddの作業領域（steering / specs / settings）
├── docs/                      # 人間向けドキュメント
├── src/
│   ├── ios/
│   │   ├── KifuManager.xcodeproj/
│   │   ├── KifuManager/            # アプリ本体のSwiftソース
│   │   ├── KifuManagerTests/       # ユニットテスト
│   │   └── KifuManagerUITests/     # UIテスト
│   └── android/                # Android版（未着手）
├── buildServer.json            # xcode-build-server設定（src/ios/を参照）
├── .vscode/settings.json       # SweetPad設定（src/ios/を参照）
└── .cursor/skills/kiro-*/      # CC-sddのCursor Skills
```

> 機能追加に伴いアーキテクチャが具体化したら、本ドキュメントと `.kiro/steering/structure.md`・`tech.md`（`/kiro-steering` コマンドで生成）を合わせて更新してください。
