Attribute VB_Name = "NewMacros"
Sub Formattage()
Attribute Formattage.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Formattage"
'
' Formattage Macro
'
'
    Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 1")
    With Selection.Find
        .Text = "1. INFORMATIONS GÉNÉRALES"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .Replacement.Font.Bold = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll

   
        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 2")
    With Selection.Find
        .Text = "1.1. TITRE DU PROJET :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll

    
            Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 2")
    With Selection.Find
        .Text = "1.2. Durée du projet :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







            Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 2")
    With Selection.Find
        .Text = "1.3. Date prévue de début du projet (Année-Mois-Jour):"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll






            Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 1")
    With Selection.Find
        .Text = "2. RÉSUMÉ NON TECHNIQUE"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll






            Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 1")
    With Selection.Find
        .Text = "3. INFORMATIONS ADMINISTRATIVES ET RÉGLEMENTAIRES"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







            Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 2")
    With Selection.Find
        .Text = "3.1. L établissement utilisateur (EU)"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







            Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.1.1. Agrement de l EU où seront utilisés les animaux :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







            Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.1.2. Comité d'éthique agréé par le MESR dont relève l'EU :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll





    
    
            Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.1.3. Responsable(s) de la mise en œuvre générale du projet dans l'EU et de sa conformité à l'autorisation de projet :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







            Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.1.4. Responsable(s) du bien-être des animaux :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 2")
    With Selection.Find
        .Text = "3.2. Le personnel"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll






                Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 2")
    With Selection.Find
        .Text = "3.3. Le projet"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.3.1. L'objectif du projet :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll





    


    With Selection.Find
        .Text = "3.3.2. Description du projet :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll





    
    
                    Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.3.3. Précisez, le cas échéant, la ou les méthodes de mise à mort prévue(s) :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll





    
                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.3.4. Précisez, le cas échéant, les éléments scientifiques justifiant la demande de dérogation concernant la méthode de mise à mort envisagée :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll





    
    
    
                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.3.5. Stratégie d'expérimentation ou d'observation et approche statistique utilisée afin de réduire au minimum le nombre d'animaux, la douleur, la souffrance et l'angoisse, infligées"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll






                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "et l'impact environnemental, le cas échéant . si une étude statistique est prévue, indiquez et justifiez les tests choisis :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 2")
    With Selection.Find
        .Text = "3.4. Les animaux"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll








                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.1. Justifiez la nécessité d'avoir recours à des animaux pour atteindre les objectifs du projet :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll








                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.2. Espèces animales ou types d'animaux utilisés :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll








                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.3. Justifiez la pertinence de l'(des) espèce(s) animale(s) choisie(s) :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll








                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.5. S'agit-il de spécimens de primates non humains ?"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll








                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.6. S'agit-il d'animaux capturés dans la nature ?"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.7. S'agit-il d'animaux d'espèces domestiques, errants ou vivant à l'état sauvage ?"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.8. Catégorie des animaux utilisés dans le projet :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.9. Origine des animaux"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll








                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.10. Nombre estimé d'animaux utilisés dans le projet :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "Justification de ce nombre pour chacune des espèces animales utilisées :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll








                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.11. Indiquez à quel(s) stade(s) de développement les animaux seront utilisés et le justifier :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll








                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.12. Indiquez le sexe des animaux utilisés et le justifier :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "3.4.13. Indiquez pour chaque espèce les points limites adaptés, suffisamment prédictifs et précoces pour permettre de limiter la douleur à son minimum, sans remettre en cause les résultats du projet :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 1")
    With Selection.Find
        .Text = "4. LES PROCÉDURES EXPÉRIMENTALES "
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 2")
    With Selection.Find
        .Text = "4.1 Objet(s) visés par les procédures expérimentales "
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll








                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 2")
    With Selection.Find
        .Text = "4.2 Nombre de procédures expérimentales : "
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll







                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "NOM DE LA PROCÉDURE EXPÉRIMENTALE N° x :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll





    
                            Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 3")
    With Selection.Find
        .Text = "PROCEDURE "
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll





Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "PROPOSITION DE CLASSIFICATION DE LA PROCÉDURE SELON LE DEGRÉ DE SÉVÉRITE (conformément à l'annexe de l'arrêté relatif à l'autorisation de projet) :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll

Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "Description détaillée de la procédure expérimentale :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll


Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "Indiquez le nombre de lots et le nombre d'animaux par lots, et les justifier :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
    
    Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "- Indiquez le cas échéant le prélèvement, ainsi que la fréquence et le(s) volume(s) prélevés :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll

    Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "- Indiquez le cas échéant les méthodes pour réduire ou supprimer la douleur, la souffrance et l'angoisse [liste des médications . anesthésiques, analgésiques, anti-inflammatoires,"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll

    Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "en précisant les doses, voies, durées et fréquences d'administration], y compris le raffinement des conditions d'hébergement, d'élevage et de soins :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll

Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "- Indiquez le cas échéant les dispositions prises en vue de réduire, d'éviter et d'atténuer toute forme de souffrance des animaux de la naissance à la mort :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll


Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "- Dispositions prises pour éviter tout double emploi injustifié des procédures expérimentales, le cas échéant :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll


Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "- Indiquez le cas échéant le prélèvement, ainsi que la fréquence et le(s) volume(s) prélevés :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
    
    
    
Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "Quel est le devenir des animaux"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll




                        Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 2")
    With Selection.Find
        .Text = "4.3. Si le projet utilise des animaux réutilisés d'un projet antérieur :"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll


Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "L'avis vétérinaire est-il favorable en prenant en considération le sort de l'animal concerné sur toute sa durée de vie ?"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll


Selection.Find.Replacement.Style = ActiveDocument.Styles("Titre 4")
    With Selection.Find
        .Text = "L'animal réutilisé a-t-il pleinement recouvré son état de santé et de bien-être général ?"
        .Replacement.Text = .Text
        .Forward = True
        .Wrap = wdFindContinue
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll








End Sub
