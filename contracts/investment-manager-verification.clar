;; Investment Manager Verification Contract
;; Validates and manages investment managers

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_INVALID_CREDENTIALS (err u103))

;; Data structures
(define-map verified-managers principal {
    verified: bool,
    verification-date: uint,
    credentials-hash: (buff 32),
    reputation-score: uint
})

(define-map manager-stats principal {
    total-clients: uint,
    total-aum: uint,
    performance-rating: uint
})

;; Public functions
(define-public (verify-manager (manager principal) (credentials-hash (buff 32)))
    (begin
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
        (asserts! (is-none (map-get? verified-managers manager)) ERR_ALREADY_VERIFIED)
        (map-set verified-managers manager {
            verified: true,
            verification-date: block-height,
            credentials-hash: credentials-hash,
            reputation-score: u50
        })
        (ok true)
    )
)

(define-public (update-manager-stats (manager principal) (clients uint) (aum uint) (rating uint))
    (begin
        (asserts! (is-some (map-get? verified-managers manager)) ERR_NOT_FOUND)
        (map-set manager-stats manager {
            total-clients: clients,
            total-aum: aum,
            performance-rating: rating
        })
        (ok true)
    )
)

;; Read-only functions
(define-read-only (is-verified-manager (manager principal))
    (match (map-get? verified-managers manager)
        manager-data (get verified manager-data)
        false
    )
)

(define-read-only (get-manager-info (manager principal))
    (map-get? verified-managers manager)
)

(define-read-only (get-manager-stats (manager principal))
    (map-get? manager-stats manager)
)
