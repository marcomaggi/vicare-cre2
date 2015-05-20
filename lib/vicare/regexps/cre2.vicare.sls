;;;
;;;Part of: Vicare/CRE2
;;;Contents: CRE2 binding backend
;;;Date: Wed May 20, 2015
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (C) 2012-2015 Marco Maggi <marco.maggi-ipsu@poste.it>
;;;
;;;This program is free software:  you can redistribute it and/or modify
;;;it under the terms of the  GNU General Public License as published by
;;;the Free Software Foundation, either version 3 of the License, or (at
;;;your option) any later version.
;;;
;;;This program is  distributed in the hope that it  will be useful, but
;;;WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
;;;MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
;;;General Public License for more details.
;;;
;;;You should  have received  a copy of  the GNU General  Public License
;;;along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;


#!vicare
(library (vicare regexps cre2 (0 4))
  (foreign-library "vicare-cre2")
  (export

    ;; version functions
    vicare-cre2-version-interface-current
    vicare-cre2-version-interface-revision
    vicare-cre2-version-interface-age
    vicare-cre2-version

    cre2-version-interface-current
    cre2-version-interface-revision
    cre2-version-interface-age

    ;; precompiled regular expressions
    (rename (%make-regexp	make-regexp))
    delete-regexp
    regexp?

    ;; precompiled configuration options
    (rename (%make-options	make-options))
    delete-options
    options?
    set-posix-syntax!		posix-syntax?
    set-longest-match!		longest-match?
    set-log-errors!		log-errors?
    set-literal!		literal?
    set-never-nl!		never-nl?
    set-case-sensitive!		case-sensitive?
    set-perl-classes!		perl-classes?
    set-word-boundary!		word-boundary?
    set-one-line!		one-line?
    set-max-mem!		max-mem

    ;; matching regular expressions
    match)
  (import (vicare)
    (prefix (vicare regexps cre2 unsafe-capi) capi.)
    (prefix (vicare platform words) words.))


;;;; helpers

(define-syntax with-bytevectors
  (syntax-rules ()
    ((_ ((?value.bv ?value) ...) . ?body)
     (let ((?value.bv (if (bytevector? ?value)
			  ?value
			(string->utf8 ?value)))
	   ...)
       . ?body))))



;;; arguments validation

(define (false? obj)
  (not obj))

(define (positive-signed-int? obj)
  (and (words.signed-int? obj)
       (positive? obj)))


;;;; version functions

(define (cre2-version-interface-current)
  (capi.cre2-version-interface-current))

(define (cre2-version-interface-revision)
  (capi.cre2-version-interface-revision))

(define (cre2-version-interface-age)
  (capi.cre2-version-interface-age))

;;;

(define (vicare-cre2-version-interface-current)
  (capi.vicare-cre2-version-interface-current))

(define (vicare-cre2-version-interface-revision)
  (capi.vicare-cre2-version-interface-revision))

(define (vicare-cre2-version-interface-age)
  (capi.vicare-cre2-version-interface-age))

(define (vicare-cre2-version)
  (ascii->string (capi.vicare-cre2-version)))


;;;; precompiled regular expressions

(define-struct regexp
  (pointer))

(define (%struct-regexp-printer S port sub-printer)
  (define-inline (%display thing)
    (display thing port))
  (%display "#[re2-regexp")
  (%display " pointer=")	(%display (regexp-pointer S))
  (%display "]"))

(define regexp-guardian
  (make-guardian))

(define (%free-allocated-regexp)
  (do ((S (regexp-guardian) (regexp-guardian)))
      ((not S))
    (capi.cre2-delete (regexp-pointer S))))

(case-define* %make-regexp
  ((pattern)
   (%make-regexp pattern #f))
  (({pattern (or string? bytevector?)} {opts (or false? options?)})
   (with-bytevectors ((pattern.bv pattern))
     (let ((rv (capi.cre2-new pattern.bv (if opts
					     (options-pointer opts)
					   (null-pointer)))))
       (cond ((pointer? rv)
	      (regexp-guardian (make-regexp rv)))
	     ((not rv)
	      (error __who__
		"memory allocation error while building RE2 regular expression"
		pattern opts))
	     (else
	      (error __who__
		(latin1->string (cdr rv))
		(car rv) pattern opts))))))
  #| end of CASE-DEFINE* |# )

(define* (delete-regexp {rex regexp?})
  (capi.cre2-delete (regexp-pointer rex)))


;;;; configuration options

(define-struct options
  (pointer))

(define (%struct-options-printer S port sub-printer)
  (define-inline (%display thing)
    (display thing port))
  (let ((P (options-pointer S)))
    (%display "#[re2-options")
    (%display " pointer=")		(%display P)
    (%display " posix-syntax?=")	(%display (capi.cre2-opt-posix-syntax P))
    (%display " longest-match?=")	(%display (capi.cre2-opt-longest-match P))
    (%display " log-errors?=")		(%display (capi.cre2-opt-log-errors P))
    (%display " literal?=")		(%display (capi.cre2-opt-literal P))
    (%display " never-nl?=")		(%display (capi.cre2-opt-never-nl P))
    (%display " case-sensitive?=")	(%display (capi.cre2-opt-case-sensitive P))
    (%display " perl-classes?=")	(%display (capi.cre2-opt-perl-classes P))
    (%display " word-boundary?=")	(%display (capi.cre2-opt-word-boundary P))
    (%display " one-line?=")		(%display (capi.cre2-opt-one-line P))
    (%display " max-mem=")		(%display (capi.cre2-opt-max-mem P))
    (%display "]")))

(define options-guardian
  (make-guardian))

(define (%free-allocated-options)
  (do ((S (options-guardian) (options-guardian)))
      ((not S))
    (capi.cre2-opt-delete (options-pointer S))))

(define* (%make-options)
  (let ((rv (capi.cre2-opt-new)))
    (if (pointer-null? rv)
	(error __who__ "memory allocation error while building RE2 options object")
      (options-guardian (make-options rv)))))

(define* (delete-options {opts options?})
  (capi.cre2-opt-delete (options-pointer opts)))

;;; --------------------------------------------------------------------

(let-syntax
    ((define-option-setter (syntax-rules ()
			     ((_ ?name ?who ?func)
			      (define* (?name {opt options?} bool)
				(?func (options-pointer opt) bool)))
			     )))
  (define-option-setter set-posix-syntax!
    cre2.set-posix-syntax!
    capi.cre2-opt-set-posix-syntax)
  (define-option-setter set-longest-match!
    cre2.set-longest-match!
    capi.cre2-opt-set-longest-match)
  (define-option-setter set-log-errors!
    cre2.set-log-errors!
    capi.cre2-opt-set-log-errors)
  (define-option-setter set-literal!
    cre2.set-literal!
    capi.cre2-opt-set-literal)
  (define-option-setter set-never-nl!
    cre2.set-never-nl!
    capi.cre2-opt-set-never-nl)
  (define-option-setter set-case-sensitive!
    cre2.set-case-sensitive!
    capi.cre2-opt-set-case-sensitive)
  (define-option-setter set-perl-classes!
    cre2.set-perl-classes!
    capi.cre2-opt-set-perl-classes)
  (define-option-setter set-word-boundary!
    cre2.set-word-boundary!
    capi.cre2-opt-set-word-boundary)
  (define-option-setter set-one-line!
    cre2.set-one-line!
    capi.cre2-opt-set-one-line))

(let-syntax
    ((define-option-getter (syntax-rules ()
			     ((_ ?name ?who ?func)
			      (define* (?name {opt options?})
				(?func (options-pointer opt))))
			     )))
  (define-option-getter posix-syntax?
    cre2.posix-syntax?
    capi.cre2-opt-posix-syntax)
  (define-option-getter longest-match?
    cre2.longest-match?
    capi.cre2-opt-longest-match)
  (define-option-getter log-errors?
    cre2.log-errors?
    capi.cre2-opt-log-errors)
  (define-option-getter literal?
    cre2.literal?
    capi.cre2-opt-literal)
  (define-option-getter never-nl?
    cre2.never-nl?
    capi.cre2-opt-never-nl)
  (define-option-getter case-sensitive?
    cre2.case-sensitive?
    capi.cre2-opt-case-sensitive)
  (define-option-getter perl-classes?
    cre2.perl-classes?
    capi.cre2-opt-perl-classes)
  (define-option-getter word-boundary?
    cre2.word-boundary?
    capi.cre2-opt-word-boundary)
  (define-option-getter one-line?
    cre2.one-line?
    capi.cre2-opt-one-line))

;;; --------------------------------------------------------------------

(define* (set-max-mem! {opt options?} {dim positive-signed-int?})
  (capi.cre2-opt-set-max-mem (options-pointer opt) dim))

(define* (max-mem {opt options?})
  (capi.cre2-opt-max-mem (options-pointer opt)))


;;;; matching regular expressions

(define* (match {rex regexp?} {text (or string? bytevector?)}
		{start (or false? non-negative-fixnum?)}
		{end   (or false? non-negative-fixnum?)}
		{anchor symbol?})
  (with-bytevectors ((text.bv text))
    (let ((start	(or start 0))
	  (end		(or end   (bytevector-length text.bv)))
	  (anchor	(case anchor
			  ((unanchored)		0)
			  ((start)		1)
			  ((both)		2)
			  (else
			   (assertion-violation __who__ "invalid anchor argument" anchor)))))
      (capi.cre2-match (regexp-pointer rex) text.bv start end anchor))))


;;;; done

(post-gc-hooks (cons* %free-allocated-regexp
		      %free-allocated-options
		      (post-gc-hooks)))

(set-rtd-printer! (type-descriptor regexp)  %struct-regexp-printer)
(set-rtd-printer! (type-descriptor options) %struct-options-printer)

#| end of library |# )

;;; end of file
;; Local Variables:
;; eval: (put 'with-bytevectors 'scheme-indent-function 1)
;; End:



;;;; done

#| end of library |# )

;;; end of file
;; Local Variables:
;; coding: utf-8-unix
;; eval: (put 'ffi.define-foreign-pointer-wrapper 'scheme-indent-function 1)
;; eval: (put 'with-bytevectors 'scheme-indent-function 1)
;; End:
