package=libsnark
$(package)_version=0.1
$(package)_download_path=https://github.com/radix42/$(package)/archive/
$(package)_file_name=$(package)-$($(package)_git_commit).tar.gz
$(package)_download_file=$($(package)_git_commit).tar.gz
$(package)_sha256_hash=9dbd5b44d3443e86463e934bfe1023cab4ca5948f8d74c23a67d9535c28d2584
$(package)_git_commit=9be18569b8abcda1245c3912877075259599c0f1

$(package)_dependencies=libgmp libsodium

define $(package)_build_cmds
CC=gcc-5 CXX=g++-5 CXXFLAGS="-arch x86_64 -DBINARY_OUTPUT -DNO_PT_COMPRESSION=1" $(MAKE) lib DEPINST=$(host_prefix) CURVE=ALT_BN128 MULTICORE=0 NO_PROCPS=1 NO_GTEST=1 NO_DOCS=1 STATIC=1 NO_SUPERCOP=1 FEATUREFLAGS=-DMONTGOMERY_OUTPUT
endef

define $(package)_stage_cmds
  $(MAKE) install STATIC=1 DEPINST=$(host_prefix) PREFIX=$($(package)_staging_dir)$(host_prefix) CURVE=ALT_BN128 NO_SUPERCOP=1
endef
