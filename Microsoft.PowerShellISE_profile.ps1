Function Format-Document {
param([int]$space=4)
$tab = ” “*$space
$numtab = 0
$text = $psise.CurrentFile.Editor.Text
$text2 = $text -split [environment]::newline
$here_string = $false
FOREACH($line_base in $text2)
{
$line = $line_base.trim()
if($line.endswith(‘@”‘) -or $line.endswith(“@'”))
{
$newtext += “{0}{1}” -f (($tab) + $line),[environment]::newline
$here_string=$true
}

elseif($line.startswith(‘”@’) -or $line.startswith(“‘@”))
{
$here_string = $false
$newtext+= $line,[environment]::newline
}

elseif($here_string -eq $true)
{
$newtext+=”{0}{1}” -f ($line),[environment]::newline
}
Else{
$tab = ” ” *(($space) *$numtab)
if($line.startswith(“}”) -or $line.EndsWith(“}”))
{
if($numtab -lt 1)
{
$numtab = 1
}
$numtab -= 1
}
if($line.StartsWith(“.”) -or $line.StartsWith(“”))
{
if($tab.Length -eq 1){
$tab = $tab.Substring(0,$tab.Length -1)
}
Else{
$tab = $tab.Substring(0,$tab.Length)}
}
if($line.StartsWith(“{“) -or $line.EndsWith(“{“))
{
$numtab +=1
}
if($numtab -lt 0)
{
$numtab = 0
}

$newtext += “{0}{1}” -f (($tab) + $line),[environment]::newline}

NEW-OBJECT PSOBJECT -Property @{
TAB_LENGTH =$TAB.Length
num_tab =$numtab
‘line#’=($newtext -split [environment]::newline).IndexOf($line_base)}
}

$newtext = ($newtext -split [environment]::newline)|select -First (($newtext -split [environment]::newline).count -1)
$psise.CurrentFile.Editor.Clear()
$psise.CurrentFile.Editor.InsertText($newtext)

}