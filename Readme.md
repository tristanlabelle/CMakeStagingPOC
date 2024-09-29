# CMake Staging Proof of Concept
Implements staging CMake binaries and their runtime dependencies in a folder during the build phase, instead of using the install step.

Targets that contribute runtime dependencies, such as dlls, configuration files or localization files, can specify them using `target_runtime_dependencies(MyTarget File1.txt File2.winmd Directory)`.

An executable target can specify where it should be staged using `stage_target(MyTarget StagingDir)`. A generator expression will then extract all transitive runtime dependencies and copy them to the staging directory alongside the target binary itself when the executable target is built.

A project can have multiple staging directories if it builds multiple apps, and multiple executables can be staged to the same directory (the runtime dependency copies will be avoided as redundant). In this proof-of-concept, the application is staged in both `appbin` and the unit tests are staged in both `testbin`. Moreover, both executables are staged in `allbin` to show that overlapping dependencies is not a problem.