;;
;; キーの設定
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 基本的なコマンド
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; あまり使ってないキーの割り当て

;; (global-set-key "\C-o" 'dabbrev-expand)

(global-set-key "\C-z" 'undo)
(global-set-key "\C-y" 'redo)

;; (global-set-key "\C-x" 'kill-region)
;; (global-set-key "\C-c" 'kill-ring-save)
(global-set-key "\C-v" 'yank)

(global-set-key "\C-t" 'isearch-forward)
(global-set-key "\C-r" 'isearch-backward)
(global-set-key "\C-s" 'save-buffer)

(global-set-key "\C-x\M-w" 'save-buffers-kill-terminal)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ファンクション(F)キー
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; F5  quickrun
;; F6  サイドバーにディレクトリの階層表示
;; F7  コンパイル
;; F8  eshell

(global-set-key (kbd "<f7>") 'compile)
(global-set-key (kbd "<f8>") 'eshell)


