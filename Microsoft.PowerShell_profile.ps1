$OutputEncoding = New-Object -typename System.Text.UTF8Encoding
[Console]::OutputEncoding = New-Object -typename System.Text.UTF8Encoding

$ENV:JAVA_SDK_HOME=""
$ENV:JAVA_HOME=""
$ENV:GOPATH=""
$ENV:GO_BINS=""
$ENV:KOTLIN_HOME=""
$ENV:GRADLE_HOME=""
$ENV:RUBY_HOME=""
$ENV:GIT_HOME="C:\Program Files\Git\bin"
$ENV:VIM=""


$bin_folder = @(
  $ENV:GO_BINS,
  $ENV:KOTLIN_HOME,
  $ENV:GRADLE_HOME,
  $ENV:RUBY_HOME,
  $ENV:GIT_HOME,
  $ENV:VIM
  "$ENV:JAVA_SDK_HOME\bin"
  "$ENV:JAVA_HOME\bin"

)

foreach($path in $bin_folder){
  if($path -ne ""){
    $ENV:PATH += ";$PATH"
  }
}



Import-Module posh-gvm

