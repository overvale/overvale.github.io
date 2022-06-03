;; build-site.el --- Code for building olivertaylor.net -*- lexical-binding: t -*-

;; Copyright (c) Oliver Taylor
;; URL: https://olivertaylor.net


;;; Commentary:

;; This file contains code to be used as an extremely basic "static site"
;; generator. Basically, I use the below lisp code to built an HTML version of
;; olivertaylor.net.

;; At present it fulfills the very simple goal of wrapping pages in common
;; HTML headers and footers.


;;; Code

(defvar onet-base-path "~/home/src/olivertaylor/"
  "Path to local development directory for olivertaylor.net")

(defvar onet-template-header "lib/templates/header.html"
  "Path, relative to `onet-base-bath' to header template file.")

(defvar onet-template-nav "lib/templates/nav.html"
  "Path, relative to `onet-base-bath' to nav template file.")

(defvar onet-template-footer "lib/templates/footer.html"
  "Path, relative to `onet-base-bath' to footer template file.")

(defun onet-page (title input output &optional nav)
  "Build webpage from INPUT to OUTPUT using TITLE.
If NAV is non-nil, omit the navigation template."
  (with-temp-file (concat onet-base-path output)
    ;; This has to be backwards (bottom-up). Probably because the point stays
    ;; at zero, and `insert-file-contents' always inserts content after the
    ;; point.
    (insert-file-contents (concat onet-base-path onet-template-footer))
    (insert-file-contents (concat onet-base-path input))
    (unless nav
      (insert-file-contents (concat onet-base-path onet-template-nav)))
    (insert-file-contents (concat onet-base-path onet-template-header))
    (while (re-search-forward "{{TITLE}}" nil t)
      (replace-match title t))))

;;; Pages

(onet-page "Home"
           "lib/index.html"
           "index.html"
           t)

(onet-page "Not Found!"
           "lib/404.html"
           "404.html")

;;; Work Pages

(onet-page "Engineering"
           "lib/work/engineering.html"
           "work/engineering.html")

(onet-page "Thoughts on Growing a Company"
           "lib/work/growth-thoughts.html"
           "work/growth-thoughts.html")

(onet-page "Notes on Managing"
           "lib/work/managing.html"
           "work/managing.html")

(onet-page "My Productivity System"
           "lib/work/productivity.html"
           "work/productivity.html")

;;; Notes Pages

(onet-page "A Partial List of Movies Released in 2007"
           "lib/notes/20161218_2007_movies.html"
           "notes/20161218_2007_movies.html")

(onet-page "Harrison Ford Movies, 1980-2000"
           "lib/notes/20161218_harrison_ford_movies.html"
           "notes/20161218_harrison_ford_movies.html")

(onet-page "Software I Love"
           "lib/notes/20161218_software_love.html"
           "notes/20161218_software_love.html")

(onet-page "Worth the Money"
           "lib/notes/20200330_worth_the_money.html"
           "notes/20200330_worth_the_money.html")

(onet-page "Recommended Books"
           "lib/notes/20200531_recommended_books.html"
           "notes/20200531_recommended_books.html")

(onet-page "Perfection"
           "lib/notes/perfection.html"
           "notes/perfection.html")

(onet-page "Structured to Innovate"
           "lib/notes/structured-to-innovate.html"
           "notes/structured-to-innovate.html")

(onet-page "Writing in Plain Text"
           "lib/notes/writing_in_plain_text.html"
           "notes/writing_in_plain_text.html")

(onet-page "Revelation of the Complex"
           "lib/notes/20130908_revelation_complex.html"
           "notes/20130908_revelation_complex.html")

;;; Emacs Pages

(onet-page "Emacs Keybindings That Won't Get Overridden by Minor Modes"
           "lib/emacs/bosskey-mode.html"
           "emacs/bosskey-mode.html")

(onet-page "Confirm Killing Modified Buffers"
           "lib/emacs/buffer-confirm-kill.html"
           "emacs/buffer-confirm-kill.html")

(onet-page "Custom Scratch Buffers"
           "lib/emacs/custom-scratch-buffers.html"
           "emacs/custom-scratch-buffers.html")

(onet-page "Extending Emacs Bookmarks to Work With EWW"
           "lib/emacs/extending-emacs-bookmarks.html"
           "emacs/extending-emacs-bookmarks.html")

(onet-page "Keymap Prompts"
           "lib/emacs/keymap-prompt.html"
           "emacs/keymap-prompt.html")

(onet-page "Kill Buffer DWIM"
           "lib/emacs/kill-buffer-dwim.html"
           "emacs/kill-buffer-dwim.html")

(onet-page "Mark Line and Marking Transient Command"
           "lib/emacs/mark-line-transient-command.html"
           "emacs/mark-line-transient-command.html")

(onet-page "Splitting Windows With the Mouse"
           "lib/emacs/mouse-window-splits.html"
           "emacs/mouse-window-splits.html")

(onet-page "How Package.el Works with Use Package"
           "lib/emacs/notes-on-package-el.html"
           "emacs/notes-on-package-el.html")

(onet-page "Quick Help: Emacs as a Text Productivity Platform"
           "lib/emacs/quick-help.html"
           "emacs/quick-help.html")
