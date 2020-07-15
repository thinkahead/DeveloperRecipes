jh5_ip=jh5a,jh5b,jh5c
jh4_ip=jh4a,jh4b
jh3_ip=jh3a
jh2_ip=jh2a
jh1_ip=jh1a,jh1b

echo "$jh1_ip -> $jh2_ip -> $jh3_ip -> $jh4_ip -> $jh5_ip"
for jh1ip in $(echo $jh1_ip | sed "s/,/ /g"); do
  if [ -z "$jh2_ip" ]; then
    echo "Trying $jh1ip"
  else
    for jh2ip in $(echo $jh2_ip | sed "s/,/ /g"); do
      if [ -z "$jh3_ip" ]; then
        echo "Trying $jh1ip -> $jh2ip"
      else
        for jh3ip in $(echo $jh3_ip | sed "s/,/ /g"); do
          if [ -z "$jh4_ip" ]; then
            echo "Trying $jh1ip -> $jh2ip -> $jh3ip"
          else
            for jh4ip in $(echo $jh4_ip | sed "s/,/ /g"); do
              if [ -z "$jh5_ip" ]; then
                echo "Trying $jh1ip -> $jh2ip -> $jh3ip -> $jh4ip"
              else
                for jh5ip in $(echo $jh5_ip | sed "s/,/ /g"); do
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

