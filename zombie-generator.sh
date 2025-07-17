#!/bin/bash
#Случайноечислоот1до10
NUM=$((RANDOM%10+1))
echo"Создаём$NUMзомби-процессов"
for i in $(seq1$NUM); do
#Создаёмдочернийпроцесс
(
    #ВнутридочернегопроцессазапускаемкороткийC-код,создающийзомби
    gcc - x c -o /tmp/zombie $i - <<EOF 
#include<unistd.h>
#include<stdlib.h>
intmain(){
    pid_tpid=fork();
    if(pid==0){
        _exit(0);//потомокзавершается,становитсязомби}
        else{
        sleep(600); //родитель"забывает"вызватьwait}
        return0;}EOF/tmp/zombie$i &
)
done
        echo"Проверьтеzombi-процессыспомощьюкоманды:psaux|grepZ"