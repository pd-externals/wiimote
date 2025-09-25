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


wiimote.version := $(shell sed -n \
    's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
    wiimote-meta.pd)

cflags = $(CWIID_CFLAGS) -DVERSION='"$(wiimote.version)"'
ldlibs = $(CWIID_LIBS)

PDLIBBUILDER_DIR=pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder
