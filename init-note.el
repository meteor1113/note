;;
;; Copyright (C) 2009 Meteor Liu
;;
;; This code has been released into the Public Domain.
;; You may do whatever you like with it.
;;
;; @file
;; @author Meteor Liu <meteor1113@gmail.com>
;; @date 2009-07-26


(when (require 'org-publish nil t)
  (let* ((dir (file-name-directory (or load-file-name (buffer-file-name))))
         (par-dir (directory-file-name
                   (file-name-directory (directory-file-name dir))))
         (pub-dir (expand-file-name "website" par-dir)))
    (setq org-publish-project-alist
          `(("note-org"
             :base-directory ,dir
             :publishing-directory ,pub-dir
             :base-extension "org"
             :recursive t
             :publishing-function org-publish-org-to-html
             :auto-index t
             :index-filename "index.org"
             :index-title "index"
             :link-home "index.html")
            ("note-static"
             :base-directory ,dir
             :publishing-directory ,pub-dir
             :recursive t
             :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
             :exclude "init-note.el"
             :publishing-function org-publish-attachment)
            ("note" :components ("note-org" "note-static"))))))


(provide 'init-note)
