(require 'ox-publish)
(require 'subr-x)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq
 org-publish-project-alist
 '(("website-org"
    :base-directory "./content"  ;; This is where our files live
    :base-extension "org" ;; Publish only from org files
    :publishing-directory "./docs" ;; This is where the published files go
    :recursive t 
    :publishing-function org-html-publish-to-html
    :section-numbers nil
    :with-broken-links nil
    :with-toc nil
    :with-title t
    :with-author t
    :with-special-strings t
    :with-smart-quotes t
    :with-emphasize t
    :html-head-include-default-style nil
    :html-head-include-scripts nil 
          :html-head "<link rel=\"stylesheet\" href=\"/css/main.css\"><link href=\"https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital,wght@0,400;0,700;1,400;1,700&family=B612:wght@300..700&display=swap\" rel=\"stylesheet\"><script src=\"/js/collapsibility.js\"></script>"
          :html-preamble nil
          :html-postamble-format (("en" "Created by %c.  Last modified: %C."))
          :html-postamble t
          )
         ("website-static"
          :base-directory "./content"
          :base-extension ".*"
          :exclude "\#.*\\|.*\.org"
          :publishing-directory "./docs"
          :recursive t
          :publishing-function org-publish-attachment
	  )
         )
 make-backup-files nil
 noninteractive t)

(message "Starting now")
(org-publish-all)
(message "Done!")

