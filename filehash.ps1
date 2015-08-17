# filehash.ps1
# Script to calculate hash from a file

# Usage
# .\filehash.ps1 Path_to_file provided_hash hash_algorithm

# Example
# .\filehash.ps1 C:\Path\to\file.zip 1234567890123456789012345678901234567890 SHA1

# Set parameters from command line (see above for usage and example)
Param (
[string]$File=$(throw("You must specify a filename.")),
[string]$ProvidedHash,
[string]$Algorithm=("SHA1")  #Sets default to SHA1, others include SHA256, SHA384, SHA512, MACTripleDES, MD5, RIPEMD160
)

# Set hash to upper-case. This is only done for readability, as PS is case-insensitive by default.
$ProvidedHash=$ProvidedHash.ToUpper()

# Calculate hash and output to variable
$CalcHash = Get-FileHash $File -Algorithm $Algorithm | select -expand Hash

# Show comparison table
Compare-Object  -IncludeEqual -ReferenceObject $ProvidedHash -DifferenceObject $CalcHash

write-host "`n"

# Show comparison details
if ( $CalcHash -eq $ProvidedHash ) {
	Write-Host "Hashes DO match" -ForegroundColor Green;
	Write-Host "Provided:   " $ProvidedHash
	Write-Host "Calculated: " $CalcHash
}
else {
	Write-Host "Hashes DO NOT match" -ForegroundColor Red
	Write-Host "Provided:   " $ProvidedHash
	Write-Host "Calculated: " $CalcHash
}
