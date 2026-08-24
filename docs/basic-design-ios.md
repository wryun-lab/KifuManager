# iOSアプリ基本設計書

## 1. プロジェクト概要

### 1.1 アプリケーション名
- アプリ名: KifuManager
- バージョン: 1.0.0

### 1.2 開発環境
- Xcode: 15.0以上
- Swift: 5.9以上
- iOS: 17.0以上（SwiftDataの動作要件）
- デバイス対応: iPhone, iPad

### 1.3 開発期間
- 開始日: [開始日]
- 終了予定日: [終了予定日]

## 2. アプリケーション構成

### 2.1 アーキテクチャ
- アーキテクチャパターン: Presentation / Domain / Data のレイヤ分離（Presentation層はSwiftUI + MVVM）
- 依存関係管理: Swift Package Manager
- 依存の方向: Presentation → Domain → Data の一方向のみ

### 2.2 主要コンポーネント
- Views（SwiftUI）
- ViewModels
- Domain Models / UseCases
- Repositories（SwiftData）
- Utilities
- Resources

### 2.3 ディレクトリ構造
リポジトリ全体の構成は [`architecture.md`](./architecture.md) を参照。以下はiOSアプリ本体（`src/ios/KifuManager/`）配下の想定構成。

```
src/ios/KifuManager/
├── KifuManagerApp.swift        # @main / ModelContainer構築
├── Presentation/
│   ├── Views/
│   └── ViewModels/
├── Domain/
│   ├── Models/
│   └── UseCases/
├── Data/
│   ├── Repositories/
│   └── Persistence/
├── Common/
│   ├── Extensions/
│   └── Utilities/
└── Assets.xcassets
```

## 3. 機能要件

### 3.1 主要機能
MVP対象は [`functional-requirements.md`](./functional-requirements.md) のF001〜F008。

1. F001 棋譜入力 / F007 棋譜記録・管理
2. F002 棋譜保存
3. F003 棋譜再生
4. F004 局面検索
5. F005 将棋盤UI表示 / F006 将棋盤駒操作
6. F008 局面注釈機能

### 3.2 画面遷移図
画面一覧（S001〜S008）は [`functional-requirements.md`](./functional-requirements.md) を参照。遷移仕様は未確定のため、要件定義の完了後に記載する。

## 4. 技術要件

### 4.1 使用ライブラリ
- SwiftUI: UI構築
- SwiftData: ローカルデータ永続化（CloudKit同期は将来フェーズ）
- SwiftShogi: 将棋ロジック（手生成・合法手判定・局面管理）

### 4.2 セキュリティ要件
- MVPはオフライン完結のため、ネットワーク通信とユーザー認証は対象外（クラウド同期の実装時に検討）
- ローカルデータはiOS標準のファイル保護（Data Protection）に依拠する
- プライバシーポリシー対応（App Store申請時）

### 4.3 パフォーマンス要件
- 起動時間: 3秒以内
- メモリ使用量: 100MB以下
- バッテリー消費: 最小限

## 5. テスト計画

### 5.1 テスト種類
- ユニットテスト
- UIテスト
- 統合テスト
- パフォーマンステスト

### 5.2 テスト環境
- シミュレータ
- 実機テスト
- CI/CD環境

## 6. リリース計画

### 6.1 リリーススケジュール
- アルファ版: [日付]
- ベータ版: [日付]
- 正式版: [日付]

### 6.2 リリース要件
- App Store審査対応
- プライバシーポリシー
- 利用規約
- アプリアイコン
- スクリーンショット

## 7. 保守・運用計画

### 7.1 バグ修正
- 重大バグ: 24時間以内
- 通常バグ: 1週間以内
- 軽微バグ: 次回アップデート

### 7.2 アップデート計画
- 機能追加: 3ヶ月ごと
- バグ修正: 随時
- セキュリティ更新: 即時対応

## 8. 注意事項

### 8.1 開発時の注意点
- コーディング規約の遵守
- セキュリティ対策
- パフォーマンス最適化
- アクセシビリティ対応

### 8.2 リリース時の注意点
- App Storeガイドラインの確認
- プライバシーポリシーの更新
- バージョン管理
- リリースノートの作成 