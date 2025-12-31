;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — beamdeno

(define-module (beamdeno meta)
  #:export (architecture-decisions development-practices design-rationale))

(define architecture-decisions
  '((adr-001
     (title . "Port-First, Distribution Later")
     (status . "accepted")
     (date . "2025-12-31")
     (context . "Erlang distribution protocol is complex, ports are simpler")
     (decision . "Start with Erlang ports, add distribution protocol in v0.3")
     (consequences . ("Faster initial release" "Requires running erl" "Distribution for advanced users")))

    (adr-002
     (title . "ETF as Wire Format")
     (status . "accepted")
     (date . "2025-12-31")
     (context . "Need to serialize data between Deno and BEAM")
     (decision . "Use Erlang Term Format (ETF) for native BEAM compatibility")
     (consequences . ("Native BEAM types" "Binary efficiency" "Need encoder/decoder")))

    (adr-003
     (title . "Actor Model Mapping")
     (status . "accepted")
     (date . "2025-12-31")
     (context . "BEAM uses actors/processes, JS uses callbacks/promises")
     (decision . "Map BEAM messages to JS event emitters and async iterators")
     (consequences . ("Familiar JS patterns" "Natural async integration" "Some semantic mismatch")))))

(define development-practices
  '((code-style
     (languages . ("TypeScript" "Erlang"))
     (formatter . "deno fmt")
     (linter . "deno lint"))
    (security
     (sast . "CodeQL")
     (credentials . "Erlang cookies handled securely"))
    (testing
     (framework . "Deno.test")
     (integration . "Requires running BEAM node")
     (coverage-minimum . 70))
    (versioning
     (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-etf
     "ETF is BEAM's native format. JSON would require conversion on both sides.")
    (why-ports
     "Ports are well-documented, stable, and don't require distribution cookies.")
    (why-not-nif
     "NIFs require Erlang toolchain. Ports work with just the erl binary.")))
