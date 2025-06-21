;; Platform Operator Verification Contract
;; Manages and validates ride-sharing platform operators

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_REGISTERED (err u101))
(define-constant ERR_NOT_FOUND (err u102))

;; Data maps
(define-map platform-operators principal {
    name: (string-ascii 50),
    license-number: (string-ascii 30),
    is-verified: bool,
    registration-date: uint
})

(define-map operator-stats principal {
    total-drivers: uint,
    total-rides: uint,
    safety-score: uint
})

;; Read-only functions
(define-read-only (get-operator (operator principal))
    (map-get? platform-operators operator)
)

(define-read-only (is-verified-operator (operator principal))
    (match (map-get? platform-operators operator)
        operator-data (get is-verified operator-data)
        false
    )
)

(define-read-only (get-operator-stats (operator principal))
    (map-get? operator-stats operator)
)

;; Public functions
(define-public (register-operator (name (string-ascii 50)) (license-number (string-ascii 30)))
    (let ((operator tx-sender))
        (asserts! (is-none (map-get? platform-operators operator)) ERR_ALREADY_REGISTERED)
        (map-set platform-operators operator {
            name: name,
            license-number: license-number,
            is-verified: false,
            registration-date: block-height
        })
        (map-set operator-stats operator {
            total-drivers: u0,
            total-rides: u0,
            safety-score: u100
        })
        (ok true)
    )
)

(define-public (verify-operator (operator principal))
    (begin
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
        (asserts! (is-some (map-get? platform-operators operator)) ERR_NOT_FOUND)
        (map-set platform-operators operator
            (merge (unwrap-panic (map-get? platform-operators operator))
                   {is-verified: true}))
        (ok true)
    )
)

(define-public (update-operator-stats (operator principal) (drivers uint) (rides uint) (safety uint))
    (begin
        (asserts! (is-verified-operator tx-sender) ERR_UNAUTHORIZED)
        (map-set operator-stats operator {
            total-drivers: drivers,
            total-rides: rides,
            safety-score: safety
        })
        (ok true)
    )
)
