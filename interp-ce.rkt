#lang racket

;; Exercise 3: A CE (Control and Environment) interpreter for Scheme

;; NOTE: You *MAY* collaborate with other students on this exercise,
;; but *not* the later project. Feel free to work with up to two other
;; students (groups of three) and submit the same code as them. Use
;; that code to begin your solution for p3.

;; Name: Christine Hung
;; Collaborator 1: ________________________________
;; Collaborator 2: ________________________________
(provide interp-ce)

; Interp-ce must correctly interpret any valid scheme-ir program and yield the same value
; as DrRacket, except for closures which must be represented as `(closure ,lambda ,environment).
; (+ 1 2) can return 3 and (cons 1 (cons 2 '())) can yield '(1 2). For programs that result in a 
; runtime error, you should return `(error ,message)---giving some reasonable string error message.
; Handling errors and some trickier cases will give bonus points. 
(define (interp-ce exp)
  (define (interp env exp)
    (match exp
      [(or (? number?) (? boolean?)) exp]
      [`(let ([,xs ,rhss] ...) ,body)
       (interp (hash-set env x (interp env rhs)) body)]
      [`(lambda ,args ,body)
       `(closure (lambda (,arg) ,body) ,env)]
      [(? symbol? x)
       (hash-ref env x (lambda () `(error "Undefined variable: " ,x)))]
      [`(if ,ge ,te ,fe)
       (let ((ge-result (interp env ge)))
        (if (eq? ge-result #f)
          (interp env fe)
          (interp env te)))]
      ;; not required, but you may want to add this
      [`(apply-prim ,op ,x)
       (apply (get-primitive-function op) (map (lambda (arg) (interp env arg)) args))]
      [`(,ef ,eargs ...)
       (let* ((func-result (interp env f))
              (arg-values (map (lambda (arg) (interp env arg)) args)))
         (if (and (list? func-result) (eq? (car func-result) 'closure))
             (let ((closure-func (cadr func-result))
                   (closure-env (caddr func-result)))
               (apply closure-func arg-values))
             (apply func-result arg-values)))]))
  (define (get-primitive-function op)
  ;; TODO: update?
  (define starting-env (hash))
  (interp starting-env exp))
