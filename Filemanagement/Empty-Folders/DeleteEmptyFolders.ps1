$Path = ""
#Now we delete the empty folders in base directory defined in params
param(
    [Parameter(Mandatory=$True)]
    [string] $Path
)
Get-ChildItem -Path $Path -Force -Recurse -Directory |
    Where-Object { (Get-ChildItem -Path $_.FullName -Recurse -File -EA SilentlyContinue |
        Measure-Object).Count -eq 0 } | Remove-Item -Force -Recurse