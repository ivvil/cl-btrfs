(in-package #:btrfs)

(define-condition btrfs-error (error)
  ((code
	:initarg :code
	:reader btrfs-error-code
	:type keyword))
  (:report (lambda (condition stream)
			 (format stream "libbtrfsutil error: ~a"
					 (c:btrfs-util-strerror (btrfs-error-code condition)))))
  (:documentation "Signalled when a libbtrfs operation return other than BTRFS_UTIL_OK (or a documented value). CODE holds the keyword"))

(defun signal-err (code)
  (error 'btrfs-error :code code))

(defun btrfs-expect-ok (code)
  (unless (eq code :ok)
	(signal-err code)))


(defmacro with-subvolume-iterator ((iterator path &key (top 0) post-order)
								   &body body)
  "Binds ITERATOR to a subvolume iterator over the subtree TOP on the filesistem at PATH"
  (let ((slot (gensym "ITERATOR-SLOT"))
		(flags (gensym "FLAGS")))
	`(cffi:with-foreign-object (,slot :pointer)
	   (let ((,iterator (cffi:null-pointer))
			 (,flags (if ,post-order
						 c:+btrfs-util-subvolume-iterator-post-order+
						 0)))
		 (unwind-protect
			  (progn
				(btrfs-expect-ok (c:btrfs-util-subvolume-iter-create
								  ,path
								  ,top
								  ,flags
								  ,slot))
				(setf ,iterator (cffi:mem-ref ,slot :pointer))
				,@body)
		   (unless (cffi:null-pointer-p ,iterator)
			 (c:btrfs-util-destroy-subvolume-iterator ,iterator)))))))

(defun next-subvolume (iterator)
  (cffi:with-foreign-objects ((path-slot :pointer) (id-slot :uint64))
	(setf (cffi:mem-ref path-slot :pointer) (cffi:null-pointer))
	(let ((code (c:btrfs-util-subvolume-iter-next iterator path-slot id-slot)))
	  (case code
		(:ok (let ((p (cffi:mem-ref path-slot :pointer)))
			   (unwind-protect
					(values (cffi:mem-ref id-slot :uint64)
							(cffi:foreign-string-to-lisp p))
				 (cffi:foreign-free p))))
		(:stop-iteration nil)
		(otherwise (signal-err code))))))

(defun get-subvoulmes (path &key (top 0) post-order)
  (with-subvolume-iterator (i path :top top :post-order post-order)
	(loop for (id subvol-path) = (multiple-value-list (next-subvolume i))
		  while id
		  collect (cons id subvol-path))))

