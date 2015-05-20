## dependencies.make --
#
# Automatically built.

lib/vicare/regexps/cre2.fasl: \
		lib/vicare/regexps/cre2.vicare.sls \
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


### end of file
# Local Variables:
# mode: makefile-automake
# End:
