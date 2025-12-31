function traffic-debug
    kubectl exec -it deploy/client -c client -n traffic-debug -- sh
end
