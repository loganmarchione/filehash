# filehash
PowerShell script (first one ever!) to check a calculated hash (including MD5 or SHA1) against a known hash.  

## Requirements
Should work with any Windows version with PowerShell.  
Tested on Windows 7 with PowerShell 4.

## Usage  
`.\filehash.ps1 Path_to_file provided_hash hash_algorithm`

## Example  
`.\filehash.ps1 C:\Path\to\file.zip 1234567890123456789012345678901234567890 SHA1`

### Output if matching  
```
InputObject                                                 SideIndicator
-----------                                                 -------------
FB9C9AB7DA8E7C9A7078D13E6390F98FBFF26287                    ==


Hashes DO match
Provided:    FB9C9AB7DA8E7C9A7078D13E6390F98FBFF26287
Calculated:  FB9C9AB7DA8E7C9A7078D13E6390F98FBFF26287
```

### Output if not matching  
```
InputObject                                                 SideIndicator
-----------                                                 -------------
FB9C9AB7DA8E7C9A7078D13E6390F98FBFF26287                    =>
FB9C9AB7DA8E7C9A7078D13E6390F98FBFF2628G                    <=


Hashes DO NOT match
Provided:    FB9C9AB7DA8E7C9A7078D13E6390F98FBFF2628G
Calculated:  FB9C9AB7DA8E7C9A7078D13E6390F98FBFF26287
```
