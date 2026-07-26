# ドキュメント目次

このディレクトリは、人間（プロダクト関係者・レビュアー）向けのドキュメントを管理します。
CC-sdd (Kiro形式のspec-driven development) がAI向けに読み書きする作業領域は [`.kiro/`](../.kiro/) 側にあり、役割を分離しています。

| ドキュメント | 内容 |
|---|---|
| [`product.md`](./product.md) | プロダクトの目的・概要 |
| [`architecture.md`](./architecture.md) | 全体アーキテクチャ概要 |
| [`branching.md`](./branching.md) | ブランチ運用ルール・PRフェーズ分割 |
| [`requirements/`](./requirements/) | 機能ごとの要件サマリ（詳細は`.kiro/specs/<slug>/requirements.md`） |

## `.kiro/` と `docs/` の役割分担

- **`.kiro/`**: CC-sddツールが読み書きする作業領域。`steering/`（プロジェクトメモリ）、`specs/<slug>/`（要件・設計・タスクのEARS形式ドキュメント）、`settings/`（テンプレート・ルール）を格納する。仕様はコードと同様にGitでバージョン管理する。
- **`docs/`**: 人間のレビュアー・関係者向けの読みやすいドキュメント。`.kiro/specs/`の詳細を全文複製せず、要約とリンクで参照する。
