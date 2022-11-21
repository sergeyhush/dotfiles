alias tf=terraform
alias tfv='terraform validate'
alias tfi='terraform init'
alias tfp='terraform plan'

# TerraForm MOdule Explained
function tfmoe {
  echo -e "\nOutputs:"
  grep -r "output \".*\"" $1 |awk '{print "\t",$2}' |tr -d '"'
  echo -e "\nVariables:"
  grep -r "variable \".*\"" $1 |awk '{print "\t",$2}' |tr -d '"'
}
