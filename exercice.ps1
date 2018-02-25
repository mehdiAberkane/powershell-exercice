<#
exercice 1 - Trouver les services qui sont démarré !
exercice 2 - Afficher toutes les CMDLETs disponibles en PS
exercice 3 - Afficher seulement les CMDLETs qui commence par Get
exercice 4 - Trouver comment naviguer entre les répertoires en PS 
exercice 5 - Trouver comment afficher le contenu du répertoire courant en PS
exercice 6 - Chercher sur votre OS tous les fichiers supérieur à 300 Mb
exercice 7 - vous devez trouver tous les fichiers de plus de 300 Mb et les mettres dans un fichier .csv

exercice 9 - vous devez trouver tous les fichier .txt et les renommer en .old
exercice 11 - créer 100 utilisateurs
exercice 12 - créer des utilisateurs à l'aide d'un fichier texte
exercice 13 - vous devez créer un script permettant la création d’un utilisateur de façon interactive
exercice 14 - vous devez créer un script permettant la création d’un utilisateur avec :
nom
mot de passe
téléphone
adresse société
adresse mail
intégré au groupe aston

exercice 15 - créer une  petite calculatrice en PS 
exercice 16 - faire un script qui demande à l’utilisateur d’entrer le numéro du département où il habite et le script affichera le nom de celui-ci.
#>

Function exo01
{
    Get-Service | Where-Object {$_.Status -eq "Running"}
}

Function exo02
{
    Get-Help * | Where-Object Category -eq 'Cmdlet'
}

Function exo03
{
    Get-Help * | Where-Object Name -Match "^Get.*"
}

Function exo04
{
    cd args[0]
}

Function exo05
{
    dir
}

Function exo06
{
    Get-ChildItem 'C:' -recurse | where-object {$_.length -gt 300000000} | Sort-Object length | Select-Object fullname, length
}

Function exo07
{
    Get-ChildItem 'C:' -recurse | where-object {$_.length -gt 300000000} | Sort-Object length | Select-Object fullname, length | Export-Csv -Path "data.csv"
}

Function exo08
{
    
}

Function exo09
{

}

Function exo10
{

}

Function exo11
{

}

Function exo12
{

}

Function exo13
{

}

Function exo14
{

}

Function exo15
{

}

Function exo16
{

}