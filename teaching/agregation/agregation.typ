#import "../../utils/utils.typ": *
#show: basic-page.with(include-header: false)

Voici les lecons que j'ai préparé avec mes camarades de classe pendant l'année 2024-2025 :

- Alexis Hamont
- Adrien Decosse
- Axel Stengel
- Alois Rautureau
- Benjamin Voisin
- Paul Adam (moi)
- Sarah Santiago Batista

#let lecons = (
  "01_Correction/01_Correction.typ",
  "02_Paradigme/02_Paradigme.typ",
  "03_Test/03_Test.typ",
  "04_Induction/04_Induction.typ",
  "05_Piles_Files/05_Piles_Files.typ",
  "06_Dict_Set/06_Dict_Set.typ",
  "07_Graphes/07_Graphes.typ",
  "08_Tris/08_Tris.typ",
  "09_Texte/09_Texte.typ",
  "10_Arbres/10_Arbres.typ",
  "11_Proba_Approx/11_Proba_Approx.typ",
  "12_Glouton_Backtrack/12_Glouton_Backtrack.typ",
  "13_Diviser_Regner/13_Diviser_Regner.typ",
  "14_Prog_Dyn/14_Prog_Dyn.typ",
  "15_Apprentissage/15_Apprentissage.typ",
  "16_Jeux/16_Jeux.typ",
  "17_Ordonnancement/17_Ordonnancement.typ",
  "18_Coordination/18_Coordination.typ",
  "19_Bit_Abstraction/19_Bit_Abstraction.typ",
  "20_Synchro/20_Synchro.typ",
  "21_Manip_Données/21_Manip_Données.typ",
  "22_Circuit_Bool/22_Circuit_Bool.typ",
  "23_Archi_ASM/23_Archi_ASM.typ",
  "24_Routage/24_Routage.typ",
  "25_Client_Server/25_Client_Server.typ",
  "26_Archi_Internet/26_Archi_Internet.typ",
  "27_Modèle_Relatio/27_Modèle_Relatio.typ",
  "28_SQL/28_SQL.typ",
  "29_Lang_Automate/29_Lang_Automate.typ",
  "30_Grammaires_algébrique/30_Grammaires_algébrique.typ",
  "31_P_NP/31_P_NP.typ",
  "32_Decidabilite/32_Decidabilite.typ",
  "33_Formule_Prop/33_Formule_Prop.typ",
)
#for lecon in lecons {
  pdf-show-link(
    "teaching/agregation/" + lecon,
    page: 4,
  )[ #lecon.split("/").at(0).slice(3) ]
}

