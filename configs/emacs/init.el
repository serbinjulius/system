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

;; dired
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    " " nil))

;; tramp
(with-eval-after-load 'tramp
  (tramp-set-completion-function
   "ssh"
   '((tramp-parse-sconfig "~/.ssh/config")
     (tramp-parse-sconfig "~/.ssh/config.local"))))

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
  "open a new instance of vterm"
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively 'vterm)))

(defun my/vterm-split-right ()
  "open a new instance of vterm and split it to the right"
  (interactive)
  (select-window (split-window-right))
  (my/vterm-new))

(defun my/vterm-split-below ()
  "open a new instance of vterm and split it below"
  (interactive)
  (select-window (split-window-below))
  (my/vterm-new))

(defun my/kill-buffer ()
  "kill-buffer with filtered buffers"
  (interactive)
  (let* ((hidden '("*scratch*" "*Messages*" "*Async-native-compile-log*"))
	 (names (seq-remove
		 (lambda (n) (or (member n hidden)
				 (string-prefix-p " " n)))
		 (mapcar #'buffer-name (buffer-list)))))
    (kill-buffer (completing-read "Kill buffer: " names nil t))))

(defun my/vterm-cwd ()
  "get the directory of current vterm buffer"
  (let ((proc (get-buffer-process (current-buffer))))
    (when proc
      (file-name-as-directory
       (file-truename (format "/proc/%d/cwd" (process-id proc)))))))

(defun my/find-file-here ()
  "find-file with current directory"
  (interactive)
  (let ((default-directory
	 (or (and (derived-mode-p 'vterm-mode) (my/vterm-cwd))
	     default-directory)))
	(call-interactively 'find-file)))


;; keybinding
(use-package general
  :config
  (general-create-definer my-leader-def
    :keymaps 'override
    :states '(normal visual motion insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (my-leader-def
    ;; files
    "f" '(:ignore t :which-key "files")
    "f f" 'my/find-file-here
    "f s" 'save-buffer

    ;; buffers
    "b" '(:ignore t :which-key "buffers")
    "b b" 'consult-buffer
    "b k" 'my/kill-buffer
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
