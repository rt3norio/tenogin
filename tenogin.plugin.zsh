###queridinhos###

alias redisflush="docker exec -it redis redis-cli flushall"
alias pgsql="docker exec -it postgres psql -U webadm"
alias aliases="vim ~/.oh-my-zsh/plugins/tenogin/tenogin.plugin.zsh"
alias mata-tudo='echo "--- parando as imagens Docker em execu��o ---";docker kill $(docker ps -q);docker rm $(docker ps -a -q)'
alias mysqli='docker exec -it mysql mysql -U webadm --password="A123456"'
alias tudomeu="sudo chown $UID:$GID * -R"

dips() {
  docker ps -q | xargs -n 1 docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{ .Name }}' | sed 's/ \// /' | grep "$1"
}

dce(){
  docker-compose exec php bash
}

deb() {
  echo "running: docker exec -it "$1" bash\n"
  docker exec -it "$1" bash
}


##Estatisticas dos comandos mais utilizados
hstatistics(){
  echo "Estatistica para dois comandos"
  history | awk '{CMD[$2"_"$3]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20;
  echo "estatistica para um comando"
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20;
}

##CD + pasta projetos com autocomplete
cdp() { cd ~/projetos/$1; }
compctl -W ~/projetos/ -/ cdp





alias ytmp3="youtube-dl --extract-audio --audio-format mp3"
alias dcd="docker-compose down --remove-orphans"
alias dcu="docker-compose up -d"
alias dpbm="docker exec -it php-pbm bash"
alias dtt="docker exec -it php-tradetools bash"
alias dcdu="dcd && dcu"
alias ttworker="docker exec -i php-tradetools ./protected/yiic worker umTrabalho"
alias ttyiic="docker exec -i php-tradetools ./protected/yiic"
alias tt="cd ~/projetos/tradetools"
alias i3conf="vim ~/.config/i3/config"
alias wireless-config="nmtui"
alias testesTradetools='tt && ./protected/data/recria_bases_paralelo.sh rt -vv'
alias umTesteTradetools="docker exec -it php-tradetools ./vendor/bin/phpunit "






horizon(){
  docker-compose exec php php artisan horizon
}

gitlogtestes(){
	git diff  "$(git describe --abbrev=0 --tags)"..origin/"$(git branch | grep \* | cut -d ' ' -f2)" --no-merges protected/tests
}

gitlogtudo(){
git diff --stat origin/master..origin/"$(git branch | grep \* | cut -d ' ' -f2)" --no-merges
}


deleteBranch(){
	git branch -D $1
	git push origin --delete $1
}

ttTest() {
	~/projetos/tradetools/protected/data/recria_bases_paralelo.sh;
	docker exec -it php-tradetools bash -c 'find protected/tests/ -name "*Test.php" | vendor/bin/fastest "vendor/bin/phpunit {}"'
}

meavise(){
    start=$(date +%s)
    "$@"
    [ $(($(date +%s) - start)) -le 5 ] || notify-send "Notification" "Long\
 running command \"$(echo $@)\" took $(($(date +%s) - start)) seconds to finish"
}

transfer(){
	git checkout $1
	git pull origin $1
	git push oficial $1
}

alias py="python3"
