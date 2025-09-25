lib.name = wiimote
class.sources = \
	wiimote.c \
	$(empty)

datafiles = \
	$(wildcard *.pd) \
	README \
	CHANGES \
	LICENSE \
	$(empty)

datadirs = \
	$(empty)

PKG_CONFIG ?= pkg-config
CWIID_CFLAGS := $(shell $(PKG_CONFIG) --cflags cwiid)
CWIID_LIBS := $(shell $(PKG_CONFIG) --libs cwiid)

cflags = $(CWIID_CFLAGS)
ldlibs = $(CWIID_LIBS)

PDLIBBUILDER_DIR=pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder
