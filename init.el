;; package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
			 '("marmalade" . "http://marmalade-repo.org/packages/") t)
(setq package-enable-at-startup nil)
(package-initialize)


;; theme
(load-file "~/.emacs.d/package/theme/railscasts-theme.el")



(setq default-directory "~/")
(setq column-number-mode t)
(setq current-language-environment "UTF-8")
(setq default-input-method "korean-hangul390")
(setq fill-column 100)
(setq default-tab-width 4)

;; key bindings
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(setq mac-pass-command-to-system nil)
(setq mac-pass-control-to-system nil)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "S-SPC") 'toggle-input-method)
(define-key global-map (kbd "C-x m") 'eshell)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; 튜토리얼 메시지 없애기
(setq inhibit-startup-message t)
;; 커서 라인 표시하기
(global-hl-line-mode 1)
;; 화면 왼쪽에 라인넘버 표시
(global-linum-mode t)
;; 선택 영역 표시
(transient-mark-mode t)
;; cua mode 활성화
(cua-mode t)
;; CUA 모드에서 복사명령 후에도 선택영역 남기기
(setq cua-keep-region-after-copy t)
;; CUA 모드에서, 영역을 선택한 상태인 경우
;; C-x 또는 C-c 가 입력되면
;; 다음 명령을 기다릴지 잘라내기 또는 복사하기로 작동할지 결정하는 딜레이
(defvar cua-prefix-override-inhibit-delay 0.001)
;; tab 을 기본 indent 로 지정할지를 설정
;;(setq-default indent-tabs-mode t)
;; tab size: 2
(setq tab-width 4)
(setq js-indent-level 4)
;; json 파일에도 js mode 적용
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
;; 버퍼 및 파일 삭제
(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)

;; js syntax
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)

;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;;; ace window
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq aw-background nil)
