#! /bin/sh

rsync -a --progress /home/elrick/ /mnt/Backups/Home_elrick_weekly/

# -a  : permet de s’assurer que les liens symboliques, dates de modification, propriétaires et permissions sur les fichiers, sont conservés lors du transfert. 

# --progress  : affiche la progression
