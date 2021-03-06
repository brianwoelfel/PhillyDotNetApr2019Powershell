cls; Write-Host "#### SQL ####"
# Do this once on your machine: Install-Module "Invoke-SqlCmd2"
# Import-Module Invoke-SqlCmd2 # Load that library into memory
# Note: Invoke-SqlCmd is standard, but Invoke-SqlCmd2 supports parameterized queries
# See https://github.com/sqlcollaborative/Invoke-SqlCmd2

Invoke-SqlCmd2 `
    -ServerInstance "localhost\SQLExpress" <# database server #> `
    -Database "master" <# database name #>`
    -Query "select @fruit1 as fruit, 'carrot' as vegetable union select @fruit2, 'spinach' " <# sql #> `
    -SqlParameters @{ "fruit1"="apple"; "fruit2"="banana"; } <# sql params #> `
    `
    |  % { 
    # Loop through each row of result set, $_ is equivalent to a DataRow
    Write-Host "Fruit=$($_.Fruit), Vegetable=$($_.Vegetable)"
}