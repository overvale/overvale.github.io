;;; helper.el --- Helper scripts for olivertaylor.net -*- lexical-binding: t -*-

;; Copyright (C) 2021 Oliver Taylor

;; Author: Oliver Taylor
;; Homepage: https://olivertaylor.net


;;; Commentary

;; This file contains code that makes maintaining olivertaylor.net a little
;; easier. It is only designed to function correctly with my Emacs
;; configuration and on my laptop.


;;; Code

(defvar oht-site-path "~/home/src/olivertaylor/"
  "Path to location of website files.")

(defun oht-insert-html-template ()
  "Inserts the HTML template code for pages on olivertaylor.net."
  (interactive)
  (insert-file (concat oht-site-path "lib/template.html")))

(defun oht-site-find-file ()
  "Find files in my website directory."
  (interactive)
  (find-file-recursively oht-site-path))

(transient-define-prefix oht-site-transient ()
  "Helper transient for editing my HTML files."
  [["olivertaylor.net"
    ("f" "Find site files" oht-site-find-file)
    ("i" "Insert template" oht-insert-html-template)
    ("e" "Org export dispatch" org-export-dispatch)]])


;; end of helper.el
