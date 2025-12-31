function pconf
    argparse --name=namespace 'n/namespace=?' -- $argv
    or return
    if not [ (count $argv) -eq 1 ]
        echo "usage: pconf [-n\"namespace\"] <pod name>"\n
        echo "Display istio proxy config for a given pod."
        echo "  depends: yq istioctl"
        return
    end
    set -l meshNamespace "istio-"(kubectl get cm blue-green-config -n platform-istio-rev-controller -o "jsonpath={.data['blue-green-config\.yaml']}" | yq '.platformRevision')
    if [ "$_flag_n" ]
        istioctl proxy-config all -i $meshNamespace $argv[1].$_flag_n | $EDITOR
    else
        istioctl proxy-config all -i $meshNamespace $argv[1] | $EDITOR
    end
end
