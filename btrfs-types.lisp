(in-package #:btrfs/c-lib)

(include "btrfsutil.h")

;; (constant (+btrfs-fs-tree-objectid+ "BTRFS_FS_TREE_OBJECTID"))

(constant (+btrfs-util-subvolume-iterator-post-order+ "BTRFS_UTIL_SUBVOLUME_ITERATOR_POST_ORDER"))

(cenum btrfs-util-error
	   ((:ok						"BTRFS_UTIL_OK"))
	   ((:stop-iteration			"BTRFS_UTIL_ERROR_STOP_ITERATION"))
	   ((:no-memory					"BTRFS_UTIL_ERROR_NO_MEMORY"))
	   ((:invalid-argument			"BTRFS_UTIL_ERROR_INVALID_ARGUMENT"))
	   ((:not-btrfs					"BTRFS_UTIL_ERROR_NOT_BTRFS"))
	   ((:not-subvolume				"BTRFS_UTIL_ERROR_NOT_SUBVOLUME"))
	   ((:subvolume-not-found		"BTRFS_UTIL_ERROR_SUBVOLUME_NOT_FOUND"))
	   ((:open-failed				"BTRFS_UTIL_ERROR_OPEN_FAILED"))
	   ((:rmdir-failed				"BTRFS_UTIL_ERROR_RMDIR_FAILED"))
	   ((:unlink-failed				"BTRFS_UTIL_ERROR_UNLINK_FAILED"))
	   ((:stat-failed				"BTRFS_UTIL_ERROR_STAT_FAILED"))
	   ((:statfs-failed				"BTRFS_UTIL_ERROR_STATFS_FAILED"))
	   ((:search-failed				"BTRFS_UTIL_ERROR_SEARCH_FAILED"))
	   ((:ino-lookup-failed			"BTRFS_UTIL_ERROR_INO_LOOKUP_FAILED"))
	   ((:subvol-getflags-failed	"BTRFS_UTIL_ERROR_SUBVOL_GETFLAGS_FAILED"))
	   ((:subvol-setflags-failed	"BTRFS_UTIL_ERROR_SUBVOL_SETFLAGS_FAILED"))
	   ((:subvol-create-failed		"BTRFS_UTIL_ERROR_SUBVOL_CREATE_FAILED"))
	   ((:snap-create-failed		"BTRFS_UTIL_ERROR_SNAP_CREATE_FAILED"))
	   ((:snap-destroy-failed		"BTRFS_UTIL_ERROR_SNAP_DESTROY_FAILED"))
	   ((:default-subvol-failed		"BTRFS_UTIL_ERROR_DEFAULT_SUBVOL_FAILED"))
	   ((:sync-failed				"BTRFS_UTIL_ERROR_SYNC_FAILED"))
	   ((:start-sync-failed			"BTRFS_UTIL_ERROR_START_SYNC_FAILED"))
	   ((:wait-sync-failed			"BTRFS_UTIL_ERROR_WAIT_SYNC_FAILED"))
	   ((:get-subvol-info-failed	"BTRFS_UTIL_ERROR_GET_SUBVOL_INFO_FAILED"))
	   ((:get-subvol-rootref-failed "BTRFS_UTIL_ERROR_GET_SUBVOL_ROOTREF_FAILED"))
	   ((:ino-lookup-user-failed	"BTRFS_UTIL_ERROR_INO_LOOKUP_USER_FAILED"))
	   ((:fs-info-failed			"BTRFS_UTIL_ERROR_FS_INFO_FAILED")))



