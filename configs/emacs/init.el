;; -*- lexical-binding: t; -*-

;; package management
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; evil mode
(use-package evil
	     :init
	     (setq evil-want-integration t)
	     (setq evil-want-keybinding nil)
	     :config
	     (evil-mode 1))

(use-package evil-collection
	     :after evil
	     :config
	     (evil-collection-init))

;; terminal
(use-package vterm
  :commands vterm)
(setq vterm-buffer-name-string "vterm: %s")

;; startup buffer
(setq initial-scratch-message nil)
(setq initial-buffer-choice #'my/vterm-new)

;; theme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; visual elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(fringe-mode 0)

;; which key
(use-package which-key
  :config
  (which-key-mode))

;; UI Completion
(use-package vertico
  :init (vertico-mode))
(use-package consult)

;; UI Hide
(use-package consult
  :config
  (setq consult-buffer-filter
	(append consult-buffer-filter
		'("\\`\\*scratch\\*\\'"
		  "\\`\\*Messages\\*\\'"
		  "\\`\\*Async-native-compile-log\\*\\'"))))

(setq switch-to-prev-buffer-skip-regexp
      "\\`\\*\\(scratch\\|Messages\\|Async-native-compile-log\\)\\*\\'")

;; functions
(defun my/vterm-new ()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively 'vterm)))

(defun my/vterm-split-right ()
  (interactive)
  (select-window (split-window-right))
  (my/vterm-new))

(defun my/vterm-split-below ()
  (interactive)
  (select-window (split-window-below))
  (my/vterm-new))

;; keybinding
(use-package general
  :config
  (general-create-definer my-leader-def
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (my-leader-def
    ;; files
    "f" '(:ignore t :which-key "files")
    "f f" 'find-file
    "f s" 'save-buffer

    ;; buffers
    "b" '(:ignore t :which-key "buffers")
    "b b" 'consult-buffer
    "b k" 'kill-buffer
    "b c" 'kill-current-buffer
    "b d" 'kill-buffer-and-window
    "b n" 'next-buffer
    "b p" 'previous-buffer
    "b r" 'rename-buffer

    ;; open
    "o" '(:ignore t :which-key "open")
    "o t" 'vterm
    "o n" 'my/vterm-new
    "o v" 'my/vterm-split-right
    "o h" 'my/vterm-split-below

    ;; windows
    "w" '(:ignore t :which-key "windows")
    "w v" 'split-window-right
    "w s" 'split-window-below
    "w c" 'evil-window-delete
    "w h" 'evil-window-left
    "w j" 'evil-window-down
    "w k" 'evil-window-up
    "w l" 'evil-window-right))
