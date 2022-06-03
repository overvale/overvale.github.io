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

(defun onet-page (&rest args)
  "Function to build pages for olivertaylor.net
:title will be used to create HTML title.
:filename is basename of file.
:section is optional, name of dir in root.
:omit-nav, when non-nil, omits navigation."
  (let* ((title (plist-get args :title))
         (section (plist-get args :section))
         (filename (plist-get args :filename))
         (omit-nav (plist-get args :omit-nav))
         (output (concat onet-base-path section "/" filename))
         (input (concat onet-base-path "lib/" section "/" filename))
         (footer (concat onet-base-path onet-template-footer))
         (nav (concat onet-base-path onet-template-nav))
         (header (concat onet-base-path onet-template-header)))
    (with-temp-file output
      ;; The page is built bottom-up, so footer first.
      (insert-file-contents footer)
      (insert-file-contents input)
      (unless omit-nav (insert-file-contents nav))
      (insert-file-contents header)
      (while (re-search-forward "{{TITLE}}" nil t)
        (replace-match title t)))))

;;; Pages

(onet-page :title "Home"
           :filename "index.html"
           :omit-nav t)

(onet-page :title "Not Found!"
           :filename "404.html")

;;; Work Pages

(onet-page :title "Engineering"
           :filename "engineering.html"
           :section "work")

(onet-page :title "Thoughts on Growing a Company"
           :filename "growth-thoughts.html"
           :section "work")

(onet-page :title "Notes on Managing"
           :filename "managing.html"
           :section "work")

(onet-page :title "My Productivity System"
           :filename "productivity.html"
           :section "work")

;;; Notes Pages

(onet-page :title "A Partial List of Movies Released in 2007"
           :filename "20161218_2007_movies.html"
           :section "notes")

(onet-page :title "Harrison Ford Movies, 1980-2000"
           :filename "20161218_harrison_ford_movies.html"
           :section "notes")

(onet-page :title "Software I Love"
           :filename "20161218_software_love.html"
           :section "notes")

(onet-page :title "Worth the Money"
           :filename "20200330_worth_the_money.html"
           :section "notes")

(onet-page :title "Recommended Books"
           :filename "20200531_recommended_books.html"
           :section "notes")

(onet-page :title "Perfection"
           :filename "perfection.html"
           :section "notes")

(onet-page :title "Structured to Innovate"
           :filename "structured-to-innovate.html"
           :section "notes")

(onet-page :title "Writing in Plain Text"
           :filename "writing_in_plain_text.html"
           :section "notes")

(onet-page :title "Revelation of the Complex"
           :filename "20130908_revelation_complex.html"
           :section "notes")

;;; Emacs Pages

(onet-page :title "Emacs Keybindings That Won't Get Overridden by Minor Modes"
           :filename "bosskey-mode.html"
           :section "emacs")

(onet-page :title "Confirm Killing Modified Buffers"
           :filename "buffer-confirm-kill.html"
           :section "emacs")

(onet-page :title "Custom Scratch Buffers"
           :filename "custom-scratch-buffers.html"
           :section "emacs")

(onet-page :title "Extending Emacs Bookmarks to Work With EWW"
           :filename "extending-emacs-bookmarks.html"
           :section "emacs")

(onet-page :title "Keymap Prompts"
           :filename "keymap-prompt.html"
           :section "emacs")

(onet-page :title "Kill Buffer DWIM"
           :filename "kill-buffer-dwim.html"
           :section "emacs")

(onet-page :title "Mark Line and Marking Transient Command"
           :filename "mark-line-transient-command.html"
           :section "emacs")

(onet-page :title "Splitting Windows With the Mouse"
           :filename "mouse-window-splits.html"
           :section "emacs")

(onet-page :title "How Package.el Works with Use Package"
           :filename "notes-on-package-el.html"
           :section "emacs")

(onet-page :title "Quick Help: Emacs as a Text Productivity Platform"
           :filename "quick-help.html"
           :section "emacs")
