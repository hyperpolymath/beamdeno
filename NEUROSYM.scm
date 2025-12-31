;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; NEUROSYM.scm — beamdeno

(define-module (beamdeno neurosym)
  #:export (cognitive-patterns symbolic-structures reasoning-modes))

(define cognitive-patterns
  '((actor-to-promise
     (pattern . "Map BEAM actor messages to JS promises/async iterators")
     (rationale . "JavaScript developers think in async/await, not message passing")
     (application . ("GenServer.call → await" "receive → async iterator"))
     (anti-patterns . ("Exposing raw mailboxes" "Blocking calls")))

    (bidirectional-symmetry
     (pattern . "Both directions use same underlying protocol")
     (rationale . "Reduces complexity, enables code reuse")
     (application . ("ETF codec shared" "Message format identical"))
     (anti-patterns . ("Asymmetric protocols" "Direction-specific hacks")))

    (supervisor-delegation
     (pattern . "BEAM supervises, Deno executes")
     (rationale . "BEAM's supervision trees are battle-tested")
     (application . ("Deno as worker process" "BEAM handles restarts"))
     (anti-patterns . ("Deno supervising BEAM" "No supervision")))))

(define symbolic-structures
  '((etf-terms
     (small-integer . "0-255, 1 byte")
     (integer . "signed 32-bit")
     (atom . "UTF-8 atom, max 255 chars")
     (tuple . "fixed-size container")
     (list . "proper or improper")
     (binary . "byte sequence")
     (map . "key-value pairs"))

    (message-types
     (call . "Synchronous request-response")
     (cast . "Asynchronous fire-and-forget")
     (info . "System information")
     (monitor . "Process monitoring"))

    (connection-states
     (disconnected . "No connection")
     (connecting . "Handshake in progress")
     (connected . "Ready for messages")
     (draining . "Closing gracefully"))))

(define reasoning-modes
  '((protocol-design
     (mode . "Specification-first")
     (process . ("Read ETF spec" "Implement codec" "Test against Erlang"))
     (validation . "Round-trip with actual BEAM node"))

    (supervision-reasoning
     (mode . "Fault-tolerance first")
     (process . ("Identify failure modes" "Design restart strategies" "Test failures"))
     (validation . "System recovers from any single failure"))

    (cross-language-reasoning
     (mode . "Semantic bridging")
     (process . ("Understand BEAM concept" "Find JS equivalent" "Document differences"))
     (validation . "Developer can use without BEAM knowledge"))))
