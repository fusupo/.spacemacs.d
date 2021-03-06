;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/private")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '( 
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t)
     (clojure :variables clojure-enable-fancify-symbols t)
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (shell :variables
            shell-default-shell 'eshell
            shell-enable-smart-eshell t
            shell-default-height 10
            shell-default-position 'bottom
            shell-default-term-shell "/bin/zsh" )
     deft
     emacs-lisp
     git
     github
     html
     javascript
     markdown
     org
     react
     spell-checking
     syntax-checking
     themes-megapack 
     ;;;;;;;;;;;;;;;;;;;;;;;;;  XTOF CUSTOMIZATION
     xtof-org
     xtof-fci
     xtof-web
     ;;restclient
     ;;prodigy
     finance
     gnus
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(calfw)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner "~/.spacemacs.d/512-banner.txt"
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;;darktooth
                         xtof-dark
                         twilight-bright
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono"
                               ;;"Source Code Pro"
                               :size 14 
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 1.0
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'current
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setq custom-theme-directory "~/.spacemacs.d/"))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (setq deft-directory "~/Dropbox/org")
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  ;; linum-mode
  (add-hook 'js2-mode-hook 'linum-mode)
  (add-hook 'emacs-lisp-mode-hook 'linum-mode)
  (add-hook 'clojure-mode-hook 'linum-mode)

  ;; automatic symbol highlight
  (add-hook 'js2-mode-hook 'spacemacs/toggle-automatic-symbol-highlight-on)
  (add-hook 'emacs-lisp-mode-hook 'spacemacs/toggle-automatic-symbol-highlight-on)
  (add-hook 'clojure-mode-hook 'spacemacs/toggle-automatic-symbol-highlight-on)
  (indent-guide-global-mode)
  ;;(global-centered-cursor-mode)
  (global-aggressive-indent-mode)
  (fringe-mode -1)
  (neotree-show)

  (setq js-indent-level 2) ;; indendet JSON 2 spaces
  (add-hook 'js2-mode-hook (lambda ()
                             (smartparens-strict-mode t)
                             (show-smartparens-mode t)) t)
  ;;  (add-hook 'js2-mode-hook #'yas-minor-mode)

  (add-hook 'org-mode-hook 'spacemacs/toggle-spelling-checking-on)
  (add-hook 'js2-mode-hook 'spacemacs/toggle-spelling-checking-off)
  (add-hook 'clojure-mode-hook 'spacemacs/toggle-spelling-checking-off)
  (add-hook 'emacs-lisp-mode-hook 'spacemacs/toggle-spelling-checking-off)

  (setq magit-push-always-verify nil)
  (setq dotspacemacs-remap-Y-to-y$ nil)
  (setq split-width-threshold 100)
  (setq-default evil-escape-key-sequence "jk")
  (setq markdown-command "pandoc -f markdown_github")
  (global-company-mode t)
  ;;(global-company-mode)
  (setq org-archive-location "~/Dropbox/org/archive/%s_archive::")
  (setq aya-persist-snippets-dir "~/.spacemacs.d/snippets/")
  ;; (setq paradox-github-token t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (require 'calfw)
  (require 'calfw-org)
  (require 'org-gcal)

  (setq cfw:fchar-junction ?╬
        cfw:fchar-vertical-line ?║
        cfw:fchar-horizontal-line ?═
        cfw:fchar-left-junction ?╠
        cfw:fchar-right-junction ?╣
        cfw:fchar-top-junction ?╦
        cfw:fchar-top-left-corner ?╔
        cfw:fchar-top-right-corner ?╗)

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;Get email, and store in nnml
  (setq gnus-secondary-select-methods
        '(
          (nnimap "gmail"
                  (nnimap-address
                   "imap.gmail.com")
                  (nnimap-server-port 993)
                  (nnimap-stream ssl))
          ))

  ;; Send email via Gmail:
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-default-smtp-server "smtp.gmail.com")

  ;; Archive outgoing email in Sent folder on imap.gmail.com:
  (setq gnus-message-archive-method '(nnimap "imap.gmail.com")
        gnus-message-archive-group "[Gmail]/Sent Mail")

  ;; set return email address based on incoming email address
  (setq gnus-posting-styles
        '(((header "to" "address@outlook.com")
           (address "address@outlook.com"))
          ((header "to" "address@gmail.com")
           (address "address@gmail.com"))))

  ;; store email in ~/gmail directory
  (setq nnml-directory "~/gmail")
  (setq message-directory "~/gmail")

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defun xtof/org-export-header ()
    (concat
     "<header id='header'>"
     "<a href='/about'>"
     ;;"<img id='avatar' class='2x' src='/assets/images/avatar.png'>"
     "</a>"
     "<h1>Marc Christophe</h1>"
     "<h4>Exploring Novel Software Architectures</h4>"
     "</header>"))
  
  (defun xtof/org-export-preamble (info)
    (cond ((string= (car (plist-get info :title)) "index")
           (concat  "<nav>"
                    "<a href= 'about.html '>ABOUT</a>"
                    "</nav>"
                    (xtof/org-export-header)
                    "<hr>"))
          ((string= (car (plist-get info :title)) "about")
           (concat  "<nav>"
                    "<a href= 'index.html '>HOME</a>"
                    "</nav>"
                    (xtof/org-export-header)
                    "<hr>"))
          (t (concat  "<nav>"
                      "<a href= '../index.html '>HOME</a> | "
                      "<a href= '../about.html '>ABOUT</a>"
                      "</nav>"
                      "<hr>")))
    )

  (defun xtof/org-export-disqus-wiget ()
    (concat
     "<div id='disqus_thread'></div>"
     "<script>"
     ;; /**
     ;; * RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
     ;; * LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
     ;; */
     ;; /*
     ;; var disqus_config = function () {
     ;; this.page.url = PAGE_URL; // Replace PAGE_URL with your page's canonical URL variable
     ;; this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
     ;; };
     ;; */
     "(function() { /*DON'T EDIT BELOW THIS LINE*/"
     "var d = document, s = d.createElement('script');"
     "s.src = 'http://fusupogithubio.disqus.com/embed.js';"
     "s.setAttribute ('data-timestamp', +new Date());"
     "(d.head || d.body).appendChild(s);"
     "})();"
     "</script>"
     "<noscript>"
     "Please enable JavaScript to view the "
     "<a href='https://disqus.com/?ref_noscript' rel='nofollow'>"
     "comments powered by Disqus."
     "</a>"
     "</noscript>"
     "<script id='dsq-count-scr' src='http://fusupogithubio.disqus.com/count.js' async></script>"
     ))

  (defun xtof/org-export-google-analytics-widget ()
    (concat
     "<script>"
     "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){"
     "(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),"
     "m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)"
     "})(window,document,'script','//www.google-analytics.com/analytics.js','ga');"
     "ga('create', 'UA-75904999-1', 'auto');"
     "ga('send', 'pageview');"
     "</script>"))

  (defun xtof/org-export-footer ()
    (concat
     "<footer id='footer'>"
     "<hr></hr>"
     "<p class='small'>© Copyright 2016 Marc Christophe</p>"
     "<p>"
     "<a href='https://twitter.com/fusupo' target='_blank'>Twitter</a> | "
     "<a href='https://www.linkedin.com/in/marcpchristophe' target='_blank'>LinkedIn</a> | "
     "<a href='https://github.com/fusupo' target='_blank'>Github</a>"
     "</p>"
     "</footer>"))

  (defun xtof/org-export-postamble (info)
    (cond ((string= (car (plist-get info :title)) "index")
           (concat  "<div>"
                    (xtof/org-export-footer)                    
                    (xtof/org-export-google-analytics-widget)
                    "<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js'></script>"
                    "<script type='text/javascript' src='js/main.js'></script>" 
                    "</div>"))
          ((string= (car (plist-get info :title)) "about")
           (concat  "<div>"
                    (xtof/org-export-footer)                    
                    (xtof/org-export-google-analytics-widget)
                    "<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js'></script>"
                    "<script type='text/javascript' src='js/main.js'></script>"
                    "</div>"))
          (t (concat  "<div>"
                      "<a href='https://twitter.com/share' class='twitter-share-button' data-via='fusupo' data-size='large'>Tweet</a>"
                      "<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>"
                      "<a class='facebook' href='#'"
                      "onclick=\"window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href),'facebook-share-dialog','width=626,height=436'); return false;\">"
                      "<span class='icon-facebook-rect'>Share</span>"
                      "</a>"
                      (xtof/org-export-disqus-wiget) 
                      (xtof/org-export-footer)                    
                      (xtof/org-export-google-analytics-widget)
                      "<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js'></script>"
                      "<script type='text/javascript' src='../js/main.js'></script>"
                      "</div>")))
    )

  (defun xtof/org-export-html-head-extra (info)
    (concat
     "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' integrity='sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7' crossorigin='anonymous'>"
     "<link rel='stylesheet' href='style/main.css>")
    )

  (setq org-publish-project-alist
        '(("fusupo.github.io-index"
           :base-directory "~/Dropbox/fusupo.github.io/src/"
           :publishing-directory "~/Dropbox/fusupo.github.io/"
           :publishing-function org-html-publish-to-html
           ;;:exclude "*"
           :html-head-include-default-style nil
           :html-head-include-scripts nil
           ;;:html-head "<meta name='viewport' content='width=device-width, initial-scale=1'>"
           :html-head-extra "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' integrity='sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7' crossorigin='anonymous'><link rel='stylesheet' href='style/main.css'/>"
           :html-preamble xtof/org-export-preamble
           :html-postamble xtof/org-export-postamble
           :with-toc nil
           :with-title nil
           :section-numbers nil 
           )
          ("fusupo.github.io-posts"
           :base-directory "~/Dropbox/fusupo.github.io/src/posts/"
           :publishing-directory "~/Dropbox/fusupo.github.io/posts/"
           :publishing-function org-html-publish-to-html
           :html-head-include-default-style nil
           :html-head-include-scripts nil
           ;; :html-head "<meta name='viewport' content='width=device-width, initial-scale=1'>"
           :html-head-extra "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' integrity='sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7' crossorigin='anonymous'><link rel='stylesheet' href='../style/main.css'/>"
           :html-preamble xtof/org-export-preamble
           :html-postamble xtof/org-export-postamble
           :with-toc nil
           :section-numbers nil
           )
          ("fusupo.github.io" :components ("fusupo.github.io-index" "fusupo.github.io-posts")))
        )
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-names-vector
;;    ["#3C3836" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#8EC07C" "#EBDBB2"])
;;  '(custom-safe-themes
;;    (quote
;;     ("de77bc734c953053da156f82d65c9e28dd6744145dd2b1fafc44f5b5d51cc6b3" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "dcf229d4673483cb7b38505360824fa56a0d7b52f54edbcdca98cf5059fa1662" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "98a619757483dc6614c266107ab6b19d315f93267e535ec89b7af3d62fb83cad" "3a69621a68c2d3550a4c777ffc000e1ea66f5bc2f61112814c591e1bda3f5704" default)))
;;  '(linum-format "%4d|")
;;  '(neo-theme (quote arrow))
;;  '(neo-window-width 25)
;;  '(pos-tip-background-color "#36473A")
;;  '(pos-tip-foreground-color "#FFFFC8"))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:foreground "#FDF4C1" :background "#282828" :family "Source Code Pro" :foundry "adobe" :slant normal :weight normal :height 83 :width normal))))
;;  '(ahs-definition-face ((t (:background "CadetBlue" :foreground "moccasin"))))
;;  '(ahs-face ((t (:background "gray60" :foreground "black"))))
;;  '(ahs-plugin-whole-buffer-face ((t (:background "Dark Goldenrod" :foreground "Black"))))
;;  '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
;;  '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
;;  '(js2-function-call ((t (:inherit default :foreground "DarkSeaGreen4"))))
;;  '(neo-dir-link-face ((t (:inherit magit-head :weight extra-bold))))
;;  '(neo-vc-default-face ((t (:foreground "#7C6F64"))))
;;  '(neo-vc-edited-face ((t (:foreground "#DD6F48"))))
;;  '(neo-vc-up-to-date-face ((t (:foreground "#FDF4C1"))))
;;  '(org-done ((t (:foreground "#B8BB26" :bold t :weight bold))))
;;  '(org-habit-clear-face ((t (:background "gray35"))))
;;  '(org-habit-clear-future-face ((t (:background "gray20"))))
;;  '(org-habit-overdue-face ((t (:background "darkred"))))
;;  '(org-habit-overdue-future-face ((t (:inherit holiday))))
;;  '(org-habit-ready-face ((t (:background "#B8BB26"))))
;;  '(org-habit-ready-future-face ((t (:background "#427B58"))))
;;  '(region ((t (:background "#300000" :distant-foreground "#FDF4C1")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (twilight-bright)))
 '(httpd-port 2173)
 '(mm-text-html-renderer (quote gnus-w3m)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfw:face-annotation ((t :foreground "RosyBrown" :inherit cfw:face-day-title)))
 '(cfw:face-day-title ((t :background "grey10")))
 '(cfw:face-default-content ((t :foreground "#bfebbf")))
 '(cfw:face-default-day ((t :weight bold :inherit cfw:face-day-title)))
 '(cfw:face-disable ((t :foreground "DarkGray" :inherit cfw:face-day-title)))
 '(cfw:face-grid ((t :foreground "DarkGrey")))
 '(cfw:face-header ((t (:foreground "#d0bf8f" :weight bold))))
 '(cfw:face-holiday ((t :background "grey10" :foreground "#8c5353" :weight bold)))
 '(cfw:face-periods ((t :foreground "cyan")))
 '(cfw:face-saturday ((t :foreground "#8cd0d3" :background "grey10" :weight bold)))
 '(cfw:face-select ((t :background "#2f2f2f")))
 '(cfw:face-sunday ((t :foreground "#cc9393" :background "grey10" :weight bold)))
 '(cfw:face-title ((t (:foreground "#f0dfaf" :weight bold :height 2.0 :inherit variable-pitch))))
 '(cfw:face-today ((t :background: "grey10" :weight bold)))
 '(cfw:face-today-title ((t :background "#7f9f7f" :weight bold)))
 '(cfw:face-toolbar ((t :foreground "red" :background "red")))
 '(cfw:face-toolbar-button-off ((t :foreground "Gray10" :weight bold)))
 '(cfw:face-toolbar-button-on ((t :foreground "Gray50" :weight bold)))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
