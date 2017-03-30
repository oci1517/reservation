
#######################################
Préparation à l'atelier
#######################################

Pour être efficaces, il est conseillé aux participants de l'atelier de se
préparer en apprenant les technologies suivantes qui leur seront de toute
manière très utiles dans leur future vie de programmeur.

Pour les étudiants de 3 OCI
===========================

Comptes à créer
---------------

Créer les comptes suivants qui seront utilisés pendant l'atelier (tout est gratuit) :

*   Gmail : un compte Gmail (http://mail.google.com) si vous n'en disposez pas encore
*   GitHub : http://www.github.com (indiquer votre adresse Gmail lors de la création du compte)
*   Cloud9 : http://c9.io : utiliser le compte github pour se connecter.
*   Udacity : http://www.udacity.com : créer votre compte à l'aide de votre compte google
*   Codecademy : http://www.codecademy.com : identifiez-vous à l'aide de votre compte Google

Apprendre les lignes de commandes dans le terminal Linux
------------------------

..  admonition:: Commandes à maîtriser
    :class: note

    Pour interagir avec une machine Linux, en particulier le shell *Bash*
    utilisé dans la console Cloud9, il est crucial de bien maîtriser les
    commandes suivantes :

    ..  code-block:: Bash

        # afficher le répertoire courant (process working directory = PWD)
        pwd

        # afficher le contenu d'un dossier
        ls <directory name>
        
        # afficher le contenu
        ls -al <directory>

        # exemple : afficher le contenu du dossier courant 
        ls -al .
        ls -al

        # afficher le contenu du dossier ``files``
        ls -al files

        # navigation dans les dossiers

        # se rendre dans le dossier ``dir-name``
        cd <dir-name>

        # remonter dans le dossier parent 
        cd ..

        # créer un dossier
        mkdir <dir-name>

        #exemple : créer le dossier ``static``
        mkdir static

        # afficher le contenu d'un fichier
        cat <filepath>
        cat index.html

        # lancer un script Python depuis la console
        python script.py

        # créer un environnement virtuel Python
        sudo apt-get install python-virtualenv
        virtualenv -p python3 venv

        # activer l'environnement virtuel Python
        source venv/bin/activate

        # installer un package Python dans l'environnement virtuel (ici le pckage flask)
        pip install flask

*   Pour ceux qui préfèrent la lecture (anglais), avec exercices interactifs :
    https://www.codecademy.com/learn/learn-the-command-line

*   Cours Udacity sur le terminal Linux (vidéos en anglais) :
    https://www.udacity.com/course/linux-command-line-basics--ud595

..  admonition:: Pour ceux qui n'aiment pas l'anglais
    :class: warning

    Il est possible d'apprendre ces compétences également à l'aide du cours
    "Reprendre le contrôle avec Linux" sur OpenClassrooms en lisant (et testant
    dans Cloud9) les chapitres suivants :

    *   https://openclassrooms.com/courses/reprenez-le-controle-a-l-aide-de-linux/la-console-ca-se-mange
    *   https://openclassrooms.com/courses/reprenez-le-controle-a-l-aide-de-linux/entrer-une-commande
    *  https://openclassrooms.com/courses/reprenez-le-controle-a-l-aide-de-linux/la-structure-des-dossiers-et-fichiers
    *   https://openclassrooms.com/courses/reprenez-le-controle-a-l-aide-de-linux/manipuler-les-fichiers


GitHub / git
------------

L'utilitaire *git* fait partie intégrante de l'outillage indispensable de tout
développeur qui se respecte. Il permet la collaboration sur un même code source
sans se marcher sur les pieds. Il est indispensable de maitriser les bases de
*git* pour ne pas patauger durant tout l'atelier. On ne peut quasiment rien
faire sans *git*.

..  admonition:: Commandes git à maîtriser
    :class: note

    ..  code-block:: bash

        # création d'un dépôt git dans le dossier courant
        $ git init

        # ceci crée un dossier caché .git dans lequel toutes les commits (versions)
        # du code source sont stockées
        $ ls -al

        # ajout d'un fichier particulier dans la zone de transit (staging area)
        $ git add <filename>

        # ajout de tous les fichiers dans le dossier courant
        $ git add .

        # simuler les ajouts sans les effectuer
        $ git add --dry-run .

        # afficher le status du repo (dépôt)
        $ git status

        # afficher l'historique des révisions
        $ git log

        # lister les branches
        $ git branch

        # créer une nouvelle branches
        $ git branch <new-branch-name>

        # changer dans la branche <other-branch>
        $ git checkout <other-branch>

        # fusionner les commits de la branche <other-branch> dans la branche <dest-branch>
        $ git checkout <dest-branch>
        $ git merge <other-branch>

        # pousser les modifications de la branche ``master`` sur un remote (en général GitHub)
        $ git push origin master

        # récupérer (=tirer) les commits depuis le remote (en général origin)
        $ git pull

        # afficher les différences entre deux commits
        $ git diff <commit1> <commit2>
    


*   Cours interactif sur codecademy :
    https://www.codecademy.com/learn/learn-git.
    
    ..  tip:: 
    
        Les commandes *git* doivent être saisies dans directement dans le
        terminal intégré à la page du cours.

*   Si vous ne comprenez pas trop le cours précédent, il faut peut-être viser du
    côté de OpenClassrooms avec le cours suivant qui pourra clarifier le concept
    de contrôle des versions avec *git*.
    https://openclassrooms.com/courses/gerer-son-code-avec-git-et-github
    
    ..  tip::
    
        Utiliser la version de *git* préinstallée dans Cloud9 pour expérimenter
        avec les commandes *git* de ce cours.

*   Cours Udacity très détaillé : https://classroom.udacity.com/courses/ud775/

    ..  tip:: Cours prendre git / GitHub à fond

        Ceci ne devrait par contre pas être une priorité pour vous préparer à
        l'atelier : le cours codecademy est certainement suffisant pour comprendre
        git. Pour avoir une compréhension plus détaillée, le cours suivant peut être
        utile, mais il prend beaucoup de temps à suivre complètement.



Bases de données relationnelles / SQL
-------------------------------------

Pour bien comprendre comment la base de données du projet est structurée et
comment interagir avec la base de données, il faut comprendre un minimum comment
fonctionne le modèle relationnel et la manière d'interroger les bases de données
relationnelles. Il n'est pas nécessaire d'apprendre en détails le langage SQL
car nous allons utiliser l'ORM SQLAlchemy pour effectuer les requêtes à la base
de données.

Modèle relationnel et structures des bases de données
+++++++++++++++++++++++++++++++++++++++++++++++++++++

*   Cours OCI 4 (Cédric Donner) : http://oci.donner-online.ch/files-db/rel_mod/intro.html
*   Comprendre le modèle relationnel de la base de données que nous allons utiliser : http://oci.donner-online.ch/reservation/db.html#schema-relationnel

Langage d'interrogation de bases de données SQL
+++++++++++++++++++++++++++++++++++++++++++++++

*   Très bonne introduction interactive au langage SQL : https://www.codecademy.com/learn/learn-sql
*   Entraînement au langage SQL : http://sqlzoo.net/

Pour aller plus loin
++++++++++++++++++++

*   Cours Udacity sur les bases de données relationnelles : https://www.udacity.com/course/intro-to-relational-databases--ud197


Pour tous les participants
==========================

Développement côté serveur
--------------------------

Framework Flask
+++++++++++++++

Le serveur HTTP de notre application Web sera développé avec le framework Python
Flask. Cela permettra à ceux qui ne connaissent pas trop le Javascript de
s'occuper plutôt de la partie serveur.

*   Cours Udacity "Full Stack Foundations" : https://www.udacity.com/course/full-stack-foundations--ud088
*   Cours Udacity "Designing RESTful APIs" : https://www.udacity.com/course/designing-restful-apis--ud388

*   Cours Udacity "Intro to Backend" : https://classroom.udacity.com/courses/ud171/

..  admonition:: Matériel supplémentaire (privé / disponible sur demande)
    :class: tip

    Je peux fournir sur demande le livre PDF ainsi que les deux cours vidéo
    mentionnés sur le site https://flaskbook.com/#

    Voici encore d'autres cours qu'il est possible de suivre sur demande :

    *   https://www.udemy.com/python-flask-course/
    *   https://www.udemy.com/advanced-python-flask/
    *   https://www.udemy.com/rest-api-flask-and-python/
    *   https://www.udemy.com/docker-flask-course/
    *   https://www.udemy.com/the-build-a-saas-app-with-flask-course/

Développement Frontend
++++++++++++++++++++++

..  admonition:: Pas encore disponible
    :class: warning
    
    Des cours sur Udemy ou d'autres plateformes peuvent être mis à disposition
    pour développer une interface JavaScript moderne. J'attends cependant un
    moment de discussion pour mettre à disposition ces cours.


Développement Mobile
++++++++++++++++++++

..  admonition:: Pas encore disponible
    :class: warning

    Des cours sur Udemy ou d'autres plateformes peuvent être mis à disposition
    pour développer une interface JavaScript moderne. J'attends cependant un
    moment de discussion pour mettre à disposition ces cours.
