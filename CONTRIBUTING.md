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
