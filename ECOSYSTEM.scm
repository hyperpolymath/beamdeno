;; SPDX-License-Identifier: PMPL-1.0
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — beamdeno

(ecosystem
  (version "0.1.0")
  (name "beamdeno")
  (type "library")
  (purpose "Bidirectional bridge between Deno and BEAM (Erlang/Elixir/Gleam)")

  (position-in-ecosystem
    "Connects JavaScript/TypeScript world to the BEAM actor model. Part of
     hyperpolymath's Deno-as-hub infrastructure. Unique in providing both
     Deno→BEAM and BEAM→Deno directions in one package.")

  (related-projects
    (project (name "bundeno")
             (url "https://github.com/hyperpolymath/bundeno")
             (relationship "sibling-bridge"))
    (project (name "deno-bunbridge")
             (url "https://github.com/hyperpolymath/deno-bunbridge")
             (relationship "sibling-bridge"))
    (project (name "v-deno")
             (url "https://github.com/hyperpolymath/v-deno")
             (relationship "sibling-bridge"))
    (project (name "deno")
             (url "https://deno.land")
             (relationship "runtime"))
    (project (name "erlang-otp")
             (url "https://www.erlang.org")
             (relationship "target-runtime"))
    (project (name "elixir")
             (url "https://elixir-lang.org")
             (relationship "target-runtime"))
    (project (name "gleam")
             (url "https://gleam.run")
             (relationship "target-runtime"))
    (project (name "rustler")
             (url "https://github.com/rusterlium/rustler")
             (relationship "inspiration")))

  (what-this-is
    "- TypeScript library for Deno → BEAM communication"
    "- Erlang/Elixir library for BEAM → Deno management"
    "- ETF (Erlang Term Format) encoder/decoder"
    "- Port-based and distribution protocol communication"
    "- GenServer client from Deno"
    "- Deno process supervision from BEAM")

  (what-this-is-not
    "- NOT a BEAM runtime in JavaScript"
    "- NOT a replacement for Phoenix Channels (use those for web)"
    "- NOT limited to one direction (supports both Deno→BEAM and BEAM→Deno)"))
