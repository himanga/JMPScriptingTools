# JMP Scripting Tools

A JMP add-in with small tools that save time when you are writing JSL or
reverse-engineering someone else's table: copy the script behind a column,
a row state, or a whole table; rename columns by regular expression; build
custom column formulas; and get the scriptable object of any report.

Everything lives under **Add-Ins > Scripting Tools**.

## Requirements

- JMP 13 or later (Windows and macOS)
- No other add-ins required

## Install

1. Download the `.jmpaddin` file from the
   [Releases page](https://github.com/himanga/JMPScriptingTools/releases).
2. Double-click it, or open it from JMP with **File > Open**.
3. JMP will ask to install the add-in. The tools appear under
   **Add-Ins > Scripting Tools**.

To update, install the newer file over the top. To remove it, use
**View > Add-Ins** (Windows) or **Window > Add-Ins** (macOS).

## What's included

### Columns

| Command | Does |
|---|---|
| Rename Columns | Rename selected columns by matching a regular expression, with a preview before applying |
| Copy Column Script | Copy the JSL that recreates the selected column, formula included |
| Custom Transformation | Build a reusable column transformation from a formula you supply |
| Copy Column States Script | Copy the JSL that restores the current column states |
| Select Columns in Clipboard | Select the columns named in the clipboard |
| Copy Selected Columns to Clipboard as List | Copy selected column names as a JSL list, `{ :Column 1, :Column 2 }` |
| Copy Selected Columns Names to Clipboard as One-Per-Line | Copy selected column names as plain text, one per line |

### Rows

| Command | Does |
|---|---|
| Copy row state script | Copy the JSL that recreates every current row state |
| Copy row state script - limited | Same, but only selected, hidden and excluded |

### Tables

| Command | Does |
|---|---|
| Copy Table Script without Data | Copy the table script with the `NoData` keyword |

### Other

| Command | Does |
|---|---|
| Get Window Scriptable Object | Write the commands the current report accepts to the JMP log |
| Preferences | Add-in settings, including the logging level |
| About | Version, license and documentation |

## Logging and privacy

The add-in can keep a **local diagnostic log** to help troubleshoot problems.
It is written to a file on your own machine and is **never uploaded or sent
anywhere** — the add-in makes no network calls of any kind.

The log records which commands you ran, any errors, and your Windows username
and computer name (so separate sessions can be told apart when
troubleshooting).

**Nothing is logged until you choose to enable it.** The first time the add-in
loads it asks, and logging stays off unless you say yes. You can change the
level — or turn it off completely — at any time under
**Add-Ins > Scripting Tools > Preferences**, where the log file's location is
also shown.

| Level | Records |
|---|---|
| Off | nothing at all |
| Error | failures only |
| Warn | failures and warnings |
| Info | the above, plus which commands you ran (default) |
| Debug | everything, for troubleshooting |

## License

GPL v3 — see [LICENSE](LICENSE). This add-in is free software; you may
redistribute and modify it under those terms.

## Contributing and building

Build instructions, the test suite, and coding conventions are in
[CONTRIBUTING.md](CONTRIBUTING.md). Issues and pull requests are welcome.
