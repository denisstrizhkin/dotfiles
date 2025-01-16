function ssurl_to_json
    set url $argv[1]
    ssurl --decode $url | jq | sed '$i\
        ,"local_port": 15080\
        ,"local_address": "127.0.0.1"' | jq
end
