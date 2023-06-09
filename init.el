;;  _       _ _         _ 
;; (_)     (_) |       | |
;;  _ _ __  _| |_   ___| |
;; | | '_ \| | __| / _ \ |
;; | | | | | | |_ |  __/ |
;; |_|_| |_|_|\__(_)___|_| by @dpv927
;;
;; En este archivo se definen diferentes configuraciones, tanto para el frame de Emacs
;; como para la edicion de archivos y demas. Como indica el nombre del archivo, este se
;; carga al inicio de Emacs, aplicando e inicializando ciertas propiedades.
;;
;; Algunas de las configuraciones estan pensadas para el tema de color que utilizo, que
;; es el por defecto de Emacs (light), por lo tanto si quieres cambiar a un tema oscuro,
;; procura cambiar ciertos valores a continuacion.
;;
;; Este archivo no esta sujeto a ninguna licencia, ya que a mi parecer las configuraciones
;; personales sirven como esquema para otras personas, y por lo tanto, de libre uso.
;;

;; Anadir Melpa y otros repositorios
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Cambiar el color de fondo
(set-background-color "#f5f5f5")

;; Habilitar el número de línea
(global-linum-mode t)

;; Deshabilitar el toolbar
(tool-bar-mode -1)

;; Deshabilitar el menu
(menu-bar-mode -1)

;; Quitar la barra de scroll
(scroll-bar-mode -1)

;; Darle highlight a la linea actual
(global-hl-line-mode 1)
(set-face-background 'hl-line "#f3f2f2")

;; Borrar seleccion
(delete-selection-mode 1)

;; Mostrar parentesis coincidentes
(show-paren-mode 1)

;; Habilitar page-break-lines
(page-break-lines-mode)

;; Configuración para Markdown
(defun my-markdown-mode-hook ()
  (auto-fill-mode t))
(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)

;; Configuración para org-mode
(defun my-org-mode-hook ()
  (org-toggle-inline-images))
(add-hook 'org-mode-hook 'my-org-mode-hook)

;; Establecer la fuente predeterminada
(set-frame-font "Consolas 10")

;; Una tabulacion -> 4 espacios
(setq-default tab-width 4)

;; Desactivar mensaje de inicio
(setq inhibit-startup-message t)

;; Habilitar all the icons
(use-package all-the-icons
  :ensure t)

;; Habilitar dashboard personalizada. La configuracion siguiente es para el
;; paquete https://github.com/emacs-dashboard/emacs-dashboard.
(use-package dashboard
  :ensure t
  :init
  ;(setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "This is Emacs 0.052 nanoseconds without the Zaza!")
  (setq dashboard-startup-banner "~/.emacs.d/icons/emacs.png")
  (setq dashboard-image-banner-max-height 256)
  (setq dashboard-image-banner-max-width 256)
  (setq dashboard-center-content nil)
  (setq dashboard-items '((recents  . 5) (projects . 5) (bookmarks . 5)))
  
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text") (bookmarks . "book"))))
(setq initial-buffer-choice 'dashboard-open)

;; Habilitar y dar propiedades a doom modeline
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  (setq doom-modeline-height 40)
  (setq doom-modeline-bar-width 10)
  (setq doom-modeline-icon t)
  (setq doom-modeline-persp-name t)
  (setq doom-modeline-persp-icon t))

;; Activar Beacon
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

;; Org bullets para los titulos en archivos .org
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("◉" "○" "✸" "✿" "◆" "▲" "■"))

;; Customizar faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-bar ((t (:background "#e5e5e5" :inherit mode-line))))
 '(font-lock-comment-face ((t (:slant italic :foreground "#b22222"))))
 '(font-lock-keyword-face ((t (:slant italic :foreground "#a020f0"))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :familly "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.2))))
 '(mode-line ((t (:background "#e5e5e5" :foreground "#000000"))))
 '(org-level-1 ((t (:height 1.3 :weight bold :foreground "purple"))))
 '(org-level-2 ((t (:height 1.2 :weight bold :foreground "blue"))))
 '(org-level-3 ((t (:height 1.1 :weight bold :foreground "brown"))))
 '(org-level-4 ((t (:height 1.0 :foreground "#483d8b"))))
 '(org-level-5 ((t (:height 1.0 :foreground "#483d8b"))))
 '(org-level-6 ((t (:height 1.0 :foreground "#483d8b"))))
 '(org-level-7 ((t (:height 1.0 :foreground "#483d8b"))))
 '(org-level-8 ((t (:height 1.0 :foreground "#483d8b")))))
