<#
exercice 1 - Trouver les services qui sont démarré !
exercice 2 - Afficher toutes les CMDLETs disponibles en PS
exercice 3 - Afficher seulement les CMDLETs qui commence par Get
exercice 4 - Trouver comment naviguer entre les répertoires en PS 
exercice 5 - Trouver comment afficher le contenu du répertoire courant en PS
exercice 6 - Chercher sur votre OS tous les fichiers supérieur à 300 Mb
exercice 7 - vous devez trouver tous les fichiers de plus de 300 Mb et les mettres dans un fichier .csv
exercice 8 Écrire un programme qui écrit 500 fois « Je dois faire des sauvegardes régulières de mes fichiers. »
exercice 9 Écrire un programme qui affiche tous les nombres impairs entre 0 et 15000, par ordre croissant : « 1 3 5 7 ... 14995 14997 14999 »
exercice 10 Écrire un programme qui affiche la table de multiplication par 13
exercice 11 Ecrire un programme qui demande un mot à l’utilisateur et qui affiche à l’écran le nombre de lettres de ce mot.
exercice 12 Ecrire un programme qui demande un nombre entier à l’utilisateur. L’ordinateur affiche ensuite le message "Ce nombre est pair" ou "Ce nombre est impair" selon le cas.
exercice 13 Ecrire un programme qui demande un nombre compris entre 10 et 20, jusqu’à ce que la réponse convienne. En cas de réponse supérieure à 20, on fera apparaître un message : « Plus petit ! », et inversement, « Plus grand ! » si le nombre est inférieur à 10. 
exercice 14 Ecrire un programme qui demande un nombre de départ, et qui ensuite affiche les dix nombres suivants. Par exemple, si l'utilisateur entre le nombre 17, le programme affichera les nombres de 18 à 27. 
exercice 15 Ecrire un programme qui demande un nombre de départ, et qui ensuite écrit la table de multiplication de ce nombre.
exercice 16 Ecrire un programme qui demande un nombre de départ, et qui calcule la somme des entiers jusqu’à ce nombre. Par exemple, si l’on entre 5, le programme doit calculer : 1 + 2 + 3 + 4 + 5 = 15, afficher que le résultat 
exercice 17 Ecrire un programme qui demande l’âge d’un enfant à l’utilisateur. Ensuite il l’informe de sa catégorie :
		”Poussin” de 6 à 7 ans
		”Pupille” de 8 à 9 ans
		”Minime” de 10 à 11 ans
		”Cadet” après 12 ans
exercice 18 - vous devez trouver tous les fichier .txt et les renommer en .old
exercice 19 - faire un script qui demande à l’utilisateur d’entrer le numéro du département où il habite et le script affichera le nom de celui-ci.
aide: https://api.gouv.fr/api/api-geo.html
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
    for ($i = 0; $i -lt 500; $i++) {
        Write-Host "Je dois faire des sauvegardes régulières de mes fichiers."
    }
}

Function exo09
{
    for ($i = 1; $i -lt 1500; $i = $i + 2) {
        Write-Host $i
    }
}

Function exo10
{
    for ($i = 0; $i -lt 11; $i++) {
        $i * 13
    }
}

Function exo11
{
    $word = Read-Host 'Give me a word'
    $word.Length
}

Function exo12
{
    $number = Read-Host 'Give me a number'
    if ($number % 2)
    {
        Write-Host "Nombre impaire"
    }
    else
    {
        Write-Host "Nombre paire"
    }
}

Function exo13
{
    $number = Read-Host 'Give me a number between 10 and 20'
    if ($number -lt 10 -or $number -gt 20)
    {
        Write-Host "Bad"
        exo13
    }
    else
    {
        Write-Host "Good"
    }
}

Function exo14
{
    $number = Read-Host 'Give me a number'
    for ($i = [int]$number; $i -lt [int]$number + 10; $i++) {
        $i
    }
}

Function exo15
{
    $number = Read-Host 'Give me a number'
    for ($i = 0; $i -lt 11; $i++) {
        $i * [int]$number
    }
}

Function exo16
{
    $number = Read-Host 'Give me a number'
    $count = 0
    for ($i = 0; $i -le [int]$number; $i++) {
        $count = $count + $i
    }
    $count
}

Function exo17
{
    $number = Read-Host 'Give me a number'
    if ($number -ge 6 -and $number -le 7) {
        Write-Host "Poussin"
    }
    elseif ($number -ge 8 -and $number -le 9)
    {
        Write-Host "Pupille"
    }
    elseif ($number -ge 10 -and $number -le 11)
    {
        Write-Host "Minime"
    }
    elseif ($number -ge 12)
    {
        Write-Host "Cadet"
    }
    else
    {
        Write-Host "Too small"
    }
}

Function exo18
{
    Get-ChildItem -Path . -Filter *.old | Rename-Item -NewName {[System.IO.Path]::ChangeExtension($_.Name, ".txt")}
}

Function exo19 ($code)
{
    $url = "https://geo.api.gouv.fr/communes?codePostal=" + $code
    $reponse = Invoke-WebRequest $url  -Method 'GET'
    $reponse.Content
}