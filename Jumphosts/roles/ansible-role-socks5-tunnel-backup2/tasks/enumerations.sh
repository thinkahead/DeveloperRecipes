jh5_ip=jh5a,jh5b,jh5c
jh4_ip=jh4a,jh4b
jh3_ip=jh3a
jh2_ip=jh2a
jh1_ip=jh1a,jh1b

function enumerate {
  echo $(for var in `echo $1 | tr , " "`; do echo $var; done | sort -R)
  #echo $1 | tr , " "
}

echo "$jh1_ip -> $jh2_ip -> $jh3_ip -> $jh4_ip -> $jh5_ip"
for jh1ip in $(enumerate $jh1_ip); do
  if [ -z "$jh2_ip" ]; then
    echo "Trying $jh1ip"
  else
    for jh2ip in $(enumerate $jh2_ip); do
      if [ -z "$jh3_ip" ]; then
        echo "Trying $jh1ip -> $jh2ip"
      else
        for jh3ip in $(enumerate $jh3_ip); do
          if [ -z "$jh4_ip" ]; then
            echo "Trying $jh1ip -> $jh2ip -> $jh3ip"
          else
            for jh4ip in $(enumerate $jh4_ip); do
              if [ -z "$jh5_ip" ]; then
                echo "Trying $jh1ip -> $jh2ip -> $jh3ip -> $jh4ip"
              else
                for jh5ip in $(enumerate $jh5_ip); do
                  echo "Trying $jh1ip -> $jh2ip -> $jh3ip -> $jh4ip -> $jh5ip"
                done
              fi
            done
          fi
        done
      fi
    done
  fi
done

