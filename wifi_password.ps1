param (
    [string] $name
)


# Write-Host $name.GetType()
# Write-Host $args.GetType()
# Write-Host $args.Length

if ($args.Length -eq 0) {
    Write-Host "parameter -name required"
    Exit
}

$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = [Text.UTF8Encoding]::UTF8

$output = netsh wlan show profile name=$name key=clear

foreach ($index in 0..($output.Length - 1)) {
    $item = $output[$index]
    $item | Out-File  -FilePath .\out_put.txt   -Append
    $key_word = "Key"
    if ($item.Contains($key_word)) {
        $password = $item.Split(':')[1].Trim()
        Write-Host "Name : $name"
        Write-Host "Password : $password"
    }
}

