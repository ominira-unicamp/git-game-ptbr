#!/bin/bash
if [ -z $1 ]; then 
  echo "bem, alguém não quis rodar o script com um arquivo...";
  exit;
fi

file=$1
bug=7c85d987a917c2a555d1391426978f05
mesg="Nível 7: \n Linus esteve aqui...\nEu amo bagunçar com esses programadores amadores!!\nSe você quer diversão de verdade, então você devia tentar resolver um conflito entre essa branch (arvore) e code4life.\nEu introduzi um pequeno bug que você deve resolver no conflito. >:)\nDepois de dar merge nesses 2 arquivos você devia rodar o script shell novamente!!\n\nBoa Sorte!!!\n\n [Dica](https://docs.github.com/pt/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/resolving-a-merge-conflict-using-the-command-line)"
merges=$(git log --format=%h --merges | head -1)
csum="md5sum"
if [ $(echo "$OSTYPE" | grep darwin) ];then
    csum="md5"
fi

if [ "$file" = "proximadica_input.cpp" ];then 
  if [ ${merges} ]; then 
    while read p; do 
      for w in $p;do 
        if [ `echo $w | $csum | awk '{print $1}'` = $bug ];then 
          echo -e $mesg; 
          exit; 
        fi; 
      done;
    done < $file ;
    echo -e "Bem, parabéns!! Você consertou meus conflitos!!\nSe você gostaria de continuar, então você deveria ir para o branch $(echo 90mP8ouQHsNe | tr -d '0-9A-Z')!!\n" ;
   else 
     echo -e $mesg; 
     exit;
   fi; 
else 
  echo "Parece que você escolheu o arquivo errado";
fi
