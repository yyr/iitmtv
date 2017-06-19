;; (setq custom-file "~/git/monsoon_portal/tmp/emacs-custom.el")
;; (load custom-file)

(setq debug-on-error t)

(add-to-list 'load-path "~/.emacs.d/el-get/org-mode/lisp/")
(add-to-list 'load-path "~/.emacs.d/el-get/org-mode/contrib/lisp/")

(show-paren-mode 1)
(menu-bar-mode 0)
(set-face-foreground 'font-lock-keyword-face "DeepSkyBlue1")
(set-face-foreground 'font-lock-string-face "Goldenrod")

(require 'org)
(require 'htmlize)
;; to have things work correctly in batch-mode
(require 'font-lock)
(require 'cc-mode)
(require 'ox-org)
(c-after-font-lock-init)

(setq make-backup-files nil
      vc-handled-backends nil)

(setq org-export-default-language "en"
      org-export-html-extension "html"
      org-export-with-timestamps nil
      org-export-with-section-numbers nil
      org-export-with-tags 'not-in-toc
      org-export-skip-text-before-1st-heading nil
      org-export-with-sub-superscripts '{}
      org-export-with-LaTeX-fragments t
      org-export-with-archived-trees nil
      org-export-highlight-first-table-line t
      org-export-latex-listings-w-names nil
      org-html-head-include-default-style nil
      org-html-head ""
      org-export-htmlize-output-type 'css
      org-startup-folded nil
      org-export-allow-BIND t
      org-publish-list-skipped-files t
      org-publish-use-timestamps-flag t
      org-export-babel-evaluate nil
      org-confirm-babel-evaluate nil
      org-export-with-broken-links t)

(eval-after-load "org-html"
  '(setq org-html-scripts
         (concat org-html-scripts "\n"
	         "<script type=\"text/javascript\">
    function rpl(expr,a,b) {
      var i=0
      while (i!=-1) {
         i=expr.indexOf(a,i);
         if (i>=0) {
            expr=expr.substring(0,i)+b+expr.substring(i+a.length);
            i+=b.length;
         }
      }
      return expr
    }

    function show_org_source(){
       document.location.href = rpl(document.location.href,\"html\",\"org.html\");
    }
</script>
")))

;; re-export everything regardless of whether or not it's been modified
;; (setq org-publish-use-timestamps-flag nil)

(setq mon-base "~/git/monsoon_portal/site/")
(setq mon-htmlroot "~/git/monsoon_portal/out/")
(setq mon-base-directory mon-base)
(setq mon-base-style-directory (concat mon-base "style/"))
(setq mon-base-code-directory (concat mon-base "code/"))
(setq mon-base-color-themes-directory (concat mon-base "color-themes/"))
(setq mon-base-images-directory (concat mon-base "images/"))
(setq mon-publish-directory mon-htmlroot)
(setq mon-publish-style-directory (concat mon-htmlroot "style/"))

(defun set-org-publish-project-alist ()
  "Set publishing projects for Orgweb and Mon."
  (interactive)
  (setq org-publish-project-alist
	`(("mon" :components ("mon-pages" "mon-images"))
          ("mon-pages"
	   :base-directory ,mon-base-directory
	   :base-extension "org"
	   :exclude "FIXME"
	   :makeindex t
           :auto-sitemap nil
	   :sitemap-ignore-case t
	   :html-extension "html"
	   :publishing-directory ,mon-publish-directory
	   :publishing-function (org-html-publish-to-html org-org-publish-to-org)
	   :htmlized-source t
	   :section-numbers nil
	   :table-of-contents nil
           :recursive t
           :style "<link rel=\"stylesheet\"
                     href=\"./org.css\"
                     type=\"text/css\"/>")
          ("mon-images"
	   :base-directory ,mon-base-directory
	   :base-extension "png\\|jpg\\|gif\\|pdf\\|csv\\|css\\|tex"
	   :publishing-directory ,mon-publish-directory
	   :recursive t
	   :publishing-function org-publish-attachment))))


(set-org-publish-project-alist)

(defun publish-mon nil
  "Publish Mon."
  (interactive)
  (let ((org-format-latex-signal-error nil)
	(mon-base-directory mon-base)
	(mon-base-code-directory (concat mon-base "code/"))
	(mon-base-color-themes-directory (concat mon-base "color-themes/"))
	(mon-base-images-directory (concat mon-base "images/"))
	(mon-publish-directory mon-htmlroot))
    (set-org-publish-project-alist)
    (message "Emacs %s" emacs-version)
    (org-version)
    (org-publish-project "mon")))

(publish-mon)
