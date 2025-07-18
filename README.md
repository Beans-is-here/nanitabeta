# サービス概要
外食を頻繁にする30~40代男性向けに、過去の注文履歴から新たなメニュー選びを支援するwebサービス。

# このサービスへの思い・作りたい理由
外食時に「前回注文した商品を忘れてしまい、また同じ商品を頼んでしまった」という経験が多く、気になっていたほかの商品にチャレンジできないことに課題を感じた。\
この問題を解決するために注文履歴を簡単に記録と参照できるサービスを開発した。

# ターゲットとするユーザー層
以下の傾向から30~40代男性を想定
- 外食が多く、若い世代や女性に比べて商品のビジュアルに重きを置いて注文することが少ない。
- 写真を撮ってSNSに投稿したりすることも少ない。
- 飲食店の選択基準として職場や自宅の近くとすることが多く、複数回来店している。

# サービスの利用イメージ
飲食店へ再訪時に、店名を検索することで過去の注文履歴が確認でき、注文時に新たな選択肢が得られる。
ユーザーへの選択肢の提供は次の2点にて実現可能と想定。
- ユーザーには注文履歴の登録と同時に任意で「次回食べたいメニュー」を登録可能とする。
- 再訪時に該当メニューを「注文済み」とマークすると、注文履歴へ登録・気になるメニューから削除

# ユーザーの獲得について
来店直後、注文直後の記録を即時に完結できるUIを設計している。\
フェーズ1段階では自身と知人を対象にテスト。\
フェーズ2段階では“次回何を頼むか迷わなくなるサービス”としてSNSで発信。

自身がよく行く飲食店を中心にQRコードからの導入を交渉。\
将来的には店舗にフィードバックする機能をつけることで、店舗も巻き込む形に進化させたい。

# サービスの差別化ポイント
店選びの基準となる口コミサービスやビジュアルが良い商品が目につきやすいSNSは来店のきっかけにはなる。\
一方で、再度来店した際にユーザー個々人にあった選択肢を提供するサービスは少ないと考える。\
当該サービスでは記録と再訪時の意思決定支援にフォーカスすることでユーザーがまだ経験していない商品へのアプローチになると考える。

# guestユーザー
メールアドレス : guest@example.com
パスワード : Guest0Password

# 機能候補
## MVPリリース時
- ユーザー登録  / ログイン
- 飲食店名とメニュー名の履歴登録
- 店名による履歴検索(店舗検索の補完。設計だけでも入れときたい)

## MVPリリース後
- OAuthログイン (Google / x等を想定)
- SNS等での外部シェア用キャプチャ生成
- パスワードリセット機能
- 履歴ベースでユーザーへのリコメンド通知。蓄積されたユーザー行動から、未体験のメニュージャンルやカテゴリでの提案、他ユーザーの履歴を元にした提案機能も構想中
- 位置情報から店舗名の予測入力機能　=> 当該サービスの目的から外れるのではないかと考え、破棄。
- 登録情報編集、削除
  
## 技術スタック
- **バックエンド**: Ruby 3.3.6 / Rails 7.1.3
- **データベース**: PostgreSQL 15
- **フロントエンド**: Tailwind CSS
- **インフラ**: Docker / Render
- **メール機能**: ActionMailer 7/11 SMTP Gmail

### 使用Gem

- `devise` - 認証機能
- `geocoder` - 位置情報取得 => 当該サービスの目的から外れるのではないかと考え、破棄。
- `rails-i18n` (~> 7.0.0) - 国際化対応
- `draper` (4.0.2) - デコレーター
- `carrierwave` (2.2.2) - 画像アップロード
- `turbo-rails` (1.1.1) - Turbo対応
- `kaminari` (1.2.2) - ページネーション
- `ransack` (3.2.1) - 検索機能 => form objectで対応
- `letter_opener_web` (2.0.0) - メール確認用
- `config` (4.0.0) - アプリケーション設定
- `pry-byebug`（開発用）
- `MiniMagick` - 画像生成
- 'fog-aws' - 画像アップロード
- 'dotenv-rails' - 画像アップロードテスト