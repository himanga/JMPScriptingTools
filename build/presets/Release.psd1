<#
About: Release Preset

Full release build. Generates docs, packages the add-in, and runs unit
tests against all configured JMP versions.

Section: Globals
#>
@{
    Steps = @(
        'Prepare'
        'MakeDir'
        'Docs'
        'Package'
        'Test'
        'Cleanup'
    )
}
