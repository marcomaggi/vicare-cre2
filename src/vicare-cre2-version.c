/*
  Part of: Vicare/CRE2
  Contents: CRE2 for Vicare
  Date: Wed May 20, 2015

  Abstract

	Version functions.

  Copyright (C) 2015 Marco Maggi <marco.maggi-ipsu@poste.it>

  This program is  free software: you can redistribute  it and/or modify
  it under the  terms of the GNU General Public  License as published by
  the Free Software Foundation, either  version 3 of the License, or (at
  your option) any later version.

  This program  is distributed in the  hope that it will  be useful, but
  WITHOUT   ANY  WARRANTY;   without  even   the  implied   warranty  of
  MERCHANTABILITY  or FITNESS  FOR A  PARTICULAR PURPOSE.   See  the GNU
  General Public License for more details.

  You  should have received  a copy  of the  GNU General  Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include "vicare-cre2-internals.h"


/** --------------------------------------------------------------------
 ** Version functions for Vicare/CRE2.
 ** ----------------------------------------------------------------- */

ikptr
ikrt_vicare_vicare_cre2_version_interface_current (void)
{
  return IK_FIX(vicare_cre2_VERSION_INTERFACE_CURRENT);
}
ikptr
ikrt_vicare_vicare_cre2_version_interface_revision (void)
{
  return IK_FIX(vicare_cre2_VERSION_INTERFACE_REVISION);
}
ikptr
ikrt_vicare_vicare_cre2_version_interface_age (void)
{
  return IK_FIX(vicare_cre2_VERSION_INTERFACE_AGE);
}
ikptr
ikrt_vicare_vicare_cre2_version (ikpcb * pcb)
{
  return ika_bytevector_from_cstring(pcb, vicare_cre2_VERSION_INTERFACE_STRING);
}


/** --------------------------------------------------------------------
 ** Version functions for CRE2.
 ** ----------------------------------------------------------------- */

ikptr
ikrt_vicare_cre2_version_interface_current (void)
{
#ifdef HAVE_CRE2_VERSION_INTERFACE_CURRENT
  return IK_FIX(cre2_version_interface_current());
#else
  feature_failure(__func__);
#endif
}
ikptr
ikrt_vicare_cre2_version_interface_revision (void)
{
#ifdef HAVE_CRE2_VERSION_INTERFACE_REVISION
  return IK_FIX(cre2_version_interface_revision());
#else
  feature_failure(__func__);
#endif
}
ikptr
ikrt_vicare_cre2_version_interface_age (void)
{
#ifdef HAVE_CRE2_VERSION_INTERFACE_AGE
  return IK_FIX(cre2_version_interface_age());
#else
  feature_failure(__func__);
#endif
}

/* end of file */
