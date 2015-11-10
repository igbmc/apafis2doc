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
        .Text = "1. INFORMATIONS G�N�RALES"
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
        .Text = "1.2. Dur�e du projet :"
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
        .Text = "1.3. Date pr�vue de d�but du projet (Ann�e-Mois-Jour):"
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
        .Text = "2. R�SUM� NON TECHNIQUE"
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
        .Text = "3. INFORMATIONS ADMINISTRATIVES ET R�GLEMENTAIRES"
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
        .Text = "3.1. L �tablissement utilisateur (EU)"
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
        .Text = "3.1.1. Agrement de l EU o� seront utilis�s les animaux :"
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
        .Text = "3.1.2. Comit� d'�thique agr�� par le MESR dont rel�ve l'EU :"
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
        .Text = "3.1.3. Responsable(s) de la mise en �uvre g�n�rale du projet dans l'EU et de sa conformit� � l'autorisation de projet :"
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
        .Text = "3.1.4. Responsable(s) du bien-�tre des animaux :"
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
        .Text = "3.3.3. Pr�cisez, le cas �ch�ant, la ou les m�thodes de mise � mort pr�vue(s) :"
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
        .Text = "3.3.4. Pr�cisez, le cas �ch�ant, les �l�ments scientifiques justifiant la demande de d�rogation concernant la m�thode de mise � mort envisag�e :"
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
        .Text = "3.3.5. Strat�gie d'exp�rimentation ou d'observation et approche statistique utilis�e afin de r�duire au minimum le nombre d'animaux, la douleur, la souffrance et l'angoisse, inflig�es"
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
        .Text = "et l'impact environnemental, le cas �ch�ant . si une �tude statistique est pr�vue, indiquez et justifiez les tests choisis :"
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
        .Text = "3.4.1. Justifiez la n�cessit� d'avoir recours � des animaux pour atteindre les objectifs du projet :"
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
        .Text = "3.4.2. Esp�ces animales ou types d'animaux utilis�s :"
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
        .Text = "3.4.3. Justifiez la pertinence de l'(des) esp�ce(s) animale(s) choisie(s) :"
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
        .Text = "3.4.5. S'agit-il de sp�cimens de primates non humains ?"
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
        .Text = "3.4.6. S'agit-il d'animaux captur�s dans la nature ?"
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
        .Text = "3.4.7. S'agit-il d'animaux d'esp�ces domestiques, errants ou vivant � l'�tat sauvage ?"
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
        .Text = "3.4.8. Cat�gorie des animaux utilis�s dans le projet :"
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
        .Text = "3.4.10. Nombre estim� d'animaux utilis�s dans le projet :"
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
        .Text = "Justification de ce nombre pour chacune des esp�ces animales utilis�es :"
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
        .Text = "3.4.11. Indiquez � quel(s) stade(s) de d�veloppement les animaux seront utilis�s et le justifier :"
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
        .Text = "3.4.12. Indiquez le sexe des animaux utilis�s et le justifier :"
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
        .Text = "3.4.13. Indiquez pour chaque esp�ce les points limites adapt�s, suffisamment pr�dictifs et pr�coces pour permettre de limiter la douleur � son minimum, sans remettre en cause les r�sultats du projet :"
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
        .Text = "4. LES PROC�DURES EXP�RIMENTALES "
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
        .Text = "4.1 Objet(s) vis�s par les proc�dures exp�rimentales "
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
        .Text = "4.2 Nombre de proc�dures exp�rimentales : "
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
        .Text = "NOM DE LA PROC�DURE EXP�RIMENTALE N� x :"
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
        .Text = "PROPOSITION DE CLASSIFICATION DE LA PROC�DURE SELON LE DEGR� DE S�V�RITE (conform�ment � l'annexe de l'arr�t� relatif � l'autorisation de projet) :"
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
        .Text = "Description d�taill�e de la proc�dure exp�rimentale :"
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
        .Text = "- Indiquez le cas �ch�ant le pr�l�vement, ainsi que la fr�quence et le(s) volume(s) pr�lev�s :"
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
        .Text = "- Indiquez le cas �ch�ant les m�thodes pour r�duire ou supprimer la douleur, la souffrance et l'angoisse [liste des m�dications . anesth�siques, analg�siques, anti-inflammatoires,"
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
        .Text = "en pr�cisant les doses, voies, dur�es et fr�quences d'administration], y compris le raffinement des conditions d'h�bergement, d'�levage et de soins :"
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
        .Text = "- Indiquez le cas �ch�ant les dispositions prises en vue de r�duire, d'�viter et d'att�nuer toute forme de souffrance des animaux de la naissance � la mort :"
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
        .Text = "- Dispositions prises pour �viter tout double emploi injustifi� des proc�dures exp�rimentales, le cas �ch�ant :"
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
        .Text = "- Indiquez le cas �ch�ant le pr�l�vement, ainsi que la fr�quence et le(s) volume(s) pr�lev�s :"
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
        .Text = "4.3. Si le projet utilise des animaux r�utilis�s d'un projet ant�rieur :"
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
        .Text = "L'avis v�t�rinaire est-il favorable en prenant en consid�ration le sort de l'animal concern� sur toute sa dur�e de vie ?"
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
        .Text = "L'animal r�utilis� a-t-il pleinement recouvr� son �tat de sant� et de bien-�tre g�n�ral ?"
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
