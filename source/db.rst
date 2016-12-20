
#######################################
Base de données
#######################################

Requêtes
========

Requêtes auxquelles la base de données doit pouvoir répondre efficacement :

Salles
------

*  Liste de toutes les salles du système avec leur nom et leur type (salle de cours normale / salle spéciale)
*  Pour une salle donnée, liste de toutes les réservations pour une période donnée (jour, semaine, mois, autre) caractérisée par une date/heure de début et une date/heure de fin
*  Lister toutes les salles réservées par un utilisateur donné sur une certaine période spécifiée par une date/heure de début et une date/heure de fin
*  Lister toutes les salles libres à une certaine période de la grille horaire (date/période)
*  Ajouter / modifier / supprimer une salle dans le système

Utilisateurs
------------

*  Insérer un nouvel utilisateur (action réalisable uniquement par l'administration)
*  Vérifier le mot de passe d'un utilisateur pour l'authentifier
*  Modifier les informations sur un utilisateur (Nom, prénom, courriel, ...)
*  Supprimer un utilisateur
*  optionnel : suspendre/désactiver le compte d'un utilisateur
*  Changer un utilisateur de statut (statut possible = ``teacher`` / ``admin``, éventuellement ``student`` par la suite)

Réservations
------------

*  Lister toutes les réservations pour une salle donnée sur une période donnée (début / fin)
*  Lister toutes les réservations effectuées par un utilisateur donné
*  créer une nouvelle réservation ponctuelle (nécessite les éléments suivants : utilisateur, salle, date + plage horaire, motif, groupe-classe)
*  Créer une nouvelle règle de réservation (réservation récurrente). C'est la solution à utiliser pour inscrire un cours hebdomadaire dans la salle. Il faut les informations suivantes :

   *  Créateur / propriétaire de la règle
   *  Professeur concerné
   *  Groupe-classe concerné
   *  début de validité
   *  fin de validité
   *  Salle concernée
   *  jour / période de réservation

*  Supprimer une réservation (étant donné un numéro (ID) de réservation à supprimer)

*  Modifier une réservation (uniquement faisable par le propriétaire ou un compte admin)

Analyse des besoins
===================

Ensembles d'entités
-------------------

*  Le système de réservation comporte au minimum les ensembles d'entités suivants : ``Room``, ``User``, ``Reservation``, ``StudentGroup``

Utilisateurs
------------

*  Les utilisateurs sont caractérisés par les informations suivantes : nom (``last_name``), prénom (``first_name``), adresse de courriel (``email``), téléphone (``phone``), type (prof / admin), statut (``status``) : actif, inactif.

*  Chaque utilisateur possède un compte utilisateur (``login``) et un mot de passe (``password``).

*  Les professeurs sont caractérisés par leur sigle unique (exemple : DONC / CHAJ) qui peut être sujet à modification.

Salles
------

*  Les salles sont caractérisées par un nom (exemples : ``201 (ARV)`` / ``123 (GEO/MUS)`` / ``203``) et un type (``standard`` / ``spécial`` ).

*  **Optionnel** : De plus, une salle peut n'être réservable que par l'administration et non les professeurs (les profs doivent passer par le secrétariat pour effectuer la réservation)

Groupes-classe
--------------

*  Les groupes-classe sont caractérisés par les informations suivantes : Nom (selon nomenclature de EDT), degré scolaire (1/2/3/4), école (gy, ecg, ec).

   .. tip::

      Les champs "degré scolaire" et "école" seront calculés automatiquement lors de l'initialisation de la base de données à partir des données tirées de EDT (fichier CSV)


Réservations
------------

*  Les réservations sont de deux types différents (disjoint et complet) : ponctuelle (``booking``) ou récurrente (``rule``).

*  Une réservation est effectuée pour une et une seule salle. Une salle peut être concernée par 0, 1 ou plusieurs réservations. Il ne peut cependant pas y avoir deux réservations pour la même salle lors d'une même période horaire.

*  Les réservations sont toutes implémentées comme des règles de récurrence, y compris les réservations ponctuelles uniques. Celles-ci sont simplement des règles de récurrence ne faisant intervenir qu'une seule récurrence (date de début de la récurrence identique à la date de fin de la récurrence).

*  Lors de la suppression d'une réservation, celle-ci ne doit pas être supprimée physiquement de la base de données mais uniquement désactivée. Cela permet notamment au secrétariat de connaître exactement tous les "mouvements" qui se sont effectués sur une salle.

Grille horaire et plages
------------------------

La semaine est subdivisée en jours et chaque jour est divisé en plages horaires. La durée des plages horaires et la pause entre chaque plage doit être flexible. Une plage horaire est caractérisée par les éléments suivants :

   *  Son rang dans la journée (1e, 2e, 3e, ..., N-ième) plage horaire
   *  Heure de début
   *  Heure de fin
   *  Le jour de la semaine, numéroté de 0 (lundi) à 4 (vendredi).

Schéma conceptuel (entités-associations)
=======================================

Voici le schéma conceptuel élaboré en classe dans la phase de mise en commun des
différentes idées :

.. raw:: html

   <script type="text/javascript" language="javascript" src="https://creately.com/player/createlyplayerstart.js"></script>
   <div id="creately-container-iwet2er11-Gaoyc5cBiGFB8T5TOzXqOvDvXcQ="></div>
   <script type="text/javascript">
   createlyPlayerStart( {
   container: "creately-container-iwet2er11-Gaoyc5cBiGFB8T5TOzXqOvDvXcQ=",
   docid :"iwet2er11-Gaoyc5cBiGFB8T5TOzXqOvDvXcQ=",
   title :"Document 1",
   width :600,height :400,bgcolor :"#eeeeee"
   } );</script>


.. .. figure:: files/ea-diagram/version1a.png
..    :align: center
..    :width: 100%
..
..    Schéma entité-associations de la base de données à implémenter


Commentaires sur le schéma EA
-----------------------------

*  Dans ce modèle, il n'y a plus qu'une sorte de réservation : les réservations récurrentes. La raison est que les réservations ponctuelles sont comme des règles récurrente qui ne contiennent qu'une seule répétition à une date fixe (``start_date == end_date``).

*  Il y a deux liens différents entre la table ``Reservation`` et la table ``User`` qui ont une signification différente.

   *  Le lien ``Owns`` entre les ensembles d'entités ``Reservation`` et ``User`` représente l'utilisateur de la base de données qui possède la réservation. Dans le cas des règles de récurrence liées au cours habituels, c'est le secrétariat (administration) qui possède la règle de récurrence et les professeurs ne peuvent pas y toucher.

   *  Le lien ``benefits`` indique le ou les utilisateurs qui bénéficient de la réservation. Dans le cas d'un cours planifié par le système EDT et inscrit comme une réservation récurrente appartenant à l'administration, le ou les bénéficiaires sont le ou les enseignants qui donnent le cours à ce moment.


Schéma relationnel
==================

Le schéma relationnel représente les tables à créer dans la base de données ainsi que les liens qu'elles entretiennent entre elles. Celui-ci a été créé à l'aide de MySQLWorkbench même si la base de données finale sera probablement une base de données PostgreSQL.


Instructions DDL
================


Modèle SQLAlchemy
=================

.. admonition:: Remarque
   :class: warning

   Cette partie est laissée pour plus tard
