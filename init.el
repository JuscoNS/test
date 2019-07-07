;; カスタマイズ用のファイルを設定
(setq custom-file "~/.emacs.d/custom_setttings.el")

;; カスタマイズ用ファイルをロード
(load custom-file t)

;; 位置 サイズ
(setq initial-frame-alist '((top . 30) (left . 400) (width . 110) (height . 55)))

;; 環境に合わせた日本語文字コードに設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; 1 行ずつスクロール
(setq scroll-conservatively 35 scroll-margin 0 scroll-step 1)

;; スクロール開始のマージンの行数
;(setq scroll-margin 10)

;; 1 画面スクロール時に重複させる行数
;(setq next-screen-context-lines 10)

;; 1 画面スクロール時にカーソルの画面上の位置をなるべく変えない
;(setq scroll-preserve-screen-position t)

;; 検索(全般)
(setq case-fold-search t)

;; インクリメンタルサーチ
(setq isearch-case-fold-search t)

;; バッファー名の検索
(setq read-buffer-completion-ignore-case t)

;; ファイル名の検索
(setq read-file-name-completion-ignore-case t)

;;;置換(全般)
;; (setq case-replace t)

;; dabbrev 時の置換
(setq dabbrev-case-replace nil)

;; backup ファイルオープン時のバックアップ (xxx~)
(setq make-backup-files nil)

;; auto-save 自動保存ファイル (#xxx#)
(setq auto-save-default nil)

;; auto-save-list 自動保存のリスト  (~/.emacs.d/auto-save-list/.saves-xxx)
(setq auto-save-list-file-prefix nil)

;; lock ロックファイル (.#xxx)
(setq create-lockfiles nil)

;; ビープ音禁止
(setq ring-bell-function 'ignore)

;; スタート画面(メッセージ)を表示しない
(setq inhibit-startup-screen t)

;; scratchの初期メッセージを非表示
(setq initial-scratch-message "")

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; 最近開いたファイルの表示数
(setq recentf-max-menu-items 10)

;; 最近開いたファイルの保存数
(setq recentf-max-saved-items 3000)

;; ミニバッファの履歴の保存数
(savehist-mode 1)

;; 選択領域を削除キーで一括削除
(delete-selection-mode t)

;; 行頭 kill-line (C-k) で行全体をカット
; (setq kill-whole-line t)

;; 読み取り専用バッファーでもカット系でコピー可能
; (setq kill-read-only-ok t)

;; ediff 時にフレームを使わない
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; 改行コードを表示する
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; 複数ウィンドウを禁止する
(setq ns-pop-up-frames nil)

;; 行数を表示する
(global-linum-mode t)

;; 行番号フォーマット
(setq linum-format "%4d")

;; カーソルの点滅をやめる
(blink-cursor-mode 0)

;; カーソル行をハイライトする
(global-hl-line-mode t)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; スペース、タブなどを可視化する
(global-whitespace-mode 1)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; 全角スペースを強調
(global-whitespace-mode 1)
(setq whitespace-space-regexp "\\(\u3000\\)")
(setq whitespace-style '(face tabs tab-mark spaces space-mark))
(setq whitespace-display-mappings ())
(set-face-foreground 'whitespace-tab "#F1C40F")
(set-face-background 'whitespace-space "#E74C3C")

;; タブ幅
(setq default-tab-width 4)

;; フレームの透明度
;(set-frame-parameter (selected-frame) 'alpha '(0.50))

;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; load-path
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;サイドバーにディレクトリの階層表示
(require 'neotree)
(setq neo-persist-show t)
(setq neo-smart-open t)
(global-set-key (kbd "<f6>") 'neotree-toggle)

;; helm
;(require 'helm-config)
;(helm-mode 1)

;; tabbar
(require 'tabbar)
(tabbar-mode 1)
(setq tabbar-buffer-groups-function nil)
;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button tabbar-scroll-left-button tabbar-scroll-right-button)) (set btn (cons (cons "" nil) (cons "" nil))))
;; 外観変更
(setq tabbar-separator '(2.2))
(set-face-attribute 'tabbar-separator nil :height 2.0)
(set-face-attribute 'tabbar-default nil :background "#34495E" :foreground "#EEEEEE" :height 0.95)

;; quickrun
(require 'quickrun)
(global-set-key (kbd "<f5>") 'quickrun)

;; flymake
;(require 'flymake)
;(set-face-background 'flymake-errline "#E74C3C")
;(set-face-foreground 'flymake-errline "white")




;; キー設定ファイルのロード
(load "my-keyset-light")

;; C-cキーをコピーに
(keyboard-translate ?\C-c ?\M-w)
;; C-hを削除に
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; 共通
;; ================================================================


;; 左端(文字の前)ではインデント、それ以外はタブの挿入
(setq tab-always-indent nil)
(setq c-tab-always-indent nil)

;; 空白を一度に削除
(if (fboundp 'global-hungry-delete-mode)
    (global-hungry-delete-mode 1))

;; 改行時などに自動でインデント
;;   (C-j と C-m の入れ替え)
(if (fboundp 'electric-indent-mode)
    (electric-indent-mode 0))

;; 特定の文字を入力すると自動で改行、インデント
;; (electric-layout-mode 1)






(defun my-c-c++-mode-init ()
  (require 'google-c-style)
  (google-set-c-style)
  (google-make-newline-indent)
)

(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

;(put 'dired-find-alternate-file 'disabled nil)
