(use-modules (haunt asset)
             (haunt site)
             (haunt builder blog)
             (haunt builder atom)
             (haunt builder assets)
             (haunt post)
             (haunt reader)
             (haunt reader skribe)
             (theme)
             (utils))

(define (japanese posts)
  "Returns POSTS with japanese tag."
  (posts/reverse-chronological
   (filter (lambda (p)
             (member "japanese" (post-tags p)))
           posts)))

(define (no-japanese posts)
  "Returns POSTS without japanese tag."
  (posts/reverse-chronological
   (filter (lambda (p)
             (not (member "japanese" (post-tags p))))
           posts)))

(site #:title ".dot life"
      #:domain "p-snow.org"
      #:default-metadata
      '((author . "p-snow")
        (email  . "public@p-snow.org"))
      #:readers (list html-reader)
      #:builders (list (blog #:theme p-snow-theme
                             #:collections `(("Recent Posts" "index.html" ,no-japanese)))
                       (blog #:theme p-snow-theme
                             #:collections `(("最新の記事" "index-ja.html" ,japanese)))
                       (atom-feed)
                       (atom-feeds-by-tag)
                       (static-directory "css")
                       (static-directory "images")))
