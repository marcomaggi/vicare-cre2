;;;
;;;Part of: Vicare/CRE2
;;;Contents: CRE2 binding backend
;;;Date: Wed May 20, 2015
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (C) 2015 Marco Maggi <marco.maggi-ipsu@poste.it>
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
(library (vicare regexps cre2)
  (foreign-library "vicare-cre2")
  (export

    ;; version numbers and strings
    vicare-cre2-version-interface-current
    vicare-cre2-version-interface-revision
    vicare-cre2-version-interface-age
    vicare-cre2-version

    ;; cre2 alpha struct
    cre2-alpha-initialise
    cre2-alpha-finalise
    cre2-alpha?
    cre2-alpha?/alive		$cre2-alpha-alive?
    cre2-alpha-custom-destructor	set-cre2-alpha-custom-destructor!
    cre2-alpha-putprop		cre2-alpha-getprop
    cre2-alpha-remprop		cre2-alpha-property-list
    cre2-alpha-hash

    cre2-alpha.vicare-arguments-validation
    cre2-alpha/alive.vicare-arguments-validation
    false-or-cre2-alpha.vicare-arguments-validation
    false-or-cre2-alpha/alive.vicare-arguments-validation

;;; --------------------------------------------------------------------
;;; still to be implemented

    )
  (import (vicare)
    (vicare regexps cre2 constants)
    (prefix (vicare regexps cre2 unsafe-capi) capi.)
    #;(prefix (vicare ffi) ffi.)
    (prefix (vicare ffi foreign-pointer-wrapper) ffi.)
    (vicare arguments validation)
    #;(vicare arguments general-c-buffers)
    #;(vicare language-extensions syntaxes)
    #;(prefix (vicare platform words) words.))


;;;; arguments validation

#;(define-argument-validation (fixnum who obj)
  (fixnum? obj)
  (assertion-violation who "expected fixnum as argument" obj))


;;;; version functions

(define (vicare-cre2-version-interface-current)
  (capi.vicare-cre2-version-interface-current))

(define (vicare-cre2-version-interface-revision)
  (capi.vicare-cre2-version-interface-revision))

(define (vicare-cre2-version-interface-age)
  (capi.vicare-cre2-version-interface-age))

(define (vicare-cre2-version)
  (ascii->string (capi.vicare-cre2-version)))


;;;; data structures: alpha

(ffi.define-foreign-pointer-wrapper cre2-alpha
  (ffi.foreign-destructor capi.cre2-alpha-finalise)
  #;(ffi.foreign-destructor #f)
  (ffi.collector-struct-type #f)
  (ffi.collected-struct-type cre2-beta))

(module ()
  (set-rtd-printer! (type-descriptor cre2-alpha)
    (lambda (S port sub-printer)
      (define-inline (%display thing)
	(display thing port))
      (define-inline (%write thing)
	(write thing port))
      (%display "#[cre2-alpha")
      (%display " pointer=")	(%display ($cre2-alpha-pointer  S))
      (%display "]"))))

;;; --------------------------------------------------------------------

(define (cre2-alpha-initialise)
  (define who 'cre2-alpha-initialise)
  (cond ((capi.cre2-alpha-initialise)
	 => (lambda (rv)
	      (make-cre2-alpha/owner rv)))
	(else
	 (error who "unable to create alpha object"))))

(define (cre2-alpha-finalise alpha)
  (define who 'cre2-alpha-finalise)
  (with-arguments-validation (who)
      ((cre2-alpha		alpha))
    ($cre2-alpha-finalise alpha)))


;;;; data structures: beta

(ffi.define-foreign-pointer-wrapper cre2-beta
  (ffi.foreign-destructor #f)
  (ffi.collector-struct-type cre2-alpha))


;;;; done

#| end of library |# )

;;; end of file
;; Local Variables:
;; coding: utf-8-unix
;; eval: (put 'ffi.define-foreign-pointer-wrapper 'scheme-indent-function 1)
;; End:
