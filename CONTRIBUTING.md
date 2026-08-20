# How to Contribute

Your contributions to this project are welcome.  Submit issues or merge requests to get things started.

## Building

Windows + PowerShell. From VS Code, **Terminal > Run Build Task** (`Ctrl+Shift+B`)
runs the Quick build; a "Build Release" task is also defined. From a shell:

```powershell
.\build\build.ps1                    # Quick
.\build\build.ps1 -Preset Release    # + unit tests
.\build\buildInteractive.ps1         # menu: Quick / Release / pick steps
```

The result is `JMPScriptingTools_<version>_<state>.jmpaddin` in the repo root.
`buildInteractive.ps1` opens it in JMP automatically after a Quick build.

**Presets** (`build/presets/*.psd1`) are ordered lists of steps; each step is a
script in `build/pipeline/` taking `-ProjectRoot` and `-UpdateTime`.

| Step | Does |
|---|---|
| `Prepare` | Clears the temp workspace and stale `temp-*` files |
| `MakeDir` | Copies `AddinFiles/` to the temp workspace, stamps `buildDate` |
| `Docs` | NaturalDocs HTML, plus README/CHANGELOG to HTML, plus LICENSE |
| `Package` | Zips the workspace into `.jmpaddin` |
| `Test` | Installs the built add-in in each configured JMP and runs the suite |
| `Cleanup` | Removes the temp workspace |

Quick runs everything except `Test`.

**Local settings:** copy `build/buildConfig.ps1` values you need to override into
`build/buildConfig.local.ps1` (gitignored) — paths to NaturalDocs and JMP, and
`$JmpVersionsToTest`. Don't edit `buildConfig.ps1` for machine-specific paths.

Requires [NaturalDocs](https://www.naturaldocs.org/) for the `Docs` step and the
`MarkdownToHtml` PowerShell module (installed automatically on first run).

## Testing

Unit tests live in `Tests/UnitTests/` and use the
[jsl-hamcrest](https://github.com/jmp-community/jsl-hamcrest) add-in, which must
be installed in JMP.

- `Tests/RunTests.jsl` — interactive, opens a results window
- `Tests/RunTestsStandalone.jsl` — no user input, writes a JSON summary to
  `global:pathTestOutput`; this is what the `Test` build step runs
- `Tests/testConfig.default.jsl` — placeholder for machine-specific test
  settings; override in `testConfig.local.jsl` (gitignored)

`Test` fails the build if any test fails, or if no configured JMP version is
installed — a silent "nothing ran" is treated as a failure, not a pass.

## Versioning

Two-decimal scheme starting at **2.00** — `2.00`, `2.01`, ... `2.10`, not
JMPOSIPITools' four-decimal `0.1305` style. `state` is `DEV` between releases
and `RELEASE` for a shipped version; this repo has no separate `TEST` state.

**The README never names a version or state** — it says "the `.jmpaddin`
file", not a specific filename — so nothing there needs touching during a
release. If a future edit to the README adds one back in (a version badge, a
filename example), add updating it as a step below; until then this list is
everywhere a version number lives.

To release a new version:

1. Merge all feature branches that are ready into `main`.
2. Run `.\build\build.ps1 -Preset Release`; all unit tests must pass with no
   other errors.
3. Test add-in functionality manually — UI elements are not covered by unit
   tests.
4. Confirm NaturalDocs comments are current for anything changed.
5. Update these three files (don't commit yet):
   - `AddinFiles/customMetadata.jsl`: `addinVersion` to the new version,
     `state` to `RELEASE`.
   - `AddinFiles/addin.def`: `addinVersion` to match, `minJmpVersion` if the
     minimum changed.
   - `CHANGELOG.md`: replace `[HEAD]` with `[v<version>]`.
6. Run `.\build\build.ps1 -Preset Release` again and note the build date it
   reports.
7. Save the output `.jmpaddin` — this is what gets uploaded to GitHub and the
   JMP Community, not a later rebuild.
8. Update `AddinFiles/customMetadata.jsl`'s `buildDate` to match the build
   that produced the saved file.
9. Commit on `main`: `Version <version>`.
10. Create a git tag `v<version>` with message `Version <version>`, and a
    GitHub release from it — CHANGELOG section as the release notes, the
    `.jmpaddin` as a release asset.
11. Follow-up `bump` commit on `main`:
    - `customMetadata.jsl`: `addinVersion` up by `0.01`, `buildDate` up by 1,
      `state` back to `DEV`.
    - `addin.def`: `addinVersion` to match.
    - `CHANGELOG.md`: new `[HEAD]` section, duplicating the previous
      release's subheadings.
