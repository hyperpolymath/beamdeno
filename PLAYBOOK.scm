;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; PLAYBOOK.scm — beamdeno

(define-module (beamdeno playbook)
  #:export (workflows runbooks procedures))

(define workflows
  '((development
     (setup
      (steps
       ("Clone repository" . "git clone https://github.com/hyperpolymath/beamdeno")
       ("Enter directory" . "cd beamdeno")
       ("Install Erlang/OTP" . "asdf install erlang latest")
       ("Run Deno tests" . "deno test")
       ("Run Erlang tests" . "cd beam && rebar3 eunit")))
     (daily
      (steps
       ("Pull latest" . "git pull origin main")
       ("Run tests" . "deno test && cd beam && rebar3 eunit")
       ("Check types" . "deno check deno/mod.ts"))))

    (release
     (prepare
      (steps
       ("Update version in deno.json" . "manual")
       ("Update version in beam/src/*.app.src" . "manual")
       ("Update CHANGELOG.adoc" . "manual")
       ("Run full test suite" . "deno test --coverage && cd beam && rebar3 ct")))
     (publish
      (steps
       ("Create git tag" . "git tag vX.Y.Z")
       ("Push with tags" . "git push origin main --tags")
       ("Publish Deno package to JSR" . "deno publish")
       ("Publish Erlang package to Hex" . "cd beam && rebar3 hex publish"))))))

(define runbooks
  '((incident-response
     (connection-failure
      (symptoms . ("Cannot connect to BEAM node" "Cookie mismatch errors"))
      (diagnosis . ("Verify BEAM node is running" "Check cookie configuration" "Check network connectivity"))
      (resolution . ("Restart BEAM node" "Update cookie" "Check firewall rules"))
      (prevention . ("Health check in connection setup" "Cookie rotation procedure")))

     (etf-decode-error
      (symptoms . ("Malformed ETF data" "Unknown term type"))
      (diagnosis . ("Log raw binary data" "Check BEAM version compatibility"))
      (resolution . ("Update ETF codec" "Add missing term type support"))
      (prevention . ("Comprehensive term type tests" "Version compatibility matrix")))

     (port-crash
      (symptoms . ("Port process died" "No response from BEAM"))
      (diagnosis . ("Check BEAM logs" "Verify port program exists"))
      (resolution . ("Restart port" "Fix port program crash"))
      (prevention . ("Supervisor-based port management" "Heartbeat monitoring"))))))

(define procedures
  '((connecting-to-beam
     (description . "How to establish connection to a BEAM node")
     (steps
      ("Start BEAM node" . "erl -sname myapp -setcookie mysecret")
      ("Import beamdeno" . "import { BeamConnection } from 'beamdeno'")
      ("Create connection" . "const beam = await BeamConnection.connect({ node: 'myapp@localhost', cookie: 'mysecret' })")
      ("Call functions" . "const result = await beam.call('erlang', 'now', [])")
      ("Close connection" . "await beam.close()")))

    (spawning-deno-from-beam
     (description . "How to spawn and manage Deno processes from BEAM")
     (steps
      ("Add beamdeno to deps" . "Add to rebar.config or mix.exs")
      ("Start Deno supervisor" . "beamdeno:start_link()")
      ("Spawn Deno worker" . "beamdeno:spawn_worker(Script, Args)")
      ("Send messages" . "beamdeno:send(WorkerPid, Message)")
      ("Receive responses" . "receive {deno_response, Response} -> Response end")))

    (genserver-from-deno
     (description . "How to call GenServer from Deno")
     (steps
      ("Import GenServerClient" . "import { GenServerClient } from 'beamdeno'")
      ("Connect to server" . "const client = await GenServerClient.connect('myserver@localhost')")
      ("Call synchronously" . "const result = await client.call({type: 'get_state'})")
      ("Cast asynchronously" . "await client.cast({type: 'update', data: value})")
      ("Subscribe to events" . "client.on('event', handler)")))))
