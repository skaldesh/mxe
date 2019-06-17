# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtimageformats
$(PKG)_WEBSITE  := https://www.qt.io/
$(PKG)_DESCR    := Qt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := 2dee25c3eea90d172cbd40f41450153322b902da1daa7d2370a55124b2307bb3
$(PKG)_SUBDIR    = $(subst qtbase,qtimageformats,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtimageformats,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtimageformats,$(qtbase_URL))
$(PKG)_DEPS     := cc jasper libmng libwebp qtbase tiff

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
