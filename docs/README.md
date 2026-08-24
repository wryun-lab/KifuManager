# ドキュメント目次

このディレクトリは、人間（プロダクト関係者・レビュアー）向けのドキュメントを管理します。
CC-sdd (Kiro形式のspec-driven development) がAI向けに読み書きする作業領域は [`.kiro/`](../.kiro/) 側にあり、役割を分離しています。

| ドキュメント | 内容 |
|---|---|
| [`product.md`](./product.md) | プロダクトの目的・概要 |
| [`architecture.md`](./architecture.md) | 全体アーキテクチャ概要 |
| [`branching.md`](./branching.md) | ブランチ運用ルール・PRフェーズ分割 |
| [`requirements-list.md`](./requirements-list.md) | プロジェクト全体の要件台帳（REQ-XXXX）と記入要領 |
| [`functional-requirements.md`](./functional-requirements.md) | 機能要件定義書（機能一覧F0XX・画面一覧S0XX・技術要件） |
| [`functional-specification.md`](./functional-specification.md) | 機能仕様書（機能詳細と実現方法） |
| [`basic-design-ios.md`](./basic-design-ios.md) | iOSアプリ基本設計書（構成・技術要件・テスト/リリース計画） |
| [`requirements/`](./requirements/) | 機能ごとの要件サマリ（詳細は`.kiro/specs/<slug>/requirements.md`） |

## 2つの要件ドキュメント体系

本リポジトリには由来の異なる要件ドキュメントが並存します。

- **要件台帳ベース**（`requirements-list.md` → `functional-requirements.md` → `functional-specification.md`）: `.cursor/rules/reqdefiniton.mdc` のワークフローで、要件整理から実装方針の決定までを人手で進めるための一式。プロジェクト全体を俯瞰する。
- **CC-sddベース**（`requirements/<slug>.md` と `.kiro/specs/<slug>/`）: 機能（`feature/<slug>`ブランチ）単位でEARS形式の受け入れ条件まで落とし込む一式。

前者で決めたスコープを、後者で機能単位に分解して実装へつなげます。

## `.kiro/` と `docs/` の役割分担

- **`.kiro/`**: CC-sddツールが読み書きする作業領域。`steering/`（プロジェクトメモリ）、`specs/<slug>/`（要件・設計・タスクのEARS形式ドキュメント）、`settings/`（テンプレート・ルール）を格納する。仕様はコードと同様にGitでバージョン管理する。
- **`docs/`**: 人間のレビュアー・関係者向けの読みやすいドキュメント。`.kiro/specs/`の詳細を全文複製せず、要約とリンクで参照する。
