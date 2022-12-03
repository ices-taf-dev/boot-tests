# List of Boot Functions

Below is a list of functions that call `boot.dir()` and how they should work
when the `boot` (or `bootstrap`) folder is not found.

Function         | What should happen (probably)
---------------- | ---------------------------------------------------------------------------
`clean`          | If `dirs` contains `"boot"` or `"bootstrap"`, then stop, otherwise go ahead
`draft.data`     | If `file=TRUE`, then stop
`draft.software` | If GitHub reference, then stop
