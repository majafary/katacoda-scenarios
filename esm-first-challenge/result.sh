(( $(cat test.txt | wc -w) == 2 )) && export pass=true
clear
node index.js