# JMP Scripting Tools

## Overview

Scripting Tools is a JMP add-in for the JSL work you do constantly and
shouldn't have to script by hand: copying the script behind a column, a row
state, or a whole table; renaming columns by regular expression; building
custom column formulas; and inspecting the scriptable object of a report.
Everything lives under Add-Ins > Scripting Tools.

## What's included

### Columns

- **Rename Columns:** Rename selected columns by matching a regular expression, with a preview before applying.
- **Copy Column Script:** Copy the JSL that recreates the selected column, formula included.
- **Custom Transformation:** Build a reusable column transformation from a formula you supply.
- **Copy Column States Script:** Copy the JSL that restores the current column states.
- **Select Columns in Clipboard:** Select the columns named in the clipboard.
- **Copy Selected Columns to Clipboard as List:** Copy selected column names as a JSL list, `{ :Column 1, :Column 2 }`.
- **Copy Selected Columns Names to Clipboard as One-Per-Line:** Copy selected column names as plain text, one per line.

### Rows

- **Copy Row State Script:** Copy the JSL that recreates every current row state.
- **Copy Row State Script - Limited:** Same as above, but only selected, hidden, and excluded row states.

### Tables

- **Copy Table Script without Data:** Copy the table script with the `NoData` keyword.

### Other

- **Get Window Scriptable Object:** Write the commands the current report accepts to the JMP log.
- **Preferences:** Access add-in settings, including the logging level.
- **About:** View version, license, and documentation information.

## Requirements

- JMP 13 or newer

## Install

1. Download the `.jmpaddin` file from the
   [Releases page](https://github.com/himanga/JMPScriptingTools/releases) or from 
   the [JMP Marketplace](https://marketplace.jmp.com/appdetails/Scripting+Tools).
2. Double-click the file, or open it from JMP with **File > Open**.
3. JMP will ask to install the add-in. The tools appear under
   **Add-Ins > Scripting Tools**.

To update, install the newer file over the top. To remove it, use
**View > Add-Ins** (Windows) or **Window > Add-Ins** (macOS).

## Logging and privacy

The add-in *can* keep a **local diagnostic log** to help troubleshoot problems. 
It is written to a file on your own machine and is **never uploaded or sent 
anywhere** — the add-in makes no network calls of any kind. 

The first time the add-in loads it asks, and logging stays off unless you 
say yes. You can change the level — or turn it off completely — at any time under
**Add-Ins > Scripting Tools > Preferences**, where the log file's location is
also shown.

## License

GPL v3: see [LICENSE](LICENSE). This add-in is free software; you may
redistribute and modify it under those terms.

## Want to connect with other users about this add-in?

Post on the [JMP Community](https://community.jmp.com/) or on the 
[JMP Marketplace](https://marketplace.jmp.com/appdetails/Scripting+Tools)

## Found a bug, or want a feature?

Open an issue on GitHub:
[github.com/himanga/JMPScriptingTools/issues](https://github.com/himanga/JMPScriptingTools/issues).
That's also where source, pull requests, and releases live.

## Contributing and building

Build instructions, the test suite, and coding conventions are in
[CONTRIBUTING.md](CONTRIBUTING.md). Issues and pull requests are welcome.
