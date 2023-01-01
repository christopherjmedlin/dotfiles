;; -*- mode: elisp -*-

;; disable splash screen
(setq inhibit-splash-screen t)

(transient-mark-mode 1)

;; Org mode
;;(require 'org)
(add-to-list 'auto-mode-alist '("//.org$" . org-mode))
;;(setq org-highlight-latex-and-related '(latex script entities))
;;(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))

(setq org-roam-directory (file-truename "~/notes"))
(org-roam-db-autosync-mode)
;; RETURN will follow links in org-mode files
(setq org-return-follows-link  t)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq default-input-method "TeX")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(git yaml-mode haskell-mode org-roam org cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
