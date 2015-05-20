;;;
;;;Part of: Vicare/CRE2
;;;Contents: unsafe interface to the C language API
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
;;;MERCHANTABILITY or  FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
;;;General Public License for more details.
;;;
;;;You should  have received a  copy of  the GNU General  Public License
;;;along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;


#!r6rs
(library (vicare regexps cre2 unsafe-capi)
  (export

    ;; version functions
    vicare-cre2-version-interface-current
    vicare-cre2-version-interface-revision
    vicare-cre2-version-interface-age
    vicare-cre2-version

    ;; cre2 alpha
    cre2-alpha-initialise
    cre2-alpha-finalise

;;; --------------------------------------------------------------------
;;; still to be implemented

    )
  (import (vicare))


;;;; version functions

(define-syntax-rule (vicare-cre2-version-interface-current)
  (foreign-call "ikrt_cre2_version_interface_current"))

(define-syntax-rule (vicare-cre2-version-interface-revision)
  (foreign-call "ikrt_cre2_version_interface_revision"))

(define-syntax-rule (vicare-cre2-version-interface-age)
  (foreign-call "ikrt_cre2_version_interface_age"))

(define-syntax-rule (vicare-cre2-version)
  (foreign-call "ikrt_cre2_version"))


;;;; cre2 alpha struct

(define-syntax-rule (cre2-alpha-initialise)
  (foreign-call "ikrt_cre2_alpha_initialise"))

(define-syntax-rule (cre2-alpha-finalise alpha)
  (foreign-call "ikrt_cre2_alpha_finalise" alpha))


;;;; still to be implemented

#;(define-syntax-rule (vicare-cre2)
  (foreign-call "ikrt_cre2"))


;;;; done

#| end of library |# )

;;; end of file
;; Local Variables:
;; coding: utf-8-unix
;; End:
