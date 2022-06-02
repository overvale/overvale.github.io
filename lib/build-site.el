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

(defvar osite-base-path "~/home/src/olivertaylor/"
  "Path to local development directory for olivertaylor.net")

(defvar osite-template-header "lib/header.html"
  "Path, relative to `osite-base-bath' to header template file.")

(defvar osite-template-footer "lib/footer.html"
  "Path, relative to `osite-base-bath' to footer template file.")

(defun osite-build-page (title input output)
  "Build webpage from INPUT to OUTPUT using TITLE."
  (with-temp-file (concat osite-base-path output)
    ;; This has to be backwards (bottom-up). Probably because the point stays
    ;; at zero, and `insert-file-contents' always inserts content after the
    ;; point.
    (insert-file-contents (concat osite-base-path osite-template-footer))
    (insert-file-contents (concat osite-base-path input))
    (insert-file-contents (concat osite-base-path osite-template-header))
    (while (re-search-forward "{{TITLE}}" nil t)
      (replace-match title t))))


;;; Notes Pages

(osite-build-page "A Partial List of Movies Released in 2007"
                  "lib/notes/20161218_2007_movies.html"
                  "notes/20161218_2007_movies.html")

(osite-build-page "Harrison Ford Movies, 1980-2000"
                  "lib/notes/20161218_harrison_ford_movies.html"
                  "notes/20161218_harrison_ford_movies.html")

(osite-build-page "Software I Love"
                  "lib/notes/20161218_software_love.html"
                  "notes/20161218_software_love.html")

(osite-build-page "Worth the Money"
                  "lib/notes/20200330_worth_the_money.html"
                  "notes/20200330_worth_the_money.html")

(osite-build-page "Recommended Books"
                  "lib/notes/20200531_recommended_books.html"
                  "notes/20200531_recommended_books.html")

(osite-build-page "Perfection"
                  "lib/notes/perfection.html"
                  "notes/perfection.html")

(osite-build-page "Structured to Innovate"
                  "lib/notes/structured-to-innovate.html"
                  "notes/structured-to-innovate.html")

(osite-build-page "Writing in Plain Text"
                  "lib/notes/writing_in_plain_text.html"
                  "notes/writing_in_plain_text.html")

(osite-build-page "Revelation of the Complex"
                  "lib/notes/20130908_revelation_complex.html"
                  "notes/20130908_revelation_complex.html")

;;; Emacs Pages

(osite-build-page "Emacs Keybindings That Won't Get Overridden by Minor Modes"
                  "lib/emacs/bosskey-mode.html"
                  "emacs/bosskey-mode.html")

(osite-build-page "Confirm Killing Modified Buffers"
                  "lib/emacs/buffer-confirm-kill.html"
                  "emacs/buffer-confirm-kill.html")

(osite-build-page "Custom Scratch Buffers"
                  "lib/emacs/custom-scratch-buffers.html"
                  "emacs/custom-scratch-buffers.html")

(osite-build-page "Extending Emacs Bookmarks to Work With EWW"
                  "lib/emacs/extending-emacs-bookmarks.html"
                  "emacs/extending-emacs-bookmarks.html")

(osite-build-page "Keymap Prompts"
                  "lib/emacs/keymap-prompt.html"
                  "emacs/keymap-prompt.html")

(osite-build-page "Kill Buffer DWIM"
                  "lib/emacs/kill-buffer-dwim.html"
                  "emacs/kill-buffer-dwim.html")

(osite-build-page "Mark Line and Marking Transient Command"
                  "lib/emacs/mark-line-transient-command.html"
                  "emacs/mark-line-transient-command.html")

(osite-build-page "Splitting Windows With the Mouse"
                  "lib/emacs/mouse-window-splits.html"
                  "emacs/mouse-window-splits.html")

(osite-build-page "How Package.el Works with Use Package"
                  "lib/emacs/notes-on-package-el.html"
                  "emacs/notes-on-package-el.html")

(osite-build-page "Quick Help: Emacs as a Text Productivity Platform"
                  "lib/emacs/quick-help.html"
                  "emacs/quick-help.html")
