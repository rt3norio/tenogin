###queridinhos###
alias redisflush="docker exec -it redis redis-cli flushall"
alias aliases="vim ~/.oh-my-zsh/plugins/tenogin/tenogin.plugin.zsh"
alias mata-tudo='echo "--- parando as imagens Docker em execução ---";docker kill $(docker ps -q);docker rm $(docker ps -a -q)'
alias tudomeu="sudo chown $UID:$GID * -R"
dips() { ##lista os ips do docker na maquina
  docker ps -q | xargs -n 1 docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{ .Name }}' | sed 's/ \// /' | grep "$1"
}
dce(){
  docker-compose exec php ${1:-'bash'}
}
deb() {
  echo "running: docker exec -it "$1" bash\n"
  docker exec -it "$1" bash
}
artisan(){
  docker-compose exec php php artisan
}
horizon(){
  docker-compose exec php php artisan horizon
}
meavise(){
    start=$(date +%s)
    "$@"
    [ $(($(date +%s) - start)) -le 5 ] || notify-send "Notification" "Long\
 running command \"$(echo $@)\" took $(($(date +%s) - start)) seconds to finish"
}
alias py="python3"


#acessando bancos
alias pgsql="docker exec -it postgres psql -U webadm"
alias mysqli='docker exec -it mysql mysql -U webadm --password="A123456"'
alias mongo='docker exec -it mongo mongo'

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


##comandos para o docker
alias dcd="docker-compose down --remove-orphans"
alias dcu="docker-compose up -d"
alias dcdu="dcd && dcu"


##coisas para o GIT
gitlogtestesyii(){
	git diff  "$(git describe --abbrev=0 --tags)"..origin/"$(git branch | grep \* | cut -d ' ' -f2)" --no-merges protected/tests
}
gitlogtudo(){
git diff --stat origin/master..origin/"$(git branch | grep \* | cut -d ' ' -f2)" --no-merges
}
deleteBranch(){
	git branch -D $1
	git push origin --delete $1
}
