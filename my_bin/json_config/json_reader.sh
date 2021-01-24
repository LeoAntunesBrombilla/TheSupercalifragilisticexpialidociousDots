
readarray -t valuesOne < <(jq -r '.[]' test_one.json)
declare -A assArray1=(["hello"]=123456 ["world"]=7890)


for val in ${valuesOne[@]}; do
    echo "$val"
done

echo "\n\n\n\n"


for key in ${!valuesOne[@]}; do
    echo "$key -> ${valuesOne[$key]}"
done

for key in ${!assArray1[@]}; do # ! is for keys, not ! is for vals
    echo "$key -> ${assArray1[$key]}"
done

