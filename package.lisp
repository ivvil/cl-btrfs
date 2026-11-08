;;;; package.lisp

(defpackage #:btrfs
  (:use #:cl)
  (:local-nicknames (:c :btrfs/c-lib)))

(defpackage #:btrfs/c-lib
  (:use #:cl #:cffi)
  (:export #:btrfs-util-subvolume-create
		   #:btrfs-util-subvolume-iter-create
		   #:btrfs-util-subvolume-iter-next
		   #:btrfs-util-destroy-subvolume-iterator
		   #:btrfs-util-strerror

		   #:+btrfs-fs-tree-objectid+
		   #:+btrfs-util-subvolume-iterator-post-order+))
