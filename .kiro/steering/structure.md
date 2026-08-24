# プロジェクト構成

## 構成の考え方

- **レイヤ分離**: Presentation（SwiftUI）／Domain（将棋・検索の純ロジック）／Data（SwiftData・リポジトリ）を意識し、上位から下位への依存のみにする。
- **機能よりも層**: 画面単位のフォルダ分割より、再利用しうるドメイン・データアクセスを先に置く。画面が太らないようにする。

## ディレクトリのパターン（Xcode プロジェクト導入時の目安）

### アプリエントリとシーン構成

**想定場所**: `Application/` または `App/`  
**目的**: `@main`、アプリライフサイクル、DI の入口。  
**例**: `KifuManagerApp.swift` で `ModelContainer` を構築し、環境に注入。

### プレゼンテーション

**想定場所**: `Presentation/`（`Views/`・必要なら薄い `ViewModels/`）  
**目的**: SwiftUI の画面・部品。将棋盤グリッド、棋譜リスト、検索フォームなど。  
**例**: `BoardView` は盤の描画とジェスチャのみ。手の確定は ViewModel または UseCase に委譲。

### ドメイン

**想定場所**: `Domain/`（`Models/`・`UseCases/`）  
**目的**: SwiftShogi を組み合わせた棋譜操作、分岐管理、局面検索のクエリ組み立てなど、フレームワークに依存しない純 Swift。  
**例**: `KifuSession` が現在局面・分岐スタックを保持し、永続化層はそのスナップショットのみ知る。

### データ

**想定場所**: `Data/`（`Repositories/`・`Persistence/`）  
**目的**: `@Model` 型、フェッチ、マッピング。ドメイン型と SwiftData エンティティの変換境界。  
**例**: `SavedKifuRepository` が検索 API を提供し、UI はリポジトリインタフェースのみを見る。

### 共通

**想定場所**: `Common/`（`Extensions/`・`Utilities/`）  
**目的**: 横断的な小さなヘルパ。肥大化したらドメインへ移す。

## 命名の約束

- **型**: 意味のある英語の PascalCase（`BoardSquare`, `KifuRecord`）。
- **SwiftUI View**: 対象 + `View` サフィックス（例: `KifuListView`）。
- **永続化モデル**: ドメインと名前が衝突する場合は `Persisted` など接辞で区別。
- **ファイル**: 原則 1 公開型 1 ファイル（小さな private 拡張は同ファイル可）。

## import の整理

```swift
// 標準ライブラリ
import Foundation

// Apple フレームワーク
import SwiftUI
import SwiftData

// SPM（将棋）
import SwiftShogi

// 同一ターゲット内（層が近い場合は相対でも可）
// import はアルファベット順、空行でグループ分け
```

**パスエイリアス**: Xcode のグループと実ファイルパスを一致させ、モジュール分割した場合は `@testable import KifuManager` のようにテストから本体を参照。

## コードの境界ルール

- **View** は SwiftData の `@Query` を直接持ちすぎない。読み取り専用リスト程度に抑え、複雑なクエリは Repository へ。
- **SwiftShogi** に依存するコードは `Domain/` に寄せ、SwiftUI ファイルからは直接触れないようにする。
- **検索インデックス**（局面ハッシュ等）の更新は、棋譜保存・編集のユースケースと同じトランザクション境界で扱う。

---
iOS のソースツリーは `src/ios/KifuManager/` にある（テンプレート状態）。層ごとのフォルダ分けは `docs/basic-design-ios.md` のディレクトリ案を出発点とし、実装開始時に本ファイルと差分が出たら **パターン単位で** 追記する（ファイルツリーの全列挙はしない）。
