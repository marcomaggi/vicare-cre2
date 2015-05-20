## dependencies.make --
#
# Automatically built.

EXTRA_DIST +=  \
	lib/vicare/regexps/cre2/constants.vicare.sls.in

lib/vicare/regexps/cre2.fasl: \
		lib/vicare/regexps/cre2.vicare.sls \
		lib/vicare/regexps/cre2/constants.fasl \
		lib/vicare/regexps/cre2/unsafe-capi.fasl \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_regexps_cre2_fasldir = $(bundledlibsdir)/vicare/regexps
lib_vicare_regexps_cre2_vicare_slsdir  = $(bundledlibsdir)/vicare/regexps
nodist_lib_vicare_regexps_cre2_fasl_DATA = lib/vicare/regexps/cre2.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_regexps_cre2_vicare_sls_DATA = lib/vicare/regexps/cre2.vicare.sls
endif
EXTRA_DIST += lib/vicare/regexps/cre2.vicare.sls
CLEANFILES += lib/vicare/regexps/cre2.fasl

lib/vicare/regexps/cre2/constants.fasl: \
		lib/vicare/regexps/cre2/constants.vicare.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_regexps_cre2_constants_fasldir = $(bundledlibsdir)/vicare/regexps/cre2
lib_vicare_regexps_cre2_constants_vicare_slsdir  = $(bundledlibsdir)/vicare/regexps/cre2
nodist_lib_vicare_regexps_cre2_constants_fasl_DATA = lib/vicare/regexps/cre2/constants.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_regexps_cre2_constants_vicare_sls_DATA = lib/vicare/regexps/cre2/constants.vicare.sls
endif
CLEANFILES += lib/vicare/regexps/cre2/constants.fasl

lib/vicare/regexps/cre2/unsafe-capi.fasl: \
		lib/vicare/regexps/cre2/unsafe-capi.vicare.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_regexps_cre2_unsafe_capi_fasldir = $(bundledlibsdir)/vicare/regexps/cre2
lib_vicare_regexps_cre2_unsafe_capi_vicare_slsdir  = $(bundledlibsdir)/vicare/regexps/cre2
nodist_lib_vicare_regexps_cre2_unsafe_capi_fasl_DATA = lib/vicare/regexps/cre2/unsafe-capi.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_regexps_cre2_unsafe_capi_vicare_sls_DATA = lib/vicare/regexps/cre2/unsafe-capi.vicare.sls
endif
EXTRA_DIST += lib/vicare/regexps/cre2/unsafe-capi.vicare.sls
CLEANFILES += lib/vicare/regexps/cre2/unsafe-capi.fasl

lib/vicare/regexps/cre2/features.fasl: \
		lib/vicare/regexps/cre2/features.vicare.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_regexps_cre2_features_fasldir = $(bundledlibsdir)/vicare/regexps/cre2
lib_vicare_regexps_cre2_features_vicare_slsdir  = $(bundledlibsdir)/vicare/regexps/cre2
nodist_lib_vicare_regexps_cre2_features_fasl_DATA = lib/vicare/regexps/cre2/features.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_regexps_cre2_features_vicare_sls_DATA = lib/vicare/regexps/cre2/features.vicare.sls
endif
CLEANFILES += lib/vicare/regexps/cre2/features.fasl


### end of file
# Local Variables:
# mode: makefile-automake
# End:
