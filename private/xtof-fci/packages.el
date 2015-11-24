;;; packages.el --- xtof-fci Layer packages File for Spacemacs
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
(setq xtof-fci-packages
      '(
        ;; package names go here
        fill-column-indicator
        ))

;; List of packages to exclude.
(setq xtof-fci-excluded-packages '())

;; For each package, define a function xtof-fci/init-<package-name>
;;
;; (defun xtof-fci/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
(defun xtof-fci/post-init-fill-column-indicator ()
  (setq-default fill-column 80)
  (setq fci-rule-column 80)
  (setq fci-rule-width 1)
  (setq fci-rule-use-dashes t)
  (setq fci-dash-pattern 0.25)
  (setq fci-rule-color "DeepSkyBlue4")
  ;;(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  ;;(global-fci-mode 1)
  (add-hook 'js2-mode-hook 'turn-on-fci-mode)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-fci-mode)
  ;;(add-hook 'Custom-mode-hook (lambda () (turn-off-fci-mode)))
  )
