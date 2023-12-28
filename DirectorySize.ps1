#Script to read a path provided by the user, and then determine the size of all files and subdirectories in this path in Megabytes, then calculate the total size in Gigabytes.

$Path = Read-Host "Please enter the full path" 
while ($Path -ne "quit") {
    foreach ($file in Get-ChildItem $Path -Force) {
        $sizeInMegabytes = $file.Length / 1MB
        $fileInfo = "$($file.Name) - $($sizeInMegabytes) MB"
        Write-Output $fileInfo
    }
    Write-Output "Total size in Gigabytes:"
    (Get-ChildItem $Path -Recurse -File | Measure-Object Length -Sum).Sum / 1GB 

    $Path = Read-Host "Please enter the full path again, or 'quit' to exit:"
}
