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

(use-package general
  :config
  (general-create-definer my-leader-def
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (my-leader-def
    "f" '(:ignore t :which-key "files")
    "f f" 'find-file
    "f s" 'save-buffer))
