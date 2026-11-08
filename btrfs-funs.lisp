;;;; btrfs.lisp

(in-package #:btrfs/c-lib)

(define-foreign-library libbtrfsutil
  (:unix (:default "libbtrfsutil"))
  (t (:default "libbtrfsutil")))

(use-foreign-library libbtrfsutil)

(defcfun "btrfs_util_subvolume_create" btrfs-util-error
  (path :string)
  (flags :int)
  (unused :pointer)
  (qgroup :pointer))

(defcfun "btrfs_util_subvolume_iter_create" btrfs-util-error
  (path :string)
  (top :uint64)
  (flags :int)
  (ret :pointer))

(defcfun "btrfs_util_subvolume_iter_next" btrfs-util-error
  (iter :pointer)
  (path-ret :string)
  (id-ret (:pointer :uint64)))

(defcfun "btrfs_util_destroy_subvolume_iterator" :void
  (iter :pointer))

(defcfun "btrfs_util_strerror" :string
  (err btrfs-util-error))
