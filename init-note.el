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
  (let* ((ndir (file-name-directory (or load-file-name (buffer-file-name))))
         (pardir (directory-file-name
                  (file-name-directory (directory-file-name ndir))))
         (pdir (expand-file-name "website" pardir)))
    (setq org-publish-project-alist
          `(("note-org"
             :base-directory ,ndir
             :publishing-directory ,pdir
             :base-extension "org"
             :recursive t
             :publishing-function org-publish-org-to-html
             :auto-index t
             :index-filename "index.org"
             :index-title "index"
             :link-home "index.html")
            ("note-static"
             :base-directory ,ndir
             :publishing-directory ,pdir
             :recursive t
             :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
             :exclude "init-note.el"
             :publishing-function org-publish-attachment)
            ("note" :components ("note-org" "note-static"))))))


(provide 'init-note)
