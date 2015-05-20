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
;;;This program is free software: you can  redistribute it and/or modify it under the
;;;terms  of  the GNU  General  Public  License as  published  by  the Free  Software
;;;Foundation,  either version  3  of the  License,  or (at  your  option) any  later
;;;version.
;;;
;;;This program is  distributed in the hope  that it will be useful,  but WITHOUT ANY
;;;WARRANTY; without  even the implied warranty  of MERCHANTABILITY or FITNESS  FOR A
;;;PARTICULAR PURPOSE.  See the GNU General Public License for more details.
;;;
;;;You should have received a copy of  the GNU General Public License along with this
;;;program.  If not, see <http://www.gnu.org/licenses/>.
;;;


#!r6rs
(library (vicare regexps cre2 unsafe-capi (0 4))
  (export

    ;; version functions
    vicare-cre2-version-interface-current
    vicare-cre2-version-interface-revision
    vicare-cre2-version-interface-age
    vicare-cre2-version

    cre2-version-interface-current
    cre2-version-interface-revision
    cre2-version-interface-age

    ;; C API
    cre2-new
    cre2-delete

    cre2-opt-new
    cre2-opt-delete
    cre2-opt-set-posix-syntax
    cre2-opt-posix-syntax

    cre2-opt-set-longest-match
    cre2-opt-longest-match

    cre2-opt-set-log-errors
    cre2-opt-log-errors

    cre2-opt-set-literal
    cre2-opt-literal

    cre2-opt-set-never-nl
    cre2-opt-never-nl

    cre2-opt-set-case-sensitive
    cre2-opt-case-sensitive

    cre2-opt-set-perl-classes
    cre2-opt-perl-classes

    cre2-opt-set-word-boundary
    cre2-opt-word-boundary

    cre2-opt-set-one-line
    cre2-opt-one-line

    cre2-opt-set-max-mem
    cre2-opt-max-mem

    cre2-match)
  (import (vicare))


;;;; version functions

(define-syntax-rule (cre2-version-interface-current)
  (foreign-call "ikrt_vicare_cre2_version_interface_current"))

(define-syntax-rule (cre2-version-interface-revision)
  (foreign-call "ikrt_vicare_cre2_version_interface_revision"))

(define-syntax-rule (cre2-version-interface-age)
  (foreign-call "ikrt_vicare_cre2_version_interface_age"))

;;; --------------------------------------------------------------------

(define-syntax-rule (vicare-cre2-version-interface-current)
  (foreign-call "ikrt_vicare_vicare_cre2_version_interface_current"))

(define-syntax-rule (vicare-cre2-version-interface-revision)
  (foreign-call "ikrt_vicare_vicare_cre2_version_interface_revision"))

(define-syntax-rule (vicare-cre2-version-interface-age)
  (foreign-call "ikrt_vicare_vicare_cre2_version_interface_age"))

(define-syntax-rule (vicare-cre2-version)
  (foreign-call "ikrt_vicare_vicare_cre2_version"))


;;;; C API

(define-syntax-rule (cre2-new pattern options)
  (foreign-call "ikrt_vicare_cre2_new" pattern options))

(define-syntax-rule (cre2-delete pointer)
  (foreign-call "ikrt_vicare_cre2_delete" pointer))

;;; --------------------------------------------------------------------

(define-syntax-rule (cre2-opt-new)
  (foreign-call "ikrt_vicare_cre2_opt_new"))

(define-syntax-rule (cre2-opt-delete pointer)
  (foreign-call "ikrt_vicare_cre2_opt_delete" pointer))

(define-syntax-rule (cre2-opt-set-posix-syntax opt bool)
  (foreign-call "ikrt_vicare_cre2_opt_set_posix_syntax" opt bool))
(define-syntax-rule (cre2-opt-posix-syntax opt)
  (foreign-call "ikrt_vicare_cre2_opt_posix_syntax" opt))

(define-syntax-rule (cre2-opt-set-longest-match opt bool)
  (foreign-call "ikrt_vicare_cre2_opt_set_longest_match" opt bool))
(define-syntax-rule (cre2-opt-longest-match opt)
  (foreign-call "ikrt_vicare_cre2_opt_longest_match" opt))

(define-syntax-rule (cre2-opt-set-log-errors opt bool)
  (foreign-call "ikrt_vicare_cre2_opt_set_log_errors" opt bool))
(define-syntax-rule (cre2-opt-log-errors opt)
  (foreign-call "ikrt_vicare_cre2_opt_log_errors" opt))

(define-syntax-rule (cre2-opt-set-literal opt bool)
  (foreign-call "ikrt_vicare_cre2_opt_set_literal" opt bool))
(define-syntax-rule (cre2-opt-literal opt)
  (foreign-call "ikrt_vicare_cre2_opt_literal" opt))

(define-syntax-rule (cre2-opt-set-never-nl opt bool)
  (foreign-call "ikrt_vicare_cre2_opt_set_never_nl" opt bool))
(define-syntax-rule (cre2-opt-never-nl opt)
  (foreign-call "ikrt_vicare_cre2_opt_never_nl" opt))

(define-syntax-rule (cre2-opt-set-case-sensitive opt bool)
  (foreign-call "ikrt_vicare_cre2_opt_set_case_sensitive" opt bool))
(define-syntax-rule (cre2-opt-case-sensitive opt)
  (foreign-call "ikrt_vicare_cre2_opt_case_sensitive" opt))

(define-syntax-rule (cre2-opt-set-perl-classes opt bool)
  (foreign-call "ikrt_vicare_cre2_opt_set_perl_classes" opt bool))
(define-syntax-rule (cre2-opt-perl-classes opt)
  (foreign-call "ikrt_vicare_cre2_opt_perl_classes" opt))

(define-syntax-rule (cre2-opt-set-word-boundary opt bool)
  (foreign-call "ikrt_vicare_cre2_opt_set_word_boundary" opt bool))
(define-syntax-rule (cre2-opt-word-boundary opt)
  (foreign-call "ikrt_vicare_cre2_opt_word_boundary" opt))

(define-syntax-rule (cre2-opt-set-one-line opt bool)
  (foreign-call "ikrt_vicare_cre2_opt_set_one_line" opt bool))
(define-syntax-rule (cre2-opt-one-line opt)
  (foreign-call "ikrt_vicare_cre2_opt_one_line" opt))

(define-syntax-rule (cre2-opt-set-max-mem opt dim)
  (foreign-call "ikrt_vicare_cre2_opt_set_max_mem" opt dim))
(define-syntax-rule (cre2-opt-max-mem opt)
  (foreign-call "ikrt_vicare_cre2_opt_max_mem" opt))

;;; --------------------------------------------------------------------

(define-syntax-rule (cre2-match rex text start end anchor)
  (foreign-call "ikrt_vicare_cre2_match" rex text start end anchor))


;;;; done

#| end of library |# )

;;; end of file
;; Local Variables:
;; coding: utf-8-unix
;; End:
