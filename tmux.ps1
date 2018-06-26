
param(
  [string]$e,
  [string]$c
)

function step($currentStep) {
  Write-Host "$currentStep"
}
function build {
  step("`nStarted docker build`n")
  docker build -f Dockerfile -t tmux .
}

$environment = $e
$cmd = $c
$userName = $env:UserName.ToLower()
if(-not $e)
{
  $environment = "dev01"
  Write-Host "`nEnvironment was set to $environment`n"
}

if($cmd -eq "build")
{
  build
}
if(-not (Test-Path env:PROJECT_HOME))
{
  return "`nERROR: Environment variable PROJECT_HOME is not set.`n";
}
if($cmd -eq "i")
{
  step("`nStarted docker interactively`n")
  docker run -v "$env:PROJECT_HOME\my_data_folder:/data" -it tmux
}
if($cmd -eq "hotfix")
{
  step("`nStarted docker interactively, without build`n")
  docker run -v "$env:PROJECT_HOME\my_data_folder:/data" -it tmux /bin/bash ./data/hotfix.sh $userName $environment
}
