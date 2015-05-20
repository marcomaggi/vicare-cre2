/*
  Part of: Vicare/CRE2
  Contents: internal header file
  Date: Wed May 20, 2015

  Abstract

	Internal header file.

  Copyright (C) 2015 Marco Maggi <marco.maggi-ipsu@poste.it>

  This program is  free software: you can redistribute  it and/or modify
  it under the  terms of the GNU General Public  License as published by
  the Free Software Foundation, either version  3 of the License, or (at
  your option) any later version.

  This program  is distributed in the  hope that it will  be useful, but
  WITHOUT   ANY  WARRANTY;   without  even   the  implied   warranty  of
  MERCHANTABILITY  or FITNESS  FOR A  PARTICULAR PURPOSE.   See the  GNU
  General Public License for more details.

  You should  have received  a copy  of the  GNU General  Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef VICARE_CRE2_INTERNALS_H
#define VICARE_CRE2_INTERNALS_H 1


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif
#include <vicare.h>
#include <cre2.h>


/** --------------------------------------------------------------------
 ** Handling of Scheme objects.
 ** ----------------------------------------------------------------- */

/* Accessors for the fields of the Scheme structure "cre2_alpha". */
#define IK_CRE2_ALPHA_POINTER(ALPHA)	IK_FIELD((ALPHA),0)
#define IK_CRE2_ALPHA_OWNER(ALPHA)		IK_FIELD((ALPHA),1)
#define IK_CRE2_ALPHA(ALPHA)	\
  IK_POINTER_DATA_VOIDP(IK_CRE2_ALPHA_POINTER(ALPHA))


/** --------------------------------------------------------------------
 ** Support for missing functions.
 ** ----------------------------------------------------------------- */

static IK_UNUSED void
feature_failure_ (const char * funcname)
{
  ik_abort("called unavailable CRE2 specific function, %s\n", funcname);
}

#define feature_failure(FN)     { feature_failure_(FN); return IK_VOID; }


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#endif /* VICARE_CRE2_INTERNALS_H */

/* end of file */
