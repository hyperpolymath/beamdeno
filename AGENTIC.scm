;; SPDX-License-Identifier: PMPL-1.0
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; AGENTIC.scm — beamdeno

(define-module (beamdeno agentic)
  #:export (agent-capabilities autonomy-levels decision-boundaries))

(define agent-capabilities
  '((etf-codec
     (description . "Agent can work on ETF encoder/decoder implementation")
     (scope . ("Implement term types" "Add test cases" "Optimize encoding"))
     (limitations . ("Cannot change wire format" "Must follow ETF spec")))

    (protocol-implementation
     (description . "Agent can implement BEAM communication protocols")
     (scope . ("Port communication" "Message serialization" "Connection handling"))
     (limitations . ("Cannot modify BEAM side without Erlang expertise" "Security-sensitive")))

    (erlang-code
     (description . "Agent can write Erlang/Elixir library code")
     (scope . ("Supervisor trees" "GenServer implementations" "Port handlers"))
     (limitations . ("Limited OTP pattern expertise" "Human review recommended")))

    (test-infrastructure
     (description . "Agent can set up test infrastructure")
     (scope . ("Deno tests" "EUnit tests" "Integration tests"))
     (limitations . ("Requires running BEAM node" "Cannot mock BEAM internals")))))

(define autonomy-levels
  '((level-1-autonomous
     (actions . ("Format code" "Add ETF term types" "Write tests" "Update types"))
     (approval . "none"))

    (level-2-supervised
     (actions . ("Implement protocols" "Add Erlang modules" "Modify message handling"))
     (approval . "human-review"))

    (level-3-restricted
     (actions . ("Change connection logic" "Modify cookie handling" "Update distribution protocol"))
     (approval . "explicit-request"))

    (level-4-prohibited
     (actions . ("Store credentials" "Bypass security" "Auto-connect to nodes"))
     (approval . "never-autonomous"))))

(define decision-boundaries
  '((technical-decisions
     (agent-decides . ("ETF encoding details" "Internal message format" "Test structure"))
     (human-decides . ("Protocol choices" "Security model" "OTP patterns")))

    (cross-runtime-decisions
     (agent-decides . ("TypeScript types" "Erlang module structure"))
     (human-decides . ("API surface" "Interop semantics" "Error handling strategy")))

    (security-decisions
     (agent-decides . ("Input validation" "Error messages"))
     (human-decides . ("Cookie handling" "Authentication flow" "Network permissions")))))
