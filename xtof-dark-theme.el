;;; xtof-dark-theme.el --- Color theme for Emacs, when soothe and gruvbox collide

;; Copyright (c) 2015 Jasonm23 (GPL)

;; Authors: Jasonm23 <jasonm23@gmail.com>
;; URL: http://github.com/emacsfodder/emacs-theme-xtof-dark
;; Package-Version: 20151121.1722
;; Version: 0.1.37

;;; Commentary:
;;  Color theme for Emacs, when soothe and gruvbox collide.

;;; Code:

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))

(deftheme xtof-dark "Color theme for Emacs, when soothe and gruvbox collide")

(let (
      (xtof-dark-dark0_hard      (if (display-graphic-p) "#1D2021" "color-234"))
      (xtof-dark-dark0           (if (display-graphic-p) "#282828" "color-235"))
      (xtof-dark-dark0_soft      (if (display-graphic-p) "#32302F" "color-236"))
      (xtof-dark-dark1           (if (display-graphic-p) "#3C3836" "color-237"))
      (xtof-dark-dark2           (if (display-graphic-p) "#504945" "color-239"))
      (xtof-dark-dark3           (if (display-graphic-p) "#665C54" "color-241"))
      (xtof-dark-dark4           (if (display-graphic-p) "#7C6F64" "color-243"))

      (xtof-dark-medium          (if (display-graphic-p) "#928374" "color-245")) ;; or 244

      (xtof-dark-light0_hard     (if (display-graphic-p) "#FFFFC8" "color-230"))
      (xtof-dark-light0          (if (display-graphic-p) "#FDF4C1" "color-229"))
      (xtof-dark-light0_soft     (if (display-graphic-p) "#F4E8BA" "color-228"))
      (xtof-dark-light1          (if (display-graphic-p) "#EBDBB2" "color-223"))
      (xtof-dark-light2          (if (display-graphic-p) "#D5C4A1" "color-250"))
      (xtof-dark-light3          (if (display-graphic-p) "#BDAE93" "color-248"))
      (xtof-dark-light4          (if (display-graphic-p) "#A89984" "color-246"))

      (xtof-dark-bright_red      (if (display-graphic-p) "#FB4933" "color-167"))
      (xtof-dark-bright_green    (if (display-graphic-p) "#B8BB26" "color-142"))
      (xtof-dark-bright_yellow   (if (display-graphic-p) "#FABD2F" "color-214"))
      (xtof-dark-bright_blue     (if (display-graphic-p) "#83A598" "color-109"))
      (xtof-dark-bright_purple   (if (display-graphic-p) "#D3869B" "color-175"))
      (xtof-dark-bright_aqua     (if (display-graphic-p) "#8EC07C" "color-108"))
      (xtof-dark-bright_orange   (if (display-graphic-p) "#FE8019" "color-208"))

      ;; neutral, no 256-color code, requested, nice work-around meanwhile
      (xtof-dark-neutral_red     (if (display-graphic-p) "#FB4934" "#D75F5F"))
      (xtof-dark-neutral_green   (if (display-graphic-p) "#B8BB26" "#AFAF00"))
      (xtof-dark-neutral_yellow  (if (display-graphic-p) "#FABD2F" "#FFAF00"))
      (xtof-dark-neutral_blue    (if (display-graphic-p) "#83A598" "#87AFAF"))
      (xtof-dark-neutral_purple  (if (display-graphic-p) "#D3869B" "#D787AF"))
      (xtof-dark-neutral_aqua    (if (display-graphic-p) "#8EC07C" "#87AF87"))
      (xtof-dark-neutral_orange  (if (display-graphic-p) "#FE8019" "#FF8700"))

      (xtof-dark-faded_red       (if (display-graphic-p) "#9D0006" "color-88"))
      (xtof-dark-faded_green     (if (display-graphic-p) "#79740E" "color-100"))
      (xtof-dark-faded_yellow    (if (display-graphic-p) "#B57614" "color-136"))
      (xtof-dark-faded_blue      (if (display-graphic-p) "#076678" "color-24"))
      (xtof-dark-faded_purple    (if (display-graphic-p) "#8F3F71" "color-96"))
      (xtof-dark-faded_aqua      (if (display-graphic-p) "#427B58" "color-66"))
      (xtof-dark-faded_orange    (if (display-graphic-p) "#AF3A03" "color-130"))

      (xtof-dark-dark_red       (if (display-graphic-p)  "#421E1E" "color-52"))
      (xtof-dark-dark_green     (if (display-graphic-p)  "#2B280F" "color-22"))
      (xtof-dark-dark_yellow    (if (display-graphic-p)  "#4D3B27" "color-3"))
      (xtof-dark-dark_blue      (if (display-graphic-p)  "#2B3C44" "color-4"))
      (xtof-dark-dark_purple    (if (display-graphic-p)  "#4E3D45" "color-57"))
      (xtof-dark-dark_aqua      (if (display-graphic-p)  "#36473A" "color-23"))
      (xtof-dark-dark_orange    (if (display-graphic-p)  "#613620" "color-130"))

      (xtof-dark-mid_red       (if (display-graphic-p)  "#3F1B1B" "color-52"))
      (xtof-dark-mid_green     (if (display-graphic-p)  "#27321C" "color-22"))
      (xtof-dark-mid_yellow    (if (display-graphic-p)  "#4C3A25" "color-3"))
      (xtof-dark-mid_blue      (if (display-graphic-p)  "#30434C" "color-4"))
      (xtof-dark-mid_purple    (if (display-graphic-p)  "#4C3B43" "color-57"))
      (xtof-dark-mid_aqua      (if (display-graphic-p)  "#394C3D" "color-23"))
      (xtof-dark-mid_orange    (if (display-graphic-p)  "#603000" "color-130"))

      (xtof-dark-delimiter-one   (if (display-graphic-p) "#5C7E81" "color-66"))
      (xtof-dark-delimiter-two   (if (display-graphic-p) "#837486" "color-102"))
      (xtof-dark-delimiter-three (if (display-graphic-p) "#9C6F68" "color-94"))
      (xtof-dark-delimiter-four  (if (display-graphic-p) "#7B665C" "color-137"))

      ;; 24 bit has tints from light0 and terminal cycles through
      ;; the 4 xtof-dark-delimiter colors
      (xtof-dark-identifiers-1   (if (display-graphic-p) "#E5D5C5" "color-66"))
      (xtof-dark-identifiers-2   (if (display-graphic-p) "#DFE5C5" "color-102"))
      (xtof-dark-identifiers-3   (if (display-graphic-p) "#D5E5C5" "color-94"))
      (xtof-dark-identifiers-4   (if (display-graphic-p) "#CAE5C5" "color-137"))
      (xtof-dark-identifiers-5   (if (display-graphic-p) "#C5E5CA" "color-66"))
      (xtof-dark-identifiers-6   (if (display-graphic-p) "#C5E5D5" "color-102"))
      (xtof-dark-identifiers-7   (if (display-graphic-p) "#C5E5DF" "color-94"))
      (xtof-dark-identifiers-8   (if (display-graphic-p) "#C5DFE5" "color-137"))
      (xtof-dark-identifiers-9   (if (display-graphic-p) "#C5D5E5" "color-66"))
      (xtof-dark-identifiers-10  (if (display-graphic-p) "#C5CAE5" "color-102"))
      (xtof-dark-identifiers-11  (if (display-graphic-p) "#CAC5E5" "color-94"))
      (xtof-dark-identifiers-12  (if (display-graphic-p) "#D5C5E5" "color-137"))
      (xtof-dark-identifiers-13  (if (display-graphic-p) "#DFC5E5" "color-66"))
      (xtof-dark-identifiers-14  (if (display-graphic-p) "#E5C5DF" "color-102"))
      (xtof-dark-identifiers-15  (if (display-graphic-p) "#E5C5D5" "color-94"))

      (xtof-dark-white           (if (display-graphic-p) "#FFFFFF" "white"))
      (xtof-dark-black           (if (display-graphic-p) "#000000" "black"))
      (xtof-dark-sienna          (if (display-graphic-p) "#DD6F48" "sienna"))
      (xtof-dark-darkslategray4  (if (display-graphic-p) "#528B8B" "DarkSlateGray4"))
      (xtof-dark-lightblue4      (if (display-graphic-p) "#66999D" "LightBlue4"))
      (xtof-dark-burlywood4      (if (display-graphic-p) "#BBAA97" "burlywood4"))
      (xtof-dark-aquamarine4     (if (display-graphic-p) "#83A598" "aquamarine4"))
      (xtof-dark-turquoise4      (if (display-graphic-p) "#61ACBB" "turquoise4"))
      )

  (custom-theme-set-faces
   'xtof-dark

   ;; UI
   ;; `(default                                ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-dark0))))
   `(default                                   ((t (:foreground "#FDF4C1" :background "#282828" :family "Source Code Pro" :foundry "adobe" :slant normal :weight normal :height 83 :width normal))))
   `(cursor                                    ((t (:background ,xtof-dark-light0))))
   `(link                                      ((t (:foreground ,xtof-dark-bright_blue :underline t))))
   `(link-visited                              ((t (:foreground ,xtof-dark-bright_blue :underline nil))))

   `(mode-line                                 ((t (:foreground ,xtof-dark-light1 :background ,xtof-dark-dark0_hard :box nil))))
   `(mode-line-inactive                        ((t (:foreground ,xtof-dark-light4 :background ,xtof-dark-dark2 :box nil))))
   `(fringe                                    ((t (:background ,xtof-dark-dark0))))
   `(linum                                     ((t (:foreground ,xtof-dark-dark4))))
   `(hl-line                                   ((t (:background ,xtof-dark-dark_blue))))
   ;;`(region                                    ((t (:background ,xtof-dark-mid_blue :distant-foreground ,xtof-dark-light0))))
   `(region                                    ((t (:background "#300000" :distant-foreground "#FDF4C1"))))
   `(secondary-selection                       ((t (:background ,xtof-dark-dark_blue))))
   `(cua-rectangle                             ((t (:background ,xtof-dark-mid_blue))))
   `(header-line                               ((t (:foreground ,xtof-dark-turquoise4 :background ,xtof-dark-dark0 :bold nil))))
   `(minibuffer-prompt                         ((t (:foreground ,xtof-dark-turquoise4 :background ,xtof-dark-dark0 :bold nil))))

   ;; Built-in syntax
   `(font-lock-builtin-face                    ((t (:foreground ,xtof-dark-bright_orange))))
   `(font-lock-constant-face                   ((t (:foreground ,xtof-dark-burlywood4))))
   `(font-lock-comment-face                    ((t (:foreground ,xtof-dark-dark4))))
   `(font-lock-function-name-face              ((t (:foreground ,xtof-dark-light4))))
   `(font-lock-keyword-face                    ((t (:foreground ,xtof-dark-sienna))))
   `(font-lock-string-face                     ((t (:foreground ,xtof-dark-darkslategray4))))
   `(font-lock-variable-name-face              ((t (:foreground ,xtof-dark-aquamarine4))))
   `(font-lock-type-face                       ((t (:foreground ,xtof-dark-lightblue4))))
   `(font-lock-warning-face                    ((t (:foreground ,xtof-dark-neutral_red :bold t))))

   ;; whitespace-mode
   `(whitespace-space                          ((t (:foreground ,xtof-dark-dark4 :background ,xtof-dark-dark0))))
   `(whitespace-hspace                         ((t (:foreground ,xtof-dark-dark4 :background ,xtof-dark-dark0))))
   `(whitespace-tab                            ((t (:foreground ,xtof-dark-dark4 :background ,xtof-dark-dark0))))
   `(whitespace-newline                        ((t (:foreground ,xtof-dark-dark4 :background ,xtof-dark-dark0))))
   `(whitespace-trailing                       ((t (:foreground ,xtof-dark-neutral_red :background ,xtof-dark-dark1))))
   `(whitespace-line                           ((t (:foreground ,xtof-dark-neutral_red :background ,xtof-dark-dark1))))
   `(whitespace-space-before-tab               ((t (:foreground ,xtof-dark-dark4 :background ,xtof-dark-dark0))))
   `(whitespace-indentation                    ((t (:foreground ,xtof-dark-dark4 :background ,xtof-dark-dark0))))
   `(whitespace-empty                          ((t (:foreground nil :background nil))))
   `(whitespace-space-after-tab                ((t (:foreground ,xtof-dark-dark4 :background ,xtof-dark-dark0))))

   ;; RainbowDelimiters
   `(rainbow-delimiters-depth-1-face           ((t (:foreground ,xtof-dark-delimiter-one))))
   `(rainbow-delimiters-depth-2-face           ((t (:foreground ,xtof-dark-delimiter-two))))
   `(rainbow-delimiters-depth-3-face           ((t (:foreground ,xtof-dark-delimiter-three))))
   `(rainbow-delimiters-depth-4-face           ((t (:foreground ,xtof-dark-delimiter-four))))
   `(rainbow-delimiters-depth-5-face           ((t (:foreground ,xtof-dark-delimiter-one))))
   `(rainbow-delimiters-depth-6-face           ((t (:foreground ,xtof-dark-delimiter-two))))
   `(rainbow-delimiters-depth-7-face           ((t (:foreground ,xtof-dark-delimiter-three))))
   `(rainbow-delimiters-depth-8-face           ((t (:foreground ,xtof-dark-delimiter-four))))
   `(rainbow-delimiters-depth-9-face           ((t (:foreground ,xtof-dark-delimiter-one))))
   `(rainbow-delimiters-depth-10-face          ((t (:foreground ,xtof-dark-delimiter-two))))
   `(rainbow-delimiters-depth-11-face          ((t (:foreground ,xtof-dark-delimiter-three))))
   `(rainbow-delimiters-depth-12-face          ((t (:foreground ,xtof-dark-delimiter-four))))
   `(rainbow-delimiters-unmatched-face         ((t (:foreground ,xtof-dark-light0 :background nil))))

   ;; RainbowIdentifiers
   `(rainbow-identifiers-identifier-1          ((t (:foreground ,xtof-dark-identifiers-1))))
   `(rainbow-identifiers-identifier-2          ((t (:foreground ,xtof-dark-identifiers-2))))
   `(rainbow-identifiers-identifier-3          ((t (:foreground ,xtof-dark-identifiers-3))))
   `(rainbow-identifiers-identifier-4          ((t (:foreground ,xtof-dark-identifiers-4))))
   `(rainbow-identifiers-identifier-5          ((t (:foreground ,xtof-dark-identifiers-5))))
   `(rainbow-identifiers-identifier-6          ((t (:foreground ,xtof-dark-identifiers-6))))
   `(rainbow-identifiers-identifier-7          ((t (:foreground ,xtof-dark-identifiers-7))))
   `(rainbow-identifiers-identifier-8          ((t (:foreground ,xtof-dark-identifiers-8))))
   `(rainbow-identifiers-identifier-9          ((t (:foreground ,xtof-dark-identifiers-9))))
   `(rainbow-identifiers-identifier-10         ((t (:foreground ,xtof-dark-identifiers-10))))
   `(rainbow-identifiers-identifier-11         ((t (:foreground ,xtof-dark-identifiers-11))))
   `(rainbow-identifiers-identifier-12         ((t (:foreground ,xtof-dark-identifiers-12))))
   `(rainbow-identifiers-identifier-13         ((t (:foreground ,xtof-dark-identifiers-13))))
   `(rainbow-identifiers-identifier-14         ((t (:foreground ,xtof-dark-identifiers-14))))
   `(rainbow-identifiers-identifier-15         ((t (:foreground ,xtof-dark-identifiers-15))))

   ;; ido
   `(ido-first-match                           ((t (:foreground ,xtof-dark-turquoise4 :background ,xtof-dark-dark0_hard))))
   `(ido-only-match                            ((t (:foreground ,xtof-dark-darkslategray4))))

   ;; linum-relative
   `(linum-relative-current-face               ((t (:foreground ,xtof-dark-light4 :background ,xtof-dark-dark1))))

   ;; Highlight indentation mode
   `(highlight-indentation-current-column-face ((t (:background ,xtof-dark-dark4))))
   `(highlight-indentation-face                ((t (:background ,xtof-dark-dark1))))

   ;; highlight-numbers
   `(highlight-numbers-number                  ((t (:foreground ,xtof-dark-bright_purple :bold nil))))

   ;; highlight-symbol
   `(highlight-symbol-face                     ((t (:foreground ,xtof-dark-neutral_purple))))

   ;; Smartparens
   `(sp-pair-overlay-face                      ((t (:background ,xtof-dark-dark2))))
   ;;`(sp-wrap-overlay-face                    ((t (:inherit sp-wrap-overlay-face))))
   ;;`(sp-wrap-tag-overlay-face                ((t (:inherit sp-wrap-overlay-face))))
   `(sp-show-pair-match-face                   ((t (:background ,xtof-dark-dark2)))) ;; Pair tags highlight
   `(sp-show-pair-mismatch-face                ((t (:background ,xtof-dark-neutral_red)))) ;; Highlight for bracket without pair

   ;; elscreen
   `(elscreen-tab-background-face              ((t (:background ,xtof-dark-dark0 :box nil)))) ;; Tab bar, not the tabs
   `(elscreen-tab-control-face                 ((t (:foreground ,xtof-dark-neutral_red :background ,xtof-dark-dark2 :box nil :underline nil)))) ;; The controls
   `(elscreen-tab-current-screen-face          ((t (:foreground ,xtof-dark-dark0 :background ,xtof-dark-dark4 :box nil)))) ;; Current tab
   `(elscreen-tab-other-screen-face            ((t (:foreground ,xtof-dark-light4 :background ,xtof-dark-dark2 :box nil :underline nil)))) ;; Inactive tab

   ;; ag (The Silver Searcher)
   `(ag-hit-face                               ((t (:foreground ,xtof-dark-neutral_blue))))
   `(ag-match-face                             ((t (:foreground ,xtof-dark-neutral_red))))

   ;; Diffs
   `(diff-changed                              ((t (:foreground ,xtof-dark-light1 :background nil))))
   `(diff-added                                ((t (:foreground ,xtof-dark-neutral_green :background nil))))
   `(diff-removed                              ((t (:foreground ,xtof-dark-neutral_red :background nil))))
   `(diff-indicator-changed                    ((t (:inherit diff-changed))))
   `(diff-indicator-added                      ((t (:inherit diff-added))))
   `(diff-indicator-removed                    ((t (:inherit diff-removed))))

   ;; Diff-hl
   `(diff-hl-change                            ((t (:inherit diff-changed))))
   `(diff-hl-delete                            ((t (:inherit diff-removed))))
   `(diff-hl-insert                            ((t (:inherit diff-added))))
   `(diff-hl-unknown                           ((t (:foreground ,xtof-dark-dark_aqua))))

   `(js2-warning                               ((t (:underline (:color ,xtof-dark-bright_yellow :style wave)))))
   `(js2-error                                 ((t (:underline (:color ,xtof-dark-bright_red :style wave)))))
   `(js2-external-variable                     ((t (:underline (:color ,xtof-dark-bright_aqua :style wave)))))
   `(js2-jsdoc-tag                             ((t (:foreground ,xtof-dark-medium :background nil))))
   `(js2-jsdoc-type                            ((t (:foreground ,xtof-dark-light4 :background nil))))
   `(js2-jsdoc-value                           ((t (:foreground ,xtof-dark-light3 :background nil))))
   `(js2-function-param                        ((t (:foreground ,xtof-dark-bright_aqua :background nil))))
   ;; `(js2-function-call                         ((t (:foreground ,xtof-dark-bright_blue :background nil))))
   `(js2-function-call ((t (:inherit default :foreground "DarkSeaGreen4"))))
   `(js2-instance-member                       ((t (:foreground ,xtof-dark-bright_orange :background nil))))
   `(js2-private-member                        ((t (:foreground ,xtof-dark-faded_yellow :background nil))))
   `(js2-private-function-call                 ((t (:foreground ,xtof-dark-faded_aqua :background nil))))
   `(js2-jsdoc-html-tag-name                   ((t (:foreground ,xtof-dark-light4 :background nil))))
   `(js2-jsdoc-html-tag-delimiter              ((t (:foreground ,xtof-dark-light3 :background nil))))

   ;; Haskell
   `(haskell-interactive-face-compile-warning  ((t (:underline (:color ,xtof-dark-bright_yellow :style wave)))))
   `(haskell-interactive-face-compile-error    ((t (:underline (:color ,xtof-dark-bright_red :style wave)))))
   `(haskell-interactive-face-garbage          ((t (:foreground ,xtof-dark-dark4 :background nil))))
   `(haskell-interactive-face-prompt           ((t (:foreground ,xtof-dark-light0 :background nil))))
   `(haskell-interactive-face-result           ((t (:foreground ,xtof-dark-light3 :background nil))))
   `(haskell-literate-comment-face             ((t (:foreground ,xtof-dark-light0 :background nil))))
   `(haskell-pragma-face                       ((t (:foreground ,xtof-dark-medium :background nil))))
   `(haskell-constructor-face                  ((t (:foreground ,xtof-dark-neutral_aqua :background nil))))

   ;; org-mode
   `(org-agenda-date-today                     ((t (:foreground ,xtof-dark-light2 :slant italic :weight bold))) t)
   `(org-agenda-structure                      ((t (:inherit font-lock-comment-face))))
   `(org-archived                              ((t (:foreground ,xtof-dark-light0 :weight bold))))
   `(org-checkbox                              ((t (:foreground ,xtof-dark-light2 :background ,xtof-dark-dark0 :box (:line-width 1 :style released-button)))))
   `(org-date                                  ((t (:foreground ,xtof-dark-faded_blue :underline t))))
   `(org-deadline-announce                     ((t (:foreground ,xtof-dark-faded_red))))
   ;; `(org-done                                  ((t (:foreground ,xtof-dark-bright_green :bold t :weight bold))))
   `(org-done ((t (:foreground "#B8BB26" :bold t :weight bold))))
   `(org-formula                               ((t (:foreground ,xtof-dark-bright_yellow))))
   `(org-headline-done                         ((t (:foreground ,xtof-dark-bright_green))))
   `(org-hide                                  ((t (:foreground ,xtof-dark-dark0))))
   `(org-level-1                               ((t (:foreground ,xtof-dark-bright_orange))))
   `(org-level-2                               ((t (:foreground ,xtof-dark-bright_green))))
   `(org-level-3                               ((t (:foreground ,xtof-dark-bright_blue))))
   `(org-level-4                               ((t (:foreground ,xtof-dark-bright_yellow))))
   `(org-level-5                               ((t (:foreground ,xtof-dark-faded_aqua))))
   `(org-level-6                               ((t (:foreground ,xtof-dark-bright_green))))
   `(org-level-7                               ((t (:foreground ,xtof-dark-bright_red))))
   `(org-level-8                               ((t (:foreground ,xtof-dark-bright_blue))))
   `(org-link                                  ((t (:foreground ,xtof-dark-bright_yellow :underline t))))
   `(org-scheduled                             ((t (:foreground ,xtof-dark-bright_green))))
   `(org-scheduled-previously                  ((t (:foreground ,xtof-dark-bright_red))))
   `(org-scheduled-today                       ((t (:foreground ,xtof-dark-bright_blue))))
   `(org-sexp-date                             ((t (:foreground ,xtof-dark-bright_blue :underline t))))
   `(org-special-keyword                       ((t (:inherit font-lock-comment-face))))
   `(org-table                                 ((t (:foreground ,xtof-dark-bright_green))))
   `(org-tag                                   ((t (:bold t :weight bold))))
   `(org-time-grid                             ((t (:foreground ,xtof-dark-bright_orange))))
   `(org-todo                                  ((t (:foreground ,xtof-dark-bright_red :weight bold :bold t))))
   `(org-upcoming-deadline                     ((t (:inherit font-lock-keyword-face))))
   `(org-warning                               ((t (:foreground ,xtof-dark-bright_red :weight bold :underline nil :bold t))))
   `(org-column                                ((t (:background ,xtof-dark-dark0))))
   `(org-column-title                          ((t (:background ,xtof-dark-dark0_hard :underline t :weight bold))))
   `(org-mode-line-clock                       ((t (:foreground ,xtof-dark-light2 :background ,xtof-dark-dark0))))
   `(org-mode-line-clock-overrun               ((t (:foreground ,xtof-dark-black :background ,xtof-dark-bright_red))))
   `(org-ellipsis                              ((t (:foreground ,xtof-dark-bright_yellow :underline t))))
   `(org-footnote                              ((t (:foreground ,xtof-dark-faded_aqua :underline t))))

   `(org-habit-clear-face ((t (:background "gray35"))))
   `(org-habit-clear-future-face ((t (:background "gray20"))))
   `(org-habit-overdue-face ((t (:background "darkred"))))
   `(org-habit-overdue-future-face ((t (:inherit holiday))))
   `(org-habit-ready-face ((t (:background "#B8BB26"))))
   `(org-habit-ready-future-face ((t (:background "#427B58"))))

   ;; powerline
   `(powerline-active1                         ((t (:background ,xtof-dark-dark2 :inherit mode-line))))
   `(powerline-active2                         ((t (:background ,xtof-dark-dark1 :inherit mode-line))))
   `(powerline-inactive1                       ((t (:background ,xtof-dark-medium :inherit mode-line-inactive))))
   `(powerline-inactive2                       ((t (:background ,xtof-dark-dark2 :inherit mode-line-inactive))))

   ;; smart-mode-line
   ;; use (setq sml/theme nil) to enable Darktooth for sml
   `(sml/modes                                 ((t (:foreground ,xtof-dark-light0_hard :weight bold :bold t))))
   `(sml/minor-modes                           ((t (:foreground ,xtof-dark-neutral_orange))))
   `(sml/filename                              ((t (:foreground ,xtof-dark-light0_hard :weight bold :bold t))))
   `(sml/prefix                                ((t (:foreground ,xtof-dark-neutral_blue))))
   `(sml/git                                   ((t (:inherit sml/prefix))))
   `(sml/process                               ((t (:inherit sml/prefix))))
   `(sml/sudo                                  ((t (:foreground ,xtof-dark-dark_orange :weight bold))))
   `(sml/read-only                             ((t (:foreground ,xtof-dark-neutral_blue))))
   `(sml/outside-modified                      ((t (:foreground ,xtof-dark-neutral_blue))))
   `(sml/modified                              ((t (:foreground ,xtof-dark-neutral_blue))))
   `(sml/vc                                    ((t (:foreground ,xtof-dark-faded_green))))
   `(sml/vc-edited                             ((t (:foreground ,xtof-dark-bright_green))))
   `(sml/charging                              ((t (:foreground ,xtof-dark-faded_aqua))))
   `(sml/discharging                           ((t (:foreground ,xtof-dark-faded_aqua :weight bold))))
   `(sml/col-number                            ((t (:foreground ,xtof-dark-neutral_orange))))
   `(sml/position-percentage                   ((t (:foreground ,xtof-dark-faded_aqua))))

   ;; Matches and Isearch
   `(lazy-highlight                            ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-dark2))))
   `(highlight                                 ((t (:foreground ,xtof-dark-light0_hard :background ,xtof-dark-faded_blue))))
   `(match                                     ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-dark2))))
   `(isearch                                   ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-faded_aqua))))
   `(isearch-fail                              ((t (:foreground ,xtof-dark-light0_hard :background ,xtof-dark-faded_red))))
   `(show-paren-match                          ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-faded_blue))))
   `(show-paren-mismatch                       ((t (:foreground ,xtof-dark-light0_hard :background ,xtof-dark-faded_red))))
   `(anzu-mode-line                            ((t (:foreground ,xtof-dark-light0 :height 100 :background ,xtof-dark-faded_blue))))

   `(avy-lead-face-0                           ((t (:foreground ,xtof-dark-bright_blue ))))
   `(avy-lead-face-1                           ((t (:foreground ,xtof-dark-bright_aqua ))))
   `(avy-lead-face-2                           ((t (:foreground ,xtof-dark-bright_purple ))))
   `(avy-lead-face                             ((t (:foreground ,xtof-dark-bright_red ))))
   `(avy-background-face                       ((t (:foreground ,xtof-dark-dark3 ))))
   `(avy-goto-char-timer-face                  ((t (:inherit    highlight ))))

   ;; Popup
   `(popup-face                                ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-dark1))))
   `(popup-menu-mouse-face                     ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-faded_blue))))
   `(popup-menu-selection-face                 ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-faded_blue))))
   `(popup-tip-face                            ((t (:foreground ,xtof-dark-light0_hard :background ,xtof-dark-dark_aqua))))
   ;; Use tip colors for the pos-tip color vars (see below)

   ;; Inherit ac-dabbrev from popup menu face
   `(ac-dabbrev-menu-face                      ((t (:inherit popup-face))))
   `(ac-dabbrev-selection-face                 ((t (:inherit popup-menu-selection-face))))

   ;; sh mode
   `(sh-heredoc                                ((t (:foreground ,xtof-dark-darkslategray4 :background nil))))
   `(sh-quoted-exec                            ((t (:foreground ,xtof-dark-darkslategray4 :background nil))))

   ;; Company Mode
   `(company-echo                              ((t (:inherit company-echo-common))))
   `(company-echo-common                       ((t (:foreground ,xtof-dark-bright_blue :background nil))))
   `(company-preview-common                    ((t (:underline ,xtof-dark-light1))))
   `(company-preview                           ((t (:inherit company-preview-common))))
   `(company-preview-search                    ((t (:inherit company-preview-common))))
   `(company-template-field                    ((t (:foreground ,xtof-dark-bright_blue :background nil :underline ,xtof-dark-dark_blue))))
   `(company-scrollbar-fg                      ((t (:foreground nil :background ,xtof-dark-dark2))))
   `(company-scrollbar-bg                      ((t (:foreground nil :background ,xtof-dark-dark3))))
   `(company-tooltip                           ((t (:foreground ,xtof-dark-light0_hard :background ,xtof-dark-dark1))))
   `(company-preview-common                    ((t (:inherit font-lock-comment-face))))
   ;; `(company-tooltip-common                    ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-dark1))))
   `(company-tooltip-common                    ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-dark1 :weight bold :underline nil))))
   `(company-tooltip-annotation                ((t (:foreground ,xtof-dark-bright_blue :background ,xtof-dark-dark1))))
   ;; `(company-tooltip-common-selection          ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-faded_blue))))
   `(company-tooltip-common-selection ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-faded_blue :weight bold :underline nil))))
   `(company-tooltip-mouse                     ((t (:foreground ,xtof-dark-dark0 :background ,xtof-dark-bright_blue))))
   `(company-tooltip-selection                 ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-faded_blue))))

   ;; helm
   `(helm-M-x-key                              ((t (:foreground ,xtof-dark-neutral_orange))))
   `(helm-action                               ((t (:foreground ,xtof-dark-white :underline t))))
   `(helm-bookmark-addressbook                 ((t (:foreground ,xtof-dark-neutral_red))))
   `(helm-bookmark-directory                   ((t (:foreground ,xtof-dark-bright_purple))))
   `(helm-bookmark-file                        ((t (:foreground ,xtof-dark-faded_blue))))
   `(helm-bookmark-gnus                        ((t (:foreground ,xtof-dark-faded_purple))))
   `(helm-bookmark-info                        ((t (:foreground ,xtof-dark-turquoise4))))
   `(helm-bookmark-man                         ((t (:foreground ,xtof-dark-sienna))))
   `(helm-bookmark-w3m                         ((t (:foreground ,xtof-dark-neutral_yellow))))
   `(helm-buffer-directory                     ((t (:foreground ,xtof-dark-white :background ,xtof-dark-bright_blue))))
   `(helm-buffer-not-saved                     ((t (:foreground ,xtof-dark-faded_red))))
   `(helm-buffer-process                       ((t (:foreground ,xtof-dark-burlywood4))))
   `(helm-buffer-saved-out                     ((t (:foreground ,xtof-dark-bright_red))))
   `(helm-buffer-size                          ((t (:foreground ,xtof-dark-bright_purple))))
   `(helm-candidate-number                     ((t (:foreground ,xtof-dark-neutral_green))))
   `(helm-ff-directory                         ((t (:foreground ,xtof-dark-neutral_purple))))
   `(helm-ff-executable                        ((t (:foreground ,xtof-dark-turquoise4))))
   `(helm-ff-file                              ((t (:foreground ,xtof-dark-sienna))))
   `(helm-ff-invalid-symlink                   ((t (:foreground ,xtof-dark-white :background ,xtof-dark-bright_red))))
   `(helm-ff-prefix                            ((t (:foreground ,xtof-dark-black :background ,xtof-dark-neutral_yellow))))
   `(helm-ff-symlink                           ((t (:foreground ,xtof-dark-neutral_orange))))
   `(helm-grep-cmd-line                        ((t (:foreground ,xtof-dark-neutral_green))))
   `(helm-grep-file                            ((t (:foreground ,xtof-dark-faded_purple))))
   `(helm-grep-finish                          ((t (:foreground ,xtof-dark-turquoise4))))
   `(helm-grep-lineno                          ((t (:foreground ,xtof-dark-neutral_orange))))
   `(helm-grep-match                           ((t (:foreground ,xtof-dark-neutral_yellow))))
   `(helm-grep-running                         ((t (:foreground ,xtof-dark-neutral_red))))
   `(helm-header                               ((t (:foreground ,xtof-dark-aquamarine4))))
   `(helm-helper                               ((t (:foreground ,xtof-dark-aquamarine4))))
   `(helm-history-deleted                      ((t (:foreground ,xtof-dark-black :background ,xtof-dark-bright_red))))
   `(helm-history-remote                       ((t (:foreground ,xtof-dark-faded_red))))
   `(helm-lisp-completion-info                 ((t (:foreground ,xtof-dark-faded_orange))))
   `(helm-lisp-show-completion                 ((t (:foreground ,xtof-dark-bright_red))))
   `(helm-locate-finish                        ((t (:foreground ,xtof-dark-white :background ,xtof-dark-aquamarine4))))
   `(helm-match                                ((t (:foreground ,xtof-dark-neutral_orange))))
   `(helm-moccur-buffer                        ((t (:foreground ,xtof-dark-bright_aqua :underline t))))
   `(helm-prefarg                              ((t (:foreground ,xtof-dark-turquoise4))))
   `(helm-selection                            ((t (:foreground ,xtof-dark-white :background ,xtof-dark-dark2))))
   `(helm-selection-line                       ((t (:foreground ,xtof-dark-white :background ,xtof-dark-dark2))))
   `(helm-separator                            ((t (:foreground ,xtof-dark-faded_red))))
   `(helm-source-header                        ((t (:foreground ,xtof-dark-light2 :background ,xtof-dark-dark1))))
   `(helm-visible-mark                         ((t (:foreground ,xtof-dark-black :background ,xtof-dark-light3))))

   ;;Smerge
   ;; TODO: smerge-base, smerge-refined-changed
   `(smerge-mine            ((t(:background ,xtof-dark-mid_purple))))
   `(smerge-other           ((t(:background ,xtof-dark-mid_blue))))
   `(smerge-markers         ((t(:background ,xtof-dark-dark0_soft))))
   `(smerge-refined-added   ((t(:background ,xtof-dark-dark_green))))
   `(smerge-refined-removed ((t(:background ,xtof-dark-dark_red))))

   ;; Magit
   `(magit-branch                       ((t (:foreground ,xtof-dark-turquoise4 :background nil))))
   `(magit-branch-local                 ((t (:foreground ,xtof-dark-turquoise4 :background nil))))
   `(magit-branch-remote                ((t (:foreground ,xtof-dark-aquamarine4 :background nil))))
   `(magit-cherry-equivalent            ((t (:foreground ,xtof-dark-neutral_orange))))
   `(magit-cherry-unmatched             ((t (:foreground ,xtof-dark-neutral_purple))))
   `(magit-diff-context                 ((t (:foreground ,xtof-dark-dark3 :background nil))))
   `(magit-diff-context-highlight       ((t (:foreground ,xtof-dark-dark4 :background ,xtof-dark-dark0_soft))))
   `(magit-diff-added                   ((t (:foreground ,xtof-dark-bright_green :background ,xtof-dark-mid_green))))
   `(magit-diff-added-highlight         ((t (:foreground ,xtof-dark-bright_green :background ,xtof-dark-mid_green))))
   `(magit-diff-removed                 ((t (:foreground ,xtof-dark-bright_red :background ,xtof-dark-mid_red))))
   `(magit-diff-removed-highlight       ((t (:foreground ,xtof-dark-bright_red :background ,xtof-dark-mid_red))))
   `(magit-diff-add                     ((t (:foreground ,xtof-dark-bright_green))))
   `(magit-diff-del                     ((t (:foreground ,xtof-dark-bright_red))))
   `(magit-diff-file-header             ((t (:foreground ,xtof-dark-bright_blue))))
   `(magit-diff-hunk-header             ((t (:foreground ,xtof-dark-neutral_aqua))))
   `(magit-diff-merge-current           ((t (:background ,xtof-dark-dark_yellow))))
   `(magit-diff-merge-diff3-separator   ((t (:foreground ,xtof-dark-neutral_orange :weight bold))))
   `(magit-diff-merge-proposed          ((t (:background ,xtof-dark-dark_green))))
   `(magit-diff-merge-separator         ((t (:foreground ,xtof-dark-neutral_orange))))
   `(magit-diff-none                    ((t (:foreground ,xtof-dark-medium))))
   `(magit-item-highlight               ((t (:background ,xtof-dark-dark1 :weight normal))))
   `(magit-item-mark                    ((t (:background ,xtof-dark-dark0))))
   `(magit-key-mode-args-face           ((t (:foreground ,xtof-dark-light4))))
   `(magit-key-mode-button-face         ((t (:foreground ,xtof-dark-neutral_orange :weight bold))))
   `(magit-key-mode-header-face         ((t (:foreground ,xtof-dark-light4 :weight bold))))
   `(magit-key-mode-switch-face         ((t (:foreground ,xtof-dark-turquoise4 :weight bold))))
   `(magit-log-author                   ((t (:foreground ,xtof-dark-neutral_aqua))))
   `(magit-log-date                     ((t (:foreground ,xtof-dark-faded_orange))))
   `(magit-log-graph                    ((t (:foreground ,xtof-dark-light1))))
   `(magit-log-head-label-bisect-bad    ((t (:foreground ,xtof-dark-bright_red))))
   `(magit-log-head-label-bisect-good   ((t (:foreground ,xtof-dark-bright_green))))
   `(magit-log-head-label-bisect-skip   ((t (:foreground ,xtof-dark-neutral_yellow))))
   `(magit-log-head-label-default       ((t (:foreground ,xtof-dark-neutral_blue))))
   `(magit-log-head-label-head          ((t (:foreground ,xtof-dark-light0 :background ,xtof-dark-dark_aqua))))
   `(magit-log-head-label-local         ((t (:foreground ,xtof-dark-faded_blue :weight bold))))
   `(magit-log-head-label-patches       ((t (:foreground ,xtof-dark-faded_orange))))
   `(magit-log-head-label-remote        ((t (:foreground ,xtof-dark-neutral_blue :weight bold))))
   `(magit-log-head-label-tags          ((t (:foreground ,xtof-dark-neutral_aqua))))
   `(magit-log-head-label-wip           ((t (:foreground ,xtof-dark-neutral_red))))
   `(magit-log-message                  ((t (:foreground ,xtof-dark-light1))))
   `(magit-log-reflog-label-amend       ((t (:foreground ,xtof-dark-bright_blue))))
   `(magit-log-reflog-label-checkout    ((t (:foreground ,xtof-dark-bright_yellow))))
   `(magit-log-reflog-label-cherry-pick ((t (:foreground ,xtof-dark-neutral_red))))
   `(magit-log-reflog-label-commit      ((t (:foreground ,xtof-dark-neutral_green))))
   `(magit-log-reflog-label-merge       ((t (:foreground ,xtof-dark-bright_green))))
   `(magit-log-reflog-label-other       ((t (:foreground ,xtof-dark-faded_red))))
   `(magit-log-reflog-label-rebase      ((t (:foreground ,xtof-dark-bright_blue))))
   `(magit-log-reflog-label-remote      ((t (:foreground ,xtof-dark-neutral_orange))))
   `(magit-log-reflog-label-reset       ((t (:foreground ,xtof-dark-neutral_yellow))))
   `(magit-log-sha1                     ((t (:foreground ,xtof-dark-bright_orange))))
   `(magit-process-ng                   ((t (:foreground ,xtof-dark-bright_red :weight bold))))
   `(magit-process-ok                   ((t (:foreground ,xtof-dark-bright_green :weight bold))))
   `(magit-section-heading              ((t (:foreground ,xtof-dark-light2 :background ,xtof-dark-dark_blue))))
   `(magit-signature-bad                ((t (:foreground ,xtof-dark-bright_red :weight bold))))
   `(magit-signature-good               ((t (:foreground ,xtof-dark-bright_green :weight bold))))
   `(magit-signature-none               ((t (:foreground ,xtof-dark-faded_red))))
   `(magit-signature-untrusted          ((t (:foreground ,xtof-dark-bright_purple :weight bold))))
   `(magit-tag                          ((t (:foreground ,xtof-dark-darkslategray4))))
   `(magit-whitespace-warning-face      ((t (:background ,xtof-dark-faded_red))))
   `(magit-bisect-bad                   ((t (:foreground ,xtof-dark-faded_red))))
   `(magit-bisect-good                  ((t (:foreground ,xtof-dark-neutral_green))))
   `(magit-bisect-skip                  ((t (:foreground ,xtof-dark-light2))))

   ;; TODO: Many new magit faces to theme

   ;;magit-diff-conflict-heading
   ;;magit-diff-base
   ;;magit-diff-base-highlight
   ;;magit-diff-file-heading
   ;;magit-diff-file-heading-highlight
   ;;magit-diff-file-heading-selection
   ;;magit-diff-hunk-heading
   ;;magit-diff-hunk-heading-highlight
   ;;magit-diff-hunk-heading-selection
   ;;magit-diff-lines-boundary
   ;;magit-diff-lines-heading
   ;;magit-diff-our
   ;;magit-diff-our-highlight
   ;;magit-diff-their
   ;;magit-diff-their-highlight
   ;;magit-diff-whitespace-warning
   ;;magit-diffstat-added
   ;;magit-diffstat-removed

   ;;magit-blame-date
   ;;magit-blame-hash
   ;;magit-blame-heading
   ;;magit-blame-name
   ;;magit-blame-summary

   ;;magit-branch-current
   ;;magit-branch-local
   ;;magit-branch-remote

   ;;magit-cherry-equivalent
   ;;magit-cherry-unmatched

   ;;magit-dimmed
   ;;magit-filename
   ;;magit-hash
   ;;magit-head
   ;;magit-header-line
   ;;magit-log-author
   ;;magit-log-date
   ;;magit-log-graph
   ;;magit-popup-argument
   ;;magit-popup-disabled-argument
   ;;magit-popup-heading
   ;;magit-popup-key
   ;;magit-popup-option-value

   ;;magit-process-ng
   ;;magit-process-ok

   ;;magit-reflog-amend
   ;;magit-reflog-checkout
   ;;magit-reflog-cherry-pick
   ;;magit-reflog-commit
   ;;magit-reflog-merge
   ;;magit-reflog-other
   ;;magit-reflog-rebase
   ;;magit-reflog-remote
   ;;magit-reflog-reset

   ;;magit-refname
   ;;magit-refname-stash
   ;;magit-refname-wip

   ;;magit-section-heading
   ;;magit-section-heading-selection
   ;;magit-section-highlight
   ;;magit-section-secondary-heading

   ;;magit-sequence-done
   ;;magit-sequence-drop
   ;;magit-sequence-head
   ;;magit-sequence-onto
   ;;magit-sequence-part
   ;;magit-sequence-pick
   ;;magit-sequence-stop

   ;;magit-signature-bad
   ;;magit-signature-good
   ;;magit-signature-untrusted

   ;;magit-tag

   ;; Term
   `(term-color-black                          ((t (:foreground ,xtof-dark-dark1))))
   `(term-color-blue                           ((t (:foreground ,xtof-dark-neutral_blue))))
   `(term-color-cyan                           ((t (:foreground ,xtof-dark-neutral_aqua))))
   `(term-color-green                          ((t (:foreground ,xtof-dark-neutral_green))))
   `(term-color-magenta                        ((t (:foreground ,xtof-dark-neutral_purple))))
   `(term-color-red                            ((t (:foreground ,xtof-dark-neutral_red))))
   `(term-color-white                          ((t (:foreground ,xtof-dark-light1))))
   `(term-color-yellow                         ((t (:foreground ,xtof-dark-neutral_yellow))))
   `(term-default-fg-color                     ((t (:foreground ,xtof-dark-light0))))
   `(term-default-bg-color                     ((t (:background ,xtof-dark-dark0)))))

  ;; Elfeed
  `(elfeed-search-date-face ((t (:foreground ,xtof-dark-dark1))))
  `(elfeed-search-feed-face ((t (:foreground ,xtof-dark-dark1))))
  `(elfeed-search-tag-face ((t (:foreground ,xtof-dark-dark0))))
  `(elfeed-search-title-face ((t (:foreground ,xtof-dark-dark0))))

  `(ahs-definition-face ((t (:background "CadetBlue" :foreground "moccasin"))))
  `(ahs-face ((t (:background "gray60" :foreground "black"))))
  `(ahs-plugin-whole-buffer-face ((t (:background "Dark Goldenrod" :foreground "Black"))))
  `(neo-dir-link-face ((t (:inherit magit-head :weight extra-bold))))
  `(neo-vc-default-face ((t (:foreground "#7C6F64"))))
  `(neo-vc-edited-face ((t (:foreground "#DD6F48"))))
  `(neo-vc-up-to-date-face ((t (:foreground "#FDF4C1"))))

  (custom-theme-set-variables
   'xtof-dark

   `(pos-tip-foreground-color ,xtof-dark-light0_hard)
   `(pos-tip-background-color ,xtof-dark-dark_aqua)

   `(ansi-color-names-vector ["#3C3836"
                              "#FB4934"
                              "#B8BB26"
                              "#FABD2F"
                              "#83A598"
                              "#D3869B"
                              "#8EC07C"
                              "#EBDBB2"])))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'xtof-dark)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; xtof-dark-theme.el ends here
