;;; packages.el --- xtof-web Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq xtof-web-packages
      '(
        js2-mode 
        skewer-mode
        livid-mode
        ))

;; List of packages to exclude.
(setq xtof-web-excluded-packages '())

;; For each package, define a function xtof-web/init-<package-name>

(defun xtof-web/init-skewer-mode ()
  "Initialize my package"
  (use-package skewer-mode
    :ensure t
    :defer t 
    :init
    (progn
      (add-hook 'js2-mode-hook 'skewer-mode)
      (add-hook 'css-mode-hook 'skewer-css-mode)
      (add-hook 'html-mode-hook 'skewer-html-mode)
      (httpd-start)
      (setq js2-highlight-level 3)
      (setq js2-indent-switch-body t)
      (setq js2-basic-offset 2)
      ;;(setq js2-mode-indent-inhibit-undo nil)
      ;; (add-hook 'js2-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
      (add-hook 'js2-mode-hook 'js2-mode-hide-warnings-and-errors)
      )
    :config
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ss" 'run-skewer)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "si" 'skewer-repl)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "sb" 'skewer-load-buffer)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ee" 'skewer-eval-last-expression)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ep" 'skewer-eval-print-last-expression)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "sf" 'skewer-eval-defun)
      )))

(defun xtof-web/init-livid-mode ()
  (use-package livid-mode
    :defer t
    :init
    (progn
      (defalias 'js-live-eval 'livid-mode "Minor mode for automatic evaluation of a JavaScript buffer on every change")
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "st" 'js-live-eval))))

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
