clear
(( $(cat test.txt | wc -w) == 2 )) && export pass=true
node index.js