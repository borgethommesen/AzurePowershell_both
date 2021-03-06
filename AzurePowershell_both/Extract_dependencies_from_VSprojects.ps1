﻿function Get-ProjectReferences
{
    param(
        [Parameter(Mandatory)]
        [string]$rootFolder,
        [string[]]$excludeProjectsContaining
    )
    dir $rootFolder -Filter *.csproj -Recurse |
        # Exclude any files matching our rules
        where { $excludeProjectsContaining -notlike "*$($_.BaseName)*" } |
        Select-References
}
function Select-References
{
    param(
        [Parameter(ValueFromPipeline, Mandatory)]
        [System.IO.FileInfo]$project,
        [string[]]$excludeProjectsContaining
    )
    process
    {
        $projectName = $_.BaseName
        [xml]$projectXml = Get-Content $_.FullName
        $ns = @{ defaultNamespace = "http://schemas.microsoft.com/developer/msbuild/2003" }
        $projectXml |
            # Find the references xml nodes
            Select-Xml '//defaultNamespace:ProjectReference/defaultNamespace:Name' -Namespace $ns |
            # Get the node values
            foreach { $_.node.InnerText } |
            # Exclude any references pointing to projects that match our rules
            where { $excludeProjectsContaining -notlike "*$_*" } |
            # Output in yuml.me format
            foreach { "[" + $projectName + "] -> [" + $_ + "]" }
    }
}
$excludedProjects = "Test1", "Test2"
Get-ProjectReferences "C:\Users\both\Documents" -excludeProjectsContaining $excludedProjects | ` 
Out-File "C:\Users\both\Documents\References.txt"